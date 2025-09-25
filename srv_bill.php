<?php 
include 'header.php';
$mrr_no=$_GET['id'];
?>
<?php /* if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<!--<link href="css/form-entry.css" rel="stylesheet">-->
<!-- Left Sidebar End -->
<?php
				$sqld = "select * from `inv_services_bill` where `srv_ref`='$mrr_no'";
				$resultd = mysqli_query($conn, $sqld);
				$rowd = mysqli_fetch_array($resultd);
			?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Service Bill</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Service Bill
            <a href="service_entry.php" style="float:right"><i class="fas fa-list"></i> Service Area</a></div>
        <div class="card-body" id="printableArea">
                       <div class="row">
							<div class="col-xs-6">	
								<p>
								<img src="images/spl.png" height="50px;"/>
								<h5>Saif Power Group </h5><span>Material Service Bill Details</span></p></div>
							<div class="col-xs-6">
								<table class="table table-bordered">
									<tr>
										<th>Service No:</th>
										<td><?php echo $mrr_no; ?></td>
									</tr>
									<tr>
										<th>Bill No:</th>
										<td><?php
										echo $rowd['bill_no']; ?></td>
									</tr>
									<tr>
										<th>Bill Date:</th>
										<td><?php
										echo $rowd['bill_date']; ?></td>
									</tr>
									<tr>
										<th>Store:</th>
										<td>
											<?php 
												$store_id = $rowd['store_id'];;
												$sqlstore	= "select * from `store` where `id`='$store_id'";
												$resultstore = mysqli_query($conn, $sqlstore);
												$rowstore=mysqli_fetch_array($resultstore);
												echo $rowstore['name'];
											?>
										</td>
									</tr>
									<tr>
										<th>Vendor:</th>
										<td>
											<?php 
											$vendor_id = $rowd['vendor_id'];
											$sqlunit	=	"SELECT * FROM `vendors` WHERE `vendor_id` = '$vendor_id' ";
											$resultunit = mysqli_query($conn, $sqlunit);
											$rowunit=mysqli_fetch_array($resultunit);
											echo $rowunit['vendor_name'];
											?>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<table class="table table-bordered" id="material_receive_list"> 
							<thead>
								<tr>
									<th>SL #</th>
									<th>Assets Name</th>
									<th>Service Details</th>
									<th>Amount</th>
								</tr>
							</thead>
							<tbody id="material_receive_list_body">
								<?php
								$bill_no=$rowd['bill_no'];
								$sql = "select * from `inv_services_bill` where `bill_no`='$bill_no'";
								$result = mysqli_query($conn, $sql);
									for($i=1; $row = mysqli_fetch_array($result); $i++){
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td>
										<?php echo $row['assets_slno']; ?>
									</td>
									<td>
										<?php echo $row['remarks']; ?>
									</td>
									<td><?php echo $row['amount'] ?></td>
								</tr>
								<?php } ?>
								<tr>
									<td colspan="3" class="grand_total">Grand Total:</td>
									<td>
										<?php 
										$sql2 			= "SELECT sum(amount) FROM  `inv_services_bill` where `bill_no`='$bill_no'";
										$result2 		= mysqli_query($conn, $sql2);
										for($i=0; $row2 = mysqli_fetch_array($result2); $i++){
										$totalReceived	=$row2['sum(amount)'];
										echo $totalReceived ;
										}
										?>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="row" style="text-align:center">
							<div class="col-xs-6"></br>
								<br>--------------------<br>
								Receiver Signature</div>
										
									
							
							<div class="col-xs-6"></br>
							</br>--------------------</br>Authorised Signature</div>
						</div></br>
						<div class="row">
							<div class="col-md-12" style="border:1px solid gray;border-radius:5px;padding:10px;color:#f26522;text-align:center;">
								<h5>Notice***</br><span style="font-size:14px;color:#000000;">Please Check Everything Before Signature</span></h5>
								
							</div>
						</div>
						
                <!-- /.row -->
                    </div>
					
                    <!-- /.box-body -->
					<center><button class="btn btn-primary" onclick="printDiv('printableArea')"><i class="fa fa-print"></i> Print</button></center>			
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

<script>
    $(function () {
        $("#mrr_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#challan_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#requisition_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<?php include 'footer.php' ?>