<?php
$rentalInvoices = getRentalInvoiceList();
?>
<?php if (!empty($rentalInvoices)) { ?>
<div class="table-responsive">
    <table id="rental_invoice_table" class="table table-bordered table-striped" width="100%">
        <thead>
            <tr>
                <th>Challan No</th>
                <th>Invoice Date</th>
                <th>Client</th>
                <th>Project</th>
                <th>Bill Period</th>
                <th>Grand Total</th>
                <th>Paid</th>
                <th>Due</th>
                <th width="15%">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($rentalInvoices as $invoice) { 
                $billMonthName = date('F', mktime(0, 0, 0, (int)$invoice['bill_month'], 1));
            ?>
            <tr>
                <td><?php echo htmlspecialchars($invoice['challan_no']); ?></td>
                <td><?php echo htmlspecialchars(date('Y-m-d', strtotime($invoice['invoice_date']))); ?></td>
                <td><?php echo htmlspecialchars($invoice['client_name'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($invoice['project_name'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($billMonthName . ', ' . $invoice['bill_year']); ?></td>
                <td><?php echo number_format((float)$invoice['grand_total_amount'], 2); ?></td>
                <td><?php echo number_format((float)$invoice['paid_amount'], 2); ?></td>
                <td><?php echo number_format((float)$invoice['due_amount'], 2); ?></td>
                <td>
                    <a class="btn btn-sm btn-info" href="rental_invoice_view.php?id=<?php echo (int)$invoice['id']; ?>">View</a>
                    <a class="btn btn-sm btn-primary" href="rental-invoice.php?id=<?php echo (int)$invoice['id']; ?>">Edit</a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
<?php } else { ?>
<div class="alert alert-warning">
    <strong>No rental invoices found.</strong>
</div>
<?php } ?>
