<?php 
include 'header.php';
?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Reports List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        
        <div class="card-body">
						<div class="row">
								<?php			
								$id = $_GET['id'];
								$sqllog	=	"select * from `maintenance` where `id`='$id'";
								$resultlog = mysqli_query($conn, $sqllog);
								$rowlog=mysqli_fetch_array($resultlog);
								
								
								
								$eel_code = $rowlog['equipment_id'];
								$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
								$result = mysqli_query($conn, $sql);
								$row=mysqli_fetch_array($result);
								?>
							</div>
							<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-12">
									<center>
									<h5 align="center"><img src="images/spl.png" height="50"></h5>
									<h2>E-Engineering Limited</h2>
									<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
									<h5><b>Equipment Schedule Maintenance Report</b></h5>
									
									<table class="table" style="width:80%">
										<tr>
											<th>Name:</th>
											<td><?php echo $row['name']; ?>
											</td>
											<th>EEl Code:</th>
											<td><?php echo $row['eel_code'] ?></td>
											<th>Brand:</th>
											<td><?php echo $row['makeby'] ?></td>
											
										</tr>
										<tr>
											<th>Model:</th>
											<td><?php echo $row['model'] ?></td>
											<th>Origin:</th>
											<td><?php echo $row['origin'] ?></td>
											<th>Purchase Date:</th>
											<td><?php //echo $row['purchase_date'] ?></td>
										</tr>
									</table>
									<table id="" class="table table-bordered table-striped" style="width:90%">
										<thead>
											<tr>
												<th>Date of Service</th>
												<th>Service Done</br><small>(HMR/KMR)</small></th>
												<th>Next Service Due</br><small>(HMR/KMR)</small></th>
												<th>Present</br><small>(HMR/KMR)</small></th>
												<th>Due For Service</br><small>(HMR/KMR)</small></th>
												<th>Next Service</br><small>(HMR/KMR)</small></th>
												<th>Type of Service</br><small>(HMR/KMR)</small></th>
												<th>Details of Maintenance</br>Carried Out</th>
												<th>Remarks</th>
											</tr>
										</thead>
										<tbody>
										<?php
								
											$id = $_GET['id'];
											$sqlh	=	"select * from `maintenance` where `id`='$id'";
											$resulth 	= mysqli_query($conn, $sqlh);
											while ($rowh = mysqli_fetch_array($resulth)) { ?>
										
											<tr>
												<td><?php 
												if($rowh['lastseervice_date']){
													$rDate = strtotime($rowh['lastseervice_date']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php echo $rowh['lastservice_hrkm'] ?></td>
												<td><?php echo $rowh['schedule_hrkm'] ?></td>
												<td><?php echo $rowh['present_hrkm'] ?></td>
												<td><?php echo $rowh['dueforservice_hrkm'] ?></td>
												<td><?php echo $rowh['nextservice_hrkm'] ?></td>
												<td><?php echo $rowh['typeofservice_hrkm'] ?></td>
												
												
												<td>
													<table class="table">
														<tr>
															<td><b>Used Spare Parts</b></td>
															<td><b>QTY</b></td>
															<td><b>Unit</b></td>
															<td><b>Rate</b></td>
															<td><b>Amount</b></td>
														</tr>
														<?php 
															$maintenance_id = $rowh['id'];
															$sqlparts	=	"select * from `maintenance_details` where `maintenance_id`='$maintenance_id'";
															$resultparts = mysqli_query($conn, $sqlparts);
															while ($rowparts = mysqli_fetch_array($resultparts)) {
																//$totalpartsQty += $rowparts['qty'];
																//$totalAmount += $rowparts['amount'];
														?>
														<tr>
															<td><?php echo getMaterialNameByIdAndTableandId('inv_material',$rowparts['material_name']); ?></td>
															<td><?php echo $rowparts['qty']; ?></td>
															<td><?php 
															$dataresult =   getDataRowByTableAndId('inv_item_unit', $rowparts['unit']);
															echo (isset($dataresult) && !empty($dataresult) ? $dataresult->unit_name : '');
															?></td>
															<td><?php echo $rowparts['price']; ?></td>
															<td><?php echo $rowparts['price'] * $rowparts['qty']; ?></td>
														</tr>
														<?php } ?>
													</table>
												</td>
												
												<td><?php echo $rowh['remarks'] ?></td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</center>
								</div>
							</div>
								
							<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></center>					
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
                    <!-- /.box-body -->
                </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>