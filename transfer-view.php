<?php include 'header.php';
$transfer_id=$_GET['no']; ?>
<style>
.table-bordered {
	border: 1px solid #000000;
}
.table-bordered th, .table-bordered td{
	border: 1px solid #000000;
}
.table th, .table td {
	padding:2px 10px 2px 10px;
}

.challan{
	font-weight:bold;
}
</style>
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Material Transfer Report
			<button class="btn btn-default" onclick="printDiv('printableArea')" style="float:right;"><i class="fa fa-print" aria-hidden="true" style="    font-size: 17px;"> Print</i></button></div>
			<div class="card-body" id="printableArea">
				<div class="row">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-6">	
								<p>
								<img src="images/spl.png" height="50px;"/>
								<h5>88 Innovations Engineering Ltd</h5><span></span></br></p></div>
							<div class="col-sm-6">
								<table class="table table-bordered">
									<tr>
										<th>Transfer ID:</th>
										<td><?php echo $transfer_id; ?></td>
									</tr>
									<tr>
										<th>Transfer Date:</th>
										<td><?php
											$sqld = "select * from `inv_transfermaster` where `transfer_id`='$transfer_id'";
											$resultd = mysqli_query($conn, $sqld);
											$rowd = mysqli_fetch_array($resultd);
										echo $rowd['transfer_date'] ?></td>
									</tr>
									<tr>
										<th>From Warehouse/Store:</th>
										<td>
											<?php 
											$dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $rowd['from_warehouse']);
											echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : '');
											?>
										</td>
									</tr>
									<tr>
										<th>To Warehouse/Store:</th>
										<td>
											<?php 
											$dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $rowd['to_warehouse']);
											echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : '');
											?>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<center><button class="btn btn-block btn-secondary challan">STORE to STORE TRANSFER DETAILS</button></center>
						<table class="table table-bordered" id="material_receive_list"> 
							<thead>
								<tr>
									<th>SL #</th>
									<th>Material ID</th>
									<th>material_name</th>
									<th>Part No</th>
									<th>Qty</th>
									<th>Unit Price</th>
									<th>Amount</th>
								</tr>
							</thead>
							<tbody id="material_receive_list_body">
								<?php
								$transfer_id=$_GET['no'];
								$sql = "select * from `inv_tranferdetail` where `transfer_id`='$transfer_id'";
								$result = mysqli_query($conn, $sql);
								$transfer_qty = 0;
								$totalamount = 0;
								$totalgrandamount = 0;
								for($i=1; $row = mysqli_fetch_array($result); $i++){
									$transfer_qty += $row['transfer_qty'];
									$totalamount += $row['unit_price'];
									$totalgrandamount += $row['unit_price'] * $row['transfer_qty'];
								?>
								<tr>
									<td>
										<?php echo $i; ?>
									</td>
									<td>
										<?php echo $row['material_id']; ?>
									</td>
									<td>
										<?php 
											$dataresult =   getDataRowByTableAndId('inv_material', $row['material_name']);
											echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : '');
										?>
									</td>
									<td>
										<?php echo $row['part_no']; ?>
									</td>
									<td>
										<?php echo $row['transfer_qty'] ?>
									</td>
									<td>
										<?php echo $row['unit_price'] ?>
									</td>
									<td>
										<?php echo $row['transfer_qty'] * $row['unit_price'] ?>
									</td>
								</tr>
								
								<?php } ?>
								<tr>
									<td colspan="4" class="grand_total" style="text-align:right">
										<b>Grand Total:</b>
									</td>
									<td> <b><?php echo $transfer_qty; ?> </b></td>
								
									<td> <b><?php echo $totalamount; ?></b> </td>
									<td> <b><?php echo $totalgrandamount; ?></b> </td>
								</tr>
							</tbody>
						</table>
						<div class="row" style="text-align:center">
							<div class="col-sm-6"></br></br>--------------------</br>Receiver Signature</div>
							<div class="col-sm-6"></br></br>--------------------</br>Authorised Signature</div>
						</div></br>
						<div class="row">
							<div class="col-sm-12" style="border:1px solid gray;border-radius:5px;padding:10px;color:#f26522;">
								<h5>Notice***</br><span style="font-size:14px;color:#000000;">Please Check Everything Before Signature</span></h5>
								
							</div>
						</div>
					</div>
					<div class="col-sm-1"></div>
				</div>
			</div>				
			<script>
			function printDiv(divName) {
				 var printContents = document.getElementById(divName).innerHTML;
				 var originalContents = document.body.innerHTML;

				 document.body.innerHTML = printContents;

				 window.print();

				 document.body.innerHTML = originalContents;
			}
			</script>
		</div>
	</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>