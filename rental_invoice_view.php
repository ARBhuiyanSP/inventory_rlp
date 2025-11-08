<?php
include 'header.php';

$invoiceId = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$invoiceData = $invoiceId ? getRentalInvoiceById($invoiceId) : null;
if (!$invoiceData) {
    echo '<div class="container-fluid"><div class="alert alert-warning mt-3">Invoice not found.</div></div>';
    include 'footer.php';
    exit();
}

$master = $invoiceData['master'];
$details = $invoiceData['details'];

$clientName = getNameByIdAndTable('clients', $master['client_id']);
$projectName = getProjectNameById($master['project_id']);
$billMonthName = date('F', mktime(0, 0, 0, (int)$master['bill_month'], 1));
$grandTotal = (float)$master['grand_total_amount'];
$subTotal = (float)$master['sub_total_amount'];
$discountAmount = (float)$master['discount_amount'];
$amountInWords = ucfirst(numberToWords($grandTotal));
?>
<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item"><a href="rental_invoice_list.php">Rental Invoice List</a></li>
        <li class="breadcrumb-item active">View Invoice</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-file-invoice"></i> Rental Invoice Details
            <a href="rental-invoice.php?id=<?php echo $invoiceId; ?>" class="btn btn-sm btn-primary" style="float:right;">Edit</a>
        </div>
        <div class="card-body" id="printableArea">
            <div class="row">
                <div class="col-md-12">
				<center>
					<h5>IGNITE RENTAL INVOICE</h5>
				</center>
				</div>
				
				<div class="col-md-3">
                    <div class="form-group">
                        <label>Date</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($master['invoice_date']); ?></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Client</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($clientName); ?></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Project</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($projectName); ?></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Reference</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($master['reference_name']); ?></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Challan No</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($master['challan_no']); ?></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Bill Period</label>
                        <p class="form-control-static"><?php echo htmlspecialchars($billMonthName . ', ' . $master['bill_year']); ?> (<?php echo htmlspecialchars($master['bill_days']); ?> days)</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Grand Total</label>
                        <p class="form-control-static"><?php echo number_format((float)$master['grand_total_amount'], 2); ?></p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label>Paid / Due</label>
                        <p class="form-control-static">
                            Paid: <?php echo number_format((float)$master['paid_amount'], 2); ?><br>
                            Due: <?php echo number_format((float)$master['due_amount'], 2); ?>
                        </p>
                    </div>
                </div>
            </div>

            <h5></h5>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Equipment</th>
                            <th>Operator</th>
                            <th>Total Days</th>
                            <th>Full Time Hours</th>
                            <th>Rate</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($details as $idx => $row) { ?>
                        <tr>
                            <td><?php echo $idx + 1; ?></td>
                            <td><?php echo htmlspecialchars($row['equipment_code']); ?></td>
                            <td><?php echo htmlspecialchars($row['operator_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['total_days']); ?></td>
                            <td><?php echo number_format((float)$row['full_time_hours'], 2); ?></td>
                            <td><?php echo number_format((float)$row['rate'], 2); ?></td>
                            <td><?php echo number_format((float)$row['amount'], 2); ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col-md-4 offset-md-8">
                    <table class="table table-borderless">
                        <tr>
                            <th class="text-right">Total Amount:</th>
                            <td class="text-right"><?php echo number_format($subTotal, 2); ?></td>
                        </tr>
                        <tr>
                            <th class="text-right">Discount:</th>
                            <td class="text-right"><?php echo number_format($discountAmount, 2); ?></td>
                        </tr>
                        <tr>
                            <th class="text-right">Grand Total:</th>
                            <td class="text-right"><?php echo number_format($grandTotal, 2); ?></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="form-group">
                <label>Amount in Words</label>
                <p class="form-control-static"><em><?php echo $amountInWords; ?> only</em></p>
            </div>

            <?php if (!empty($master['remarks'])) { ?>
            <div class="form-group">
                <label></label>
                <div class="border p-2"><?php echo $master['remarks']; ?></div>
            </div>
            <?php } ?>
			<table class="table table-bordered">
				<thead>
					<th width="60%">Declaration</th>
					<th>For Ignite Limited</th>
				</thead>
				<tbody>
					<tr>
						<td width="60%">
							<p>We Declare that this invoiceshows the actual priceof the goods/service described and that allparticulars are true and correct.</p>
						</td>
						<td>
							<center>
								<p style="padding-top:200px;">____________________</br>
								IGNITE LTD</p>
							</center>
						</td>
					</tr>
				</tbody>
			</table>
        </div>
		<center>
			<a class="btn btn-default" onclick="printDiv('printableArea')" value="print a div!" style="margin-top:5px;">
				<i class="fa fa-print"></i> Print 
			</a>
			<script>
			function printDiv(divName) {
				 var printContents = document.getElementById(divName).innerHTML;
				 var originalContents = document.body.innerHTML;

				 document.body.innerHTML = printContents;

				 window.print();

				 document.body.innerHTML = originalContents;
			}
			</script>
			
		</center>
    </div>
</div>
<?php include 'footer.php'; ?>
