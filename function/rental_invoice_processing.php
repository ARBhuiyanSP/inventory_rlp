<?php

if (!function_exists('sanitize')) {
    function sanitize($value)
    {
        global $conn;
        return mysqli_real_escape_string($conn, trim($value));
    }
}

function getRentalInvoiceList()
{
    global $conn;

    $sql = "SELECT rim.*, c.name AS client_name, p.project_name
            FROM rental_invoice_master rim
            LEFT JOIN clients c ON rim.client_id = c.id
            LEFT JOIN projects p ON rim.project_id = p.id
            ORDER BY rim.invoice_date DESC, rim.id DESC";

    $result = mysqli_query($conn, $sql);
    $data = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $data[] = $row;
        }
    }

    return $data;
}

function getRentalInvoiceById($invoiceId)
{
    global $conn;
    $invoiceId = (int)$invoiceId;
    if ($invoiceId <= 0) {
        return null;
    }

    $sqlMaster = "SELECT * FROM rental_invoice_master WHERE id = {$invoiceId} LIMIT 1";
    $resultMaster = mysqli_query($conn, $sqlMaster);
    if (!$resultMaster || mysqli_num_rows($resultMaster) === 0) {
        return null;
    }
    $master = mysqli_fetch_assoc($resultMaster);

    $sqlDetails = "SELECT * FROM rental_invoice_details WHERE rental_invoice_id = {$invoiceId} ORDER BY id ASC";
    $resultDetails = mysqli_query($conn, $sqlDetails);
    $details = [];
    if ($resultDetails) {
        while ($row = mysqli_fetch_assoc($resultDetails)) {
            $details[] = $row;
        }
    }

    return [
        'master'  => $master,
        'details' => $details,
    ];
}

if (isset($_POST['rental_invoice_save'])) {
    global $conn;

    $invoiceId            = isset($_POST['invoice_id']) ? (int)$_POST['invoice_id'] : 0;
    $isUpdate             = $invoiceId > 0;
    $invoiceDate          = isset($_POST['date']) ? sanitize($_POST['date']) : date('Y-m-d');
    $clientId             = isset($_POST['client_name']) ? (int)$_POST['client_name'] : 0;
    $projectId            = isset($_POST['project_name']) ? (int)$_POST['project_name'] : 0;
    $referenceName        = isset($_POST['ref_name']) ? sanitize($_POST['ref_name']) : '';
    $challanNo            = isset($_POST['challan_no']) ? sanitize($_POST['challan_no']) : '';
    $issueNo              = isset($_POST['issue_no']) ? sanitize($_POST['issue_no']) : '';
    $billYear             = isset($_POST['bill_year']) ? (int)$_POST['bill_year'] : (int)date('Y');
    $billMonth            = isset($_POST['bill_month']) ? (int)$_POST['bill_month'] : (int)date('n');
    $billDays             = isset($_POST['bill_days']) ? (int)$_POST['bill_days'] : 0;
    $subTotalAmount       = isset($_POST['sub_total_amount']) ? (float)$_POST['sub_total_amount'] : 0.00;
    $discountAmount       = isset($_POST['discount']) ? (float)$_POST['discount'] : 0.00;
    $grandTotalAmount     = isset($_POST['grandtotal']) ? (float)$_POST['grandtotal'] : 0.00;
    $paidAmount           = isset($_POST['paid_amount']) ? (float)$_POST['paid_amount'] : 0.00;
    $dueAmount            = isset($_POST['due_amount']) ? (float)$_POST['due_amount'] : 0.00;
    $remarks              = isset($_POST['remarks']) ? mysqli_real_escape_string($conn, $_POST['remarks']) : '';
    $createdBy            = isset($_SESSION['logged']['user_id']) ? (int)$_SESSION['logged']['user_id'] : 0;
    $now                  = date('Y-m-d H:i:s');

    $equipments           = isset($_POST['equipments']) ? $_POST['equipments'] : [];
    $operators            = isset($_POST['operator']) ? $_POST['operator'] : [];
    $fullTimeHours        = isset($_POST['full_time_hours']) ? $_POST['full_time_hours'] : [];
    $rates                = isset($_POST['unit_price']) ? $_POST['unit_price'] : [];
    $amounts              = isset($_POST['totalamount']) ? $_POST['totalamount'] : [];
    $totalDaysItems       = isset($_POST['total_days']) ? $_POST['total_days'] : [];

    $redirectUrl = $isUpdate ? "rental-invoice.php?id={$invoiceId}" : "rental-invoice.php";

    if (empty($equipments)) {
        $_SESSION['warning'] = "Please add at least one equipment row.";
        header("Location: {$redirectUrl}");
        exit();
    }

    $duplicateWhere = "challan_no='{$challanNo}'";
    $notWhere = $isUpdate ? "id!={$invoiceId}" : '';
    if (isDuplicateData('rental_invoice_master', $duplicateWhere, $notWhere)) {
        $_SESSION['warning'] = "Duplicate challan no detected. Please review.";
        header("Location: {$redirectUrl}");
        exit();
    }

    mysqli_begin_transaction($conn);

    try {
        if ($invoiceId) {
            $sqlUpdate = sprintf(
                "UPDATE rental_invoice_master SET invoice_date='%s', client_id=%d, project_id=%d, reference_name='%s', challan_no='%s', issue_no='%s', bill_year=%d, bill_month=%d, bill_days=%d, sub_total_amount=%.2f, discount_amount=%.2f, grand_total_amount=%.2f, paid_amount=%.2f, due_amount=%.2f, remarks='%s', updated_at='%s' WHERE id=%d",
                $invoiceDate,
                $clientId,
                $projectId,
                $referenceName,
                $challanNo,
                $issueNo,
                $billYear,
                $billMonth,
                $billDays,
                $subTotalAmount,
                $discountAmount,
                $grandTotalAmount,
                $paidAmount,
                $dueAmount,
                $remarks,
                $now,
                $invoiceId
            );
            if (!mysqli_query($conn, $sqlUpdate)) {
                throw new Exception("Failed to update invoice master: " . mysqli_error($conn));
            }

            $sqlDelete = "DELETE FROM rental_invoice_details WHERE rental_invoice_id = {$invoiceId}";
            if (!mysqli_query($conn, $sqlDelete)) {
                throw new Exception("Failed to reset invoice details: " . mysqli_error($conn));
            }
        } else {
            $sqlInsert = sprintf(
                "INSERT INTO rental_invoice_master (invoice_date, client_id, project_id, reference_name, challan_no, issue_no, bill_year, bill_month, bill_days, sub_total_amount, discount_amount, grand_total_amount, paid_amount, due_amount, remarks, created_by, created_at) VALUES ('%s', %d, %d, '%s', '%s', '%s', %d, %d, %d, %.2f, %.2f, %.2f, %.2f, %.2f, '%s', %d, '%s')",
                $invoiceDate,
                $clientId,
                $projectId,
                $referenceName,
                $challanNo,
                $issueNo,
                $billYear,
                $billMonth,
                $billDays,
                $subTotalAmount,
                $discountAmount,
                $grandTotalAmount,
                $paidAmount,
                $dueAmount,
                $remarks,
                $createdBy,
                $now
            );
            if (!mysqli_query($conn, $sqlInsert)) {
                throw new Exception("Failed to insert invoice master: " . mysqli_error($conn));
            }
            $invoiceId = mysqli_insert_id($conn);
        }

        $rowCount = count($equipments);
        for ($index = 0; $index < $rowCount; $index++) {
            $equipmentCode = isset($equipments[$index]) ? sanitize($equipments[$index]) : '';
            if (empty($equipmentCode)) {
                continue;
            }
            $operatorName  = isset($operators[$index]) ? sanitize($operators[$index]) : '';
            $rowHours      = isset($fullTimeHours[$index]) ? (float)$fullTimeHours[$index] : 0.00;
            $rowRate       = isset($rates[$index]) ? (float)$rates[$index] : 0.00;
            $rowAmount     = round($rowHours * $rowRate, 2);
            $postedAmount  = isset($amounts[$index]) ? (float)$amounts[$index] : 0.00;
            if (!empty($postedAmount)) {
                $rowAmount = round($postedAmount, 2);
            }
            $rowDays       = isset($totalDaysItems[$index]) ? (int)$totalDaysItems[$index] : $billDays;

            $sqlDetail = sprintf(
                "INSERT INTO rental_invoice_details (rental_invoice_id, equipment_code, operator_name, total_days, full_time_hours, rate, amount, created_at) VALUES (%d, '%s', '%s', %d, %.2f, %.2f, %.2f, '%s')",
                $invoiceId,
                $equipmentCode,
                $operatorName,
                $rowDays,
                $rowHours,
                $rowRate,
                $rowAmount,
                $now
            );

            if (!mysqli_query($conn, $sqlDetail)) {
                throw new Exception("Failed to insert invoice detail: " . mysqli_error($conn));
            }
        }

        mysqli_commit($conn);

        $_SESSION['success'] = $isUpdate ? "Rental invoice updated successfully." : "Rental invoice created successfully.";
        header("Location: rental_invoice_list.php");
        exit();
    } catch (Exception $ex) {
        mysqli_rollback($conn);
        $_SESSION['warning'] = "Operation failed: " . $ex->getMessage();
        header("Location: {$redirectUrl}");
        exit();
    }
}

