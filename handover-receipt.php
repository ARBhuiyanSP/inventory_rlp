<?php 
include 'header.php';
$id=$_GET['id'];
?>
<?php /* if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<!--<link href="css/form-entry.css" rel="stylesheet">-->
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">User Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            User Entry
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List<a></div>
        <div class="card-body">
            <!--here your code will go-->
            <?php
									$sql	=	"select * from `product_assign` where `id`='$id'";
									$result = mysqli_query($conn, $sql);
									$row=mysqli_fetch_array($result);
									
									
										$product_id=$row['product_id'];
										$sql2	=	"select * from `ams_products` where `id`='$product_id'";
										$result2 = mysqli_query($conn, $sql2);
										$rowp=mysqli_fetch_array($result2);
								?>
                                <center>
									
									<div class="row">
										<div class="col-md-12" id="printableArea">
											
												<center>
													
													<h1 align="center"><img src="images/spl2.png" height="50px;"/></h1>
													<h2>SAIF POWER GROUP</h2>
													<p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p>
													<h3>Assets Handover Receipt</h3>
													<table style="" class="table table-bordered">
														<tr>
															<th>S/L No:</th>
															<td><?php echo $rowp['sl_no'] ?></td>
														</tr>
														<tr>
															<th>Item Name:</th>
															<td><?php echo $rowp['item_name'] ?></td>
														</tr>
														<tr>
															<th>Item Description:</th>
															<td><?php echo $rowp['assets_description'] ?></td>
														</tr>
														<tr>
															<th>Brand:</th>
															<td><?php echo $rowp['brand'] ?></td>
														</tr>
														<tr>
															<th>Model:</th>
															<td><?php echo $rowp['model'] ?></td>
														</tr>
														<tr>
															<th>Manufacturing SL No:</th>
															<td><?php echo $rowp['manu_sl'] ?></td>
														</tr>
														<tr>
															<th>RLP No:</th>
															<td><?php echo $rowp['rlp_no'] ?></td>
														</tr>
														<tr>
															<th>Purchase Date:</th>
															<td><?php echo $rowp['puchase_date'] ?></td>
														</tr>
														<tr>
															<th>Custody:</th>
															<td><?php echo $rowp['custody'] ?></td>
														</tr>
													</table>
													<table style="" class="table table-bordered">
														
														<tr>
															<td style="width:20%">Handover date:</td>
															<td><?php 
															$cDate = strtotime($row['assign_date']);
															$dDate = date("jS \of F Y",$cDate);
															echo $dDate;?></td>
															
														</tr>
														<tr>
															<td style="width:20%">Handover To:</td>
															<td><?php 
															$employee_id=$row['employee_id'];
															$sql4	=	"select * from `inv_employee` where `employeeid`='$employee_id'";
															$result4 = mysqli_query($conn, $sql4);
															$rowe=mysqli_fetch_array($result4);
															echo $rowe['name'];
															echo ' || '.$rowe['employeeid'].' || '.$rowe['division'].' || '.$rowe['department'];

															 ?></td>
														</tr>
														<tr>
															<td style="width:20%">Remarks:</td>
															<td><?php echo $row['remarks']; ?></td>
														</tr>
													</table>
												
												</center>
											
												<center><div class="row">
													<div class="col-xs-3"></br>
														<?php if($row['assigned_by']){ 
																	
																		$employee_id = $row['assigned_by'];
																		$sqlemployee	= "select * from `inv_employee` where `employeeid`='$employee_id'";
																		$resultemployee = mysqli_query($conn, $sqlemployee);
																		$rowemployee=mysqli_fetch_array($resultemployee);
																?>
															<?php echo $rowemployee["name"]; }else{ ?>---<?php } ?>
													</br>--------------------</br>Handover By</div>
													<div class="col-xs-3"></br></br>--------------------</br>Received By</div>
													<div class="col-xs-3"></br></br>--------------------</br>Checked By</div>
													<div class="col-xs-3"></br></br>--------------------</br>Approved by</div>
												</div></center></br>
												<div class="row">
													<div class="col-sm-12" style="border:1px solid gray;border-radius:5px;padding:10px;color:#f26522;">
														<center><h5>Notice***</br><span style="font-size:14px;color:#000000;">Please Check Everything Before Signature</span></h5></center>
														
													</div>
												</div>
											</div>			
										</div>
										<center><button class="btn btn-success mt-4" onclick="printDiv('printableArea')"><i class="fa fa-print"> </i>Print</button></center>
								</center>
								<script>
								function printDiv(divName) {
									 var printContents = document.getElementById(divName).innerHTML;
									 var originalContents = document.body.innerHTML;

									 document.body.innerHTML = printContents;

									 window.print();

									 document.body.innerHTML = originalContents;
								}
								</script>
								<!--- Search Result--->
						
                <!-- /.row -->
            <!--here your code will go-->
        </div>
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