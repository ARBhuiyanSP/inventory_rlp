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
							
							</div>
							 
						<div class="row">
								<?php
								$id = $_GET['id'];
								$sqllog	=	"select * from `maintenance_cost` where `id`='$id'";
								$resultlog = mysqli_query($conn, $sqllog);
								$rowlog=mysqli_fetch_array($resultlog);
								
								$eel_code = $rowlog['eel_code'];
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
									<h5><b>Equipment Maintenance Cost Report</b></h5>
									
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
												<th>Date of IN</th>
												<th>Date of Out</th>
												<th>Problem Description</th>
												<th>List of Used Spare Parts</th>
												<th>Extra Cost</th>
												<th>Responsible Mechanic</th>
												<th>Certified By</th>
											</tr>
										</thead>
										<tbody>
										<?php
											$totalpartsQty = 0;
											$totalAmount = 0;
											$totalOtherCost = 0;
											$id = $_GET['id'];
											$sqlh	=	"select * from `maintenance_cost` where `id`='$id'";
											$resulth = mysqli_query($conn, $sqlh);
											while ($rowh = mysqli_fetch_array($resulth)) { ?>
										
											<tr>
												<td><?php 
												if($rowh['in_time']){
													$rDate = strtotime($rowh['in_time']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php 
												if($rowh['out_time']){
													$rDate = strtotime($rowh['out_time']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php echo $rowh['problem_details']; ?></td>
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
															$m_cost_id = $rowh['m_cost_id'];
															$sqlparts	=	"select * from `maintenance_spare_parts` where `m_cost_id`='$m_cost_id'";
															$resultparts = mysqli_query($conn, $sqlparts);
															while ($rowparts = mysqli_fetch_array($resultparts)) {
																$totalpartsQty += $rowparts['qty'];
																$totalAmount += $rowparts['amount'];
														?>
														<tr>
															<td><?php //echo $rowparts['spare_parts_name'];
																$dataresult =   getDataRowByTableAndId('inv_material', $rowparts['spare_parts_name']);
																echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : '');
															?></td>
															<td><?php echo $rowparts['qty']; ?></td>
															<td><?php 
															$dataresult =   getDataRowByTableAndId('inv_item_unit', $rowparts['unit']);
															echo (isset($dataresult) && !empty($dataresult) ? $dataresult->unit_name : '');
															?></td>
															<td><?php echo $rowparts['rate']; ?></td>
															<td><?php echo $rowparts['amount']; ?></td>
														</tr>
														<?php } ?>
													</table>
												</td>
												<td>
													<table class="table">
														<tr>
															<td><b>Cost Name</b></td>
															<td><b>Amount</b></td>
														</tr>
														<?php 
															$m_cost_id = $rowh['m_cost_id'];
															$sqlother	=	"select * from `maintenance_other_cost` where `m_cost_id`='$m_cost_id'";
															$resultother = mysqli_query($conn, $sqlother);
															while ($rowother = mysqli_fetch_array($resultother)) {
																$totalOtherCost += $rowother['oc_amount'];
																
														?>
														<tr>
															<td><?php echo $rowother['oc_name']; ?></td>
															<td><?php echo $rowother['oc_amount']; ?></td>
														</tr>
														<?php } ?>
													</table>
												</td>
												<td>
													<table class="table">
														<tr>
															<td><b>Name</b></td>
															<td><b>Signature</b></td>
														</tr>
														<?php 
															$m_cost_id = $rowh['m_cost_id'];
															$sqlmechanic	=	"select * from `maintenance_mechanic` where `m_cost_id`='$m_cost_id'";
															$resultmechanic = mysqli_query($conn, $sqlmechanic);
															while ($rowmechanic = mysqli_fetch_array($resultmechanic)) {
														?>
														<tr>
															<td><?php echo $rowmechanic['mechanic_name']; ?></td>
															<td></td>
														</tr>
														<?php } ?>
													</table>
												</td>
												<td><?php echo $rowh['certified_by']; ?></td>
											</tr>
											<?php } ?>
											<tr>
												<td colspan="3" style="text-align:right;"><b>Total:</b></td>
												<td><b>Parts Quantity : <?php echo $totalpartsQty; ?>
												& Amount : <?php echo $totalAmount; ?> </b></td>
												<td><b>Extra Cost : <?php echo $totalOtherCost; ?> </b></td>
												<td><b>Grand Total : <?php echo $totalOtherCost + $totalAmount; ?> </b></td>
											</tr>
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