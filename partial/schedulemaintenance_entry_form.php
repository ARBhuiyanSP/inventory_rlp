<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id'])){
?>
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
							<input type="submit" name="historySubmit" id="submit" class="btn btn-block btn-primary" value="PRE. HISTORY" />
						</div>
					</div>
				</div>
			</form>
		</div>
		</div>
		
		<?php    
			if(isset($_POST['submit'])){ 
				$eel_code 	= 	$_POST['eel_code'];
				$sql		=	"select * from `equipments` where `eel_code`='$eel_code'";
				$result 	= 	mysqli_query($conn, $sql);
				$row		=	mysqli_fetch_array($result);
				$id			= 	$row['eel_code'];
				$sm_details    =   getSMDetailsData($id);   
				$sm_info       =   $sm_details['maintenance'];
				$sm_details    =   $sm_details['maintenance'];
		?>
		
		<form action="" method="post">
				<div class="row">
					<div class="col-md-6">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">Project</label>
									<input name="" type="text" class="form-control" id="" value="<?php $dataresult =   getDataRowByTableAndId('projects', $row['project_id']); echo (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); ?>" autocomplete="off" readonly />
								</div>
								<input name="project_id" type="hidden" class="form-control" id="project_id" value="<?php echo $row['project_id']; ?>" autocomplete="off" />
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">EEL Code</label>
									<input name="equipment_id" type="text" class="form-control" id="equipment_id" value="<?php echo $row['eel_code']; ?>" autocomplete="off" readonly />
								</div>
							</div>
				
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">Equipment Name</label>
									<input name="equipment_Name" type="text" class="form-control" id="equipment_Name" value="<?php echo $row['name']; ?>" autocomplete="off" readonly />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">Brand/Make By</label>
									<input name="makeby" type="text" class="form-control" id="makeby" value="<?php echo $row['makeby']; ?>" autocomplete="off" readonly />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="exampleId">Model</label>
									<input name="model" type="text" class="form-control" id="model" value="<?php echo $row['model']; ?>" autocomplete="off" readonly />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="exampleId">Date of service</label>
									<input name="lastseervice_date" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" size="30" autocomplete="off" required />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="exampleId">Previous Service (HR/KM)</label>
									<input name="lastservice_hrkm" type="text" class="form-control" id="lastservice_hrkm" value="<?php if(isset($sm_info->present_hrkm)){echo $sm_info->present_hrkm;} ?>" autocomplete="off" required />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="exampleId">Scheduled At (HR/KM)</label>
									<input name="schedule_hrkm" type="text" class="form-control" id="scheduled" value="<?php if(isset($sm_info->nextservice_hrkm)){echo $sm_info->nextservice_hrkm;} ?>" autocomplete="off" required />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">Present(HR/KM)</label>
									<input name="present_hrkm" type="text" class="form-control" id="presenthrkm" value="" autocomplete="off" onkeyup="cal()" required />
								</div>
							</div>
							<div class="col-sm-2">
								<div class="form-group">
									<label for="exampleId"> Due</label>
									<input name="dueforservice_hrkm" type="text" class="form-control" id="dueforservicehrkm" value="" autocomplete="off" readonly />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId"> Service Type</label>
									<input name="typeofservice_hrkm" type="text" class="form-control" id="" value="" autocomplete="off" />
								</div>
							</div>
							<div class="col-sm-5">
								<div class="form-group">
									<label for="exampleId"> Added (HR/KM) for Next Service</label>
									<input name="" type="text" class="form-control" id="typeofservicehrkm" value="" autocomplete="off" onkeyup="cal()" required />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="exampleId">Next Service(HR/KM)</label>
									<input name="nextservice_hrkm" type="text" class="form-control" id="nextservicehrkm" value="" autocomplete="off" readonly />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label for="exampleId">Next service Date</label>
									<input name="nextservice_date" type="text" class="form-control" id="start_date" value="" size="30" autocomplete="off" />
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
						</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="exampleId">Details of Maintenance Carried out:</label>
						<?php include('partial/cost_items_table2.php'); ?>
					</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="exampleId">Remarks:</label>
						<textarea class="form-control" id="" name="remarks" rows="2"></textarea>
					</div>
				</div>
				<div class="col-sm-12">
					<input type="submit" name="sm_entry" id="submit" class="btn btn-block btn-primary" value="Save Data" />
				</div>
			</div>
		</form>
	<?php  }if(isset($_POST['historySubmit'])){ 
	
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
									<h5><b>Equipment Schedule Maintenance Report</b></h5>
									From  <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?> </span>To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?>
									<table class="table" style="">
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
									<table id="" class="table table-bordered table-striped" style="">
										<thead>
											<tr>
												<th>Date of Service</th>
												<th>Service Done</br><small>(HR/KM)</small></th>
												<th>Next Service Due</br><small>(HR/KM)</small></th>
												<th>Present</br><small>(HR/KM)</small></th>
												<th>Due For Service</br><small>(HR/KM)</small></th>
												<th>Next Service</br><small>(HR/KM)</small></th>
												<th>Type of Service</br><small>(HR/KM)</small></th>
												<th>Details of Maintenance</br>Carried Out</th>
												<th>Remarks</th>
											</tr>
										</thead>
										<tbody>
										<?php
								
											$eel_code 	= $row['eel_code'];
											$sqlh		=	"select * FROM `maintenance` WHERE `equipment_id`='$eel_code' AND `lastseervice_date` BETWEEN '$from_date' AND '$to_date'";
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
															<td><?php //echo $rowparts['spare_parts_name'];
																$dataresult =   getDataRowByTableAndId('inv_material', $rowparts['material_name']);
																echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : '');
															?></td>
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
	<?php  }} ?>
	
<script>
	function cal() {
		var scheduled = document.getElementById('scheduled').value;
		var presenthrkm = document.getElementById('presenthrkm').value;
		var typeofservicehrkm = document.getElementById('typeofservicehrkm').value;



		var result =  parseInt(scheduled) - parseInt(presenthrkm);
		if (!isNaN(result)) {
			document.getElementById('dueforservicehrkm').value = result;
		}
		var result2 =  parseInt(presenthrkm) + parseInt(typeofservicehrkm);
		if (!isNaN(result2)) {
			document.getElementById('nextservicehrkm').value = result2;
		}
	}
</script>
		 