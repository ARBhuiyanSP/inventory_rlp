<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id'])){
?>
<style>
.reqfield{
	color:red;
	font-size:10px;
}
</style>
<form action="" method="post">
    <div class="row">
		<div class="col-sm-12">
			<form action="" method="post">
				<div class="row">
					<div class="col-sm-3">
						<div class="form-group">
							<label>Equipment</label>
							<select class="form-control select2" id="project_id" name="eel_code">
									<?php $results = mysqli_query($conn, "SELECT * FROM `equipments`"); 
									while ($row = mysqli_fetch_array($results)) {
										if($_POST['eel_code'] == $row['eel_code']){
											$selected	= 'selected';
											}else{
											$selected	= '';
											}
										?>
									<option value="<?php echo $row['eel_code']; ?>" <?php echo $selected; ?>><?php echo $row['eel_code']; ?> || <?php echo $row['name']; ?></option>
									<?php } ?>
							</select>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="form-group">
							<label></label>
							<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="NEW ENTRY" />
						</div>
					</div>
					<div class="col-sm-2">
						<label for="exampleId">From Date</label>
						<input name="from_date" type="text" class="form-control" id="fromdate" value="<?php if(isset($_POST['from_date'])){ echo $_POST['from_date']; } else {echo date("Y-m-d");} ?>" size="30" autocomplete="off" required />
					</div>
					<div class="col-sm-2">
						<label for="exampleId">To Date</label>
						<input name="to_date" type="text" class="form-control" id="todate" value="<?php if(isset($_POST['to_date'])){ echo $_POST['to_date']; } else {echo date("Y-m-d");} ?>" size="30" autocomplete="off" required />
					</div>
					<div class="col-sm-2">
						<div class="form-group">
							<label></label>
							<input type="submit" name="historySubmit" id="" class="btn btn-block btn-primary" value="PRE. HISTORY" />
						</div>
					</div>
				</div>
			</form>
		</div>
		</div>
		
		<?php    
			if(isset($_POST['submit'])){ 
				$eel_code = $_POST['eel_code'];
				$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
				$result = mysqli_query($conn, $sql);
				$row=mysqli_fetch_array($result);
				
				$id			= $row['eel_code'];
				$sm_details    =   getSMDetailsData($id);   
				$sm_info       =   $sm_details['maintenance'];
				$sm_details    =   $sm_details['maintenance'];
		?>
		
		<form action="" method="post">
			<div class="" id="printableArea" style="display:block;">
				<div class="col-sm-12">
					<?php $mcslNo    =   get_mcsl_no(); ?>
					<b>MCSL No: &nbsp; <span class="rlpno_style"><?php echo $mcslNo; ?></span></b>
					<input type="hidden" name="m_cost_id" value="<?php echo $mcslNo; ?>"></br>
				</div>
				<div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">Project</label>
						<input name="" type="text" class="form-control" id="" value="<?php $dataresult =   getDataRowByTableAndId('projects', $row['project_id']); echo (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); ?>" autocomplete="off" readonly />
					</div>
					
				</div>
				<div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">EEL Code</label>
						<input name="eel_code" type="text" class="form-control" id="eel_code" value="<?php echo $row['eel_code']; ?>" autocomplete="off" readonly />
					</div>
				</div>
				
				 <div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">Equipment Name</label>
						<input name="equipment_Name" type="text" class="form-control" id="equipment_Name" value="<?php echo $row['name']; ?>" autocomplete="off" readonly />
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">Model</label>
						<input name="model" type="text" class="form-control" id="model" value="<?php echo $row['model']; ?>" autocomplete="off" readonly />
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">Breakdown Start Date</label>
						<input name="in_time" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" size="30" autocomplete="off" required />
					</div>
				</div>
				<div class="col-sm-2">
					<div class="form-group">
						<label for="exampleId">Work Completed date</label>
						<input name="out_time" type="text" class="form-control" id="date" value="" size="30" autocomplete="off" />
					</div>
				</div>
							<div class="col-xs-2">
								<div class="form-group">
									<label>Your Project</label>
									<?php $project_id = $_SESSION['logged']['project_id']; ?>
									<input name="" type="text" class="form-control" id="" value="<?php $dataresult =   getDataRowByTableAndId('projects', $project_id); echo (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); ?>" autocomplete="off" readonly />
								
									<input name="project_id" type="hidden" class="form-control" id="project_id" value="<?php echo $project_id; ?>" autocomplete="off" />
								</div>
							</div>
							<div class="col-xs-3">
								<div class="form-group">
									<label>Your Warehouse</label>
									<?php $warehouse_id = $_SESSION['logged']['warehouse_id']; ?>
									<input name="" type="text" class="form-control" id="" value="<?php $dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $warehouse_id); echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : ''); ?>" autocomplete="off" readonly />
								
									<input name="warehouse_id" type="hidden" class="form-control" id="warehouse_id" value="<?php echo $warehouse_id; ?>" autocomplete="off" />
								</div>
							</div>
				<div class="col-xs-7">
					<div class="form-group">
						<label for="exampleId">Problem Description</label>
						<textarea name="problem_details" class="form-control" rows="1"></textarea>
					</div>
				</div>
			
					<div class="col-sm-8">
						<label for="exampleId">List of Spare Parts Used</label>
						<?php include('partial/cost_items_table.php'); ?>
					</div>
					<div class="col-sm-4">
						<label for="exampleId">Other Cost</label>
						<?php include('partial/other_cost.php'); ?>
						
						<label for="exampleId">Responsible Mechanic</label>
						<?php include('partial/cost_mechanics_table.php'); ?>
					</div>
				
				<div class="col-md-12">
					<div class="form-group">
						<label for="exampleId">Remarks:</label>
						<textarea class="form-control" id="" name="remarks" rows="1"></textarea>
					</div>
				</div>
				<div class="col-sm-12">
					<input type="submit" name="cost_entry" id="submit" class="btn btn-block btn-primary" value="Save Data" />
				</div>		
			</div>
		</form>
	<?php  } else if(isset($_POST['historySubmit'])){ 
				$from_date	=	$_POST['from_date'];
				$to_date	=	$_POST['to_date'];
	$eel_code = $_POST['eel_code'];
	$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
	$result = mysqli_query($conn, $sql);
	$row=mysqli_fetch_array($result);
	?>
	<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-12">
									<center>
									<h5 align="center"><img src="images/spl.png" height="50"></h5>
									<h2>E-Engineering Limited</h2>
									<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
									<h5><b>Equipment Maintenance Cost Report</b></h5>
									From  <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?> </span>To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?>
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
											$eel_code = $row['eel_code'];
											$sqlh	=	"select * from `maintenance_cost` where `eel_code`='$eel_code' AND `out_time` BETWEEN '$from_date' AND '$to_date'";
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
	<?php  } }?>

		 