<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id'])){
        $invoiceId      = isset($_GET['id']) ? (int)$_GET['id'] : 0;
        $invoiceData    = $invoiceId ? getRentalInvoiceById($invoiceId) : null;
        $invoiceMaster  = $invoiceData['master'] ?? [];
        $invoiceDetails = $invoiceData['details'] ?? [];

        if ($_SESSION['logged']['user_type'] == 'whm') {
            $warehouse_id = $_SESSION['logged']['warehouse_id'];
            $sqlWarehouse = "SELECT * FROM inv_warehosueinfo WHERE `id`='$warehouse_id'";
            $resultWarehouse = mysqli_query($conn, $sqlWarehouse);
            $rowWarehouse = mysqli_fetch_array($resultWarehouse);
            $short_name = $rowWarehouse['short_name'] ?? 'CW';
            $rentCode = 'RCH-' . $short_name;
        } else {
            $rentCode = 'IGR-INV-';
        }
        $defaultChallan = getDefaultCategoryCodeByWarehouseT('rental_invoice_master', 'challan_no', '03d', '001', $rentCode);

        $invoiceDateValue   = $invoiceMaster['invoice_date'] ?? date('Y-m-d');
        $clientIdValue      = $invoiceMaster['client_id'] ?? '';
        $projectIdValue     = $invoiceMaster['project_id'] ?? '';
        $referenceNameValue = $invoiceMaster['reference_name'] ?? '';
        $challanNoValue     = $invoiceMaster['challan_no'] ?? $defaultChallan;
        $issueNoValue       = $invoiceMaster['issue_no'] ?? $defaultChallan;
        $billYearValue      = isset($invoiceMaster['bill_year']) ? (int)$invoiceMaster['bill_year'] : (int)date('Y');
        $billMonthValue     = isset($invoiceMaster['bill_month']) ? (int)$invoiceMaster['bill_month'] : (int)date('n');
        $billDaysValue      = isset($invoiceMaster['bill_days']) ? (int)$invoiceMaster['bill_days'] : cal_days_in_month(CAL_GREGORIAN, $billMonthValue, $billYearValue);
        $subTotalValue      = $invoiceMaster['sub_total_amount'] ?? '';
        $discountValue      = $invoiceMaster['discount_amount'] ?? '';
        $grandTotalValue    = $invoiceMaster['grand_total_amount'] ?? '';
        $paidAmountValue    = $invoiceMaster['paid_amount'] ?? '';
        $dueAmountValue     = $invoiceMaster['due_amount'] ?? '';
        $remarksValue       = $invoiceMaster['remarks'] ?? '';

        if (empty($invoiceDetails)) {
            $invoiceDetails[] = [
                'equipment_code'  => '',
                'operator_name'   => '',
                'full_time_hours' => '',
                'rate'            => '',
                'amount'          => '',
                'total_days'      => $billDaysValue,
            ];
        }

        $detailRowCount   = count($invoiceDetails);
        $subTotalDisplay  = ($subTotalValue === '' || $subTotalValue === null) ? '' : number_format((float)$subTotalValue, 2, '.', '');
        $discountDisplay  = ($discountValue === '' || $discountValue === null) ? '' : number_format((float)$discountValue, 2, '.', '');
        $grandTotalDisplay= ($grandTotalValue === '' || $grandTotalValue === null) ? '' : number_format((float)$grandTotalValue, 2, '.', '');
        $paidDisplay      = ($paidAmountValue === '' || $paidAmountValue === null) ? '' : number_format((float)$paidAmountValue, 2, '.', '');
        $dueDisplay       = ($dueAmountValue === '' || $dueAmountValue === null) ? '' : number_format((float)$dueAmountValue, 2, '.', '');
?>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<style>
.reqfield{
	color:red;
	font-size:10px;
}
</style>
<form action="" method="post">
    <input type="hidden" name="invoice_id" value="<?php echo htmlspecialchars((string)$invoiceId); ?>">
    <div class="row" id="printableArea" style="display:block;">
        <div class="col-xs-1">
            <div class="form-group">
                <label>Date</label>
                <input type="text" autocomplete="off" name="date" id="issue_date" class="form-control datepicker" value="<?php echo htmlspecialchars($invoiceDateValue); ?>">
            </div>
        </div>
        <div class="col-xs-2">
            <div class="form-group">
                <label for="id">Client name</label>
                <select name="client_name" id="client" class="form-control select2" data-selected="<?php echo htmlspecialchars($clientIdValue); ?>">
                    <option value="">Select Client</option>
                    <?php 
                    $sql	= "select * from `clients` ORDER BY `id` ASC";
                    $result = mysqli_query($conn, $sql);
                    while($row=mysqli_fetch_array($result))
                        {
                            $selected = ($row['id'] == $clientIdValue) ? 'selected' : '';
                    ?>
                    <option value="<?php echo $row['id']; ?>" <?php echo $selected; ?>><?php echo $row['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>

        <div class="col-xs-2">
            <div class="form-group">
                <label for="id">Project name</label>
                <select class="form-control select2" name="project_name" id="project" data-selected="<?php echo htmlspecialchars($projectIdValue); ?>">
                    <option value="">Select Project</option>
                    <?php 
                    $sql	= "select * from `projects` ORDER BY `id` ASC";
                    $result = mysqli_query($conn, $sql);
                    while($row=mysqli_fetch_array($result))
                        {
                            $selected = ($row['id'] == $projectIdValue) ? 'selected' : '';
                    ?>
                    <option value="<?php echo $row['id']; ?>" <?php echo $selected; ?>><?php echo $row['project_name']; ?></option>
                    <?php } ?>

                </select>
            </div>
        </div>

        <div class="col-xs-2">
            <div class="form-group">
                <label for="id">Ref. Name</label>
                <input name="ref_name" type="text" class="form-control" value="<?php echo htmlspecialchars($referenceNameValue); ?>" size="30" autocomplete="off" />
            </div>
        </div>
        <div class="col-xs-2">
            <div class="form-group">
                <label>Invoice No</label>
                <input type="text" name="challan_no" id="issue_id" class="form-control" value="<?php echo htmlspecialchars($challanNoValue); ?>" readonly>
                <input type="hidden" name="issue_no" id="issue_no" value="<?php echo htmlspecialchars($challanNoValue); ?>">
            </div>
        </div>
        <div class="col-xs-1">
            <div class="form-group">
                <label for="bill_year_global">Bill Year</label>
                <select name="bill_year" id="bill_year_global" class="form-control" required>
                    <?php
                    $currentYear = (int)date('Y');
                    $startYear = $currentYear - 2;
                    $endYear = $currentYear + 3;
                    for ($year = $startYear; $year <= $endYear; $year++) {
                        $selected = ($year === (int)$billYearValue) ? 'selected' : '';
                        echo "<option value=\"{$year}\" {$selected}>{$year}</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="col-xs-1">
            <div class="form-group">
                <label for="bill_month_global">Bill Month</label>
                <select name="bill_month" id="bill_month_global" class="form-control" required>
                    <option value="">Select Month</option>
                    <?php
                    $months = [
                        1 => 'January',
                        2 => 'February',
                        3 => 'March',
                        4 => 'April',
                        5 => 'May',
                        6 => 'June',
                        7 => 'July',
                        8 => 'August',
                        9 => 'September',
                        10 => 'October',
                        11 => 'November',
                        12 => 'December'
                    ];
                    foreach ($months as $monthNumber => $monthName) {
                        $selected = ($monthNumber === (int)$billMonthValue) ? 'selected' : '';
                        echo "<option value=\"{$monthNumber}\" {$selected}>{$monthName}</option>";
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="col-xs-1">
            <div class="form-group">
                <label for="bill_days_global">Days</label>
                <input type="text" name="bill_days" id="bill_days_global" class="form-control" value="<?php echo htmlspecialchars((string)$billDaysValue); ?>" readonly>
            </div>
        </div>
        <div class="col-sm-12">
            <?php include('partial/rent_items_table.php'); ?>
        </div>

        <div class="col-md-12">
            <div class="form-group">
                <label for="remarks">Remarks:</label>
                <textarea class="form-control summernote" id="remarks" name="remarks" rows="1"><?php echo $remarksValue; ?></textarea>
            </div>
        </div>

        <div class="col-sm-12">
            <input type="submit" name="rental_invoice_save" id="submit" class="btn btn-block btn-primary" value="<?php echo $invoiceId ? 'Update Data' : 'Save Data'; ?>" />
        </div>
    </div>
</form>

<?php } ?>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script language="JavaScript" type="text/javascript">
            $(document).ready(function() {
            $('.summernote').summernote({
                height: 150
            });

		
        });
         
        </script>
