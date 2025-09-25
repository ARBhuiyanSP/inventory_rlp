
<?php 
include 'header.php';
ini_set('display_errors', 0);
?>
<script src="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569818907/jquery.table2excel.min.js"></script>
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
							<div class="col-sm-12">
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-2">
											<div class="form-group">
												<label>Project/Location</label>
												<select class="form-control material_select_2" id="project_id" name="project_id">
														<option value="all">All Project</option>
														<?php $results = mysqli_query($conn, "SELECT * FROM `projects`"); 
														while ($row = mysqli_fetch_array($results)) {
															if(isset($_POST['project_id']) && $_POST['project_id'] == $row['id']){
															$selected	= 'selected';
															}else{
															$selected	= '';
															}
															?>
														<option value="<?php echo $row['id']; ?>" <?php echo $selected; ?>><?php echo $row['project_name']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>Type</label>
												<select class="form-control material_select_2" id="equipment_type" name="equipment_type">
														
														<option value="all">All</option>
														<option value="Own" <?php if(isset($_POST['equipment_type']) && $_POST['equipment_type'] == 'Own'){echo 'selected';}?>>Own</option>
														<option value="Rental" <?php if(isset($_POST['equipment_type']) && $_POST['equipment_type'] == 'Rental'){echo 'selected';} ?>>Hired</option>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>Origin</label>
												<select class="form-control material_select_2" id="origin" name="origin">
														
														<option value="all">All</option>
														<?php
														$tableName = 'country';
														$column = 'name';
														$order = 'asc';
														$dataType = 'obj';
														$projectsData = getTableDataByTableName($tableName, $order, $column, $dataType);
														if (isset($projectsData) && !empty($projectsData)) {
															foreach ($projectsData as $data) {
																if(isset($_POST['origin']) && $_POST['origin'] == $data->name){
																	$selected	= 'selected';
																	}else{
																	$selected	= '';
																	}
																?>
																<option value="<?php echo $data->name; ?>" <?php echo $selected; ?>><?php echo $data->name; ?></option>
																<?php
															}
														}
														?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>Capacity</label>
												<select class="form-control material_select_2" id="capacity" name="capacity">
														<option value="all">All</option>
														<?php $results = mysqli_query($conn, "SELECT capacity FROM `equipments` group by capacity"); 
														while ($row = mysqli_fetch_array($results)) {
															if(isset($_POST['capacity']) && $_POST['capacity'] == $row['capacity']){
															$selected	= 'selected';
															}else{
															$selected	= '';
															}
															?>
														<option value="<?php echo $row['capacity']; ?>" <?php echo $selected; ?>><?php echo $row['capacity']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label>Model</label>
												<select class="form-control material_select_2" id="model" name="model">
														<option value="all">All</option>
														<?php $results = mysqli_query($conn, "SELECT model FROM `equipments` group by model"); 
														while ($row = mysqli_fetch_array($results)) {
															if(isset($_POST['model']) && $_POST['model'] == $row['model']){
															$selected	= 'selected';
															}else{
															$selected	= '';
															}
															?>
														<option value="<?php echo $row['model']; ?>" <?php echo $selected; ?>><?php echo $row['model']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										
										<div class="col-sm-2">
											<div class="form-group">
												<label>Condition</label>
												<select class="form-control material_select_2" id="present_condition" name="present_condition">
														<option value="all">All</option>
														<?php $results = mysqli_query($conn, "SELECT present_condition FROM `equipments` group by present_condition"); 
														while ($row = mysqli_fetch_array($results)) {
															if(isset($_POST['present_condition']) && $_POST['present_condition'] == $row['present_condition']){
															$selected	= 'selected';
															}else{
															$selected	= '';
															}
															?>
														<option value="<?php echo $row['present_condition']; ?>" <?php echo $selected; ?>><?php echo $row['present_condition']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										<div class="col-sm-1">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search" />
											</div>
										</div>
										<div class="col-sm-1">
											<div class="form-group">
												<label></label>
												<a class="btn btn-block btn-danger" href="<?php $_SERVER['PHP_SELF']; ?>">Reset</a>
											</div>
										</div>
									</div>
								</form>
							</div>
							</div>
							 <?php
if(isset($_POST['submit'])){
	$assign_status	= 'assigned';
	//$origin			= $_POST['origin'];
	$project_id		= $_POST['project_id'];
	$origin		= $_POST['origin'];
	$capacity		= $_POST['capacity'];
	$model		= $_POST['model'];
	$present_condition		= $_POST['present_condition'];
	$equipment_type			= $_POST['equipment_type'];
	
	//query from db
	
	$resultSet = mysqli_query($conn, "SELECT * FROM `equipments` WHERE `assign_status` =  '$assign_status'".($project_id!='all'?" AND `present_location` = '$project_id'":'')." ".($equipment_type!='all'?" AND `equipment_type` = '$equipment_type'":'')." ".($origin!='all'?" AND `origin` = '$origin'":'')." ".($capacity!='all'?" AND `capacity` = '$capacity'":'')." ".($model!='all'?" AND `model` = '$model'":'')." ".($present_condition!='all'?" AND `present_condition` = '$present_condition'":'')." ");
	$count = $resultSet->num_rows;
	
/* 	echo "<pre>";
print_r($resultSet);
echo "</pre>"; */
	
	if($resultSet->num_rows > 0){
		echo "<div id='printableArea'><center><h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1><h2>SAIF POWERTEC LIMITED</h2><p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p><h3>Equipment List Report</h3><span style='font-weight:bold;color:red;'>Total Equipment: $count</span></center>";
		echo "<table id='htmltable' class='table table-bordered table-striped list-table-custom-style'>
		<tr>
			<th>Name</th>
			<th>EEl Code</th>
			<th>Present Location</th>
			<th>Origin</th>
			<th>Capacity</th>
			<th>Type</th>
			<th>Model</th>
			<th>Present Condition</th>
			<th>Engine Model</th>
			<th>Price</th>
			<th>Man. Year</th>
		</tr>";

		$i = 0;
		while($rows = $resultSet->fetch_assoc()) {
			$i++;
			echo "<tr>
					<td>" . $rows['name'] .' || '.$rows['eel_code']. "</td>
					<td><a href='history.php?id=" . $rows['eel_code'] . "' target='blank'>" . $rows['eel_code'] . "</a></td>
					<td>" . getProjectNameByID($rows['present_location']) . "</td>
					<td>" . $rows['origin'] . "</td>
					<td>" . $rows['capacity'] . "</td>
					<td>" . $rows['equipment_type'] . "</td>
					<td>" . $rows['model'] . "</td>
					<td>" . $rows['present_condition'] . "</td>
					<td>" . $rows['engine_model'] . "</td>
					<td>" . $rows['price'] . "</td>
					<td>" . $rows['year_manufacture'] . "</td>
					
					
				</tr>";
			
		}
		echo "</table></div>";
	}
	else{
		echo "<center>No Result</center>";
	}
}
?>
<div class="row">
	<div class="col-sm-12">
		<center>
			<a class="btn btn-default" onclick="printDiv('printableArea')" value="print a div!" style="margin-top:5px;">
				<i class="fa fa-print"></i> Print 
			</a>
			
			<a id="exporttable" class="btn btn-default" value="" style="margin-top:5px;">
				<i class="fa fa-file-excel-o"></i> Export xls 
			</a>
			
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
	</div>
</div>
						</div>
                    <!-- /.box-body -->
                </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script>
$(function() {
$("#exporttable").click(function(e){
var table = $("#htmltable");
if(table && table.length){
$(table).table2excel({
exclude: ".noExl",
name: "Excel Document Name",
filename: "EEL_Equipment" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
fileext: ".xls",
exclude_img: true,
exclude_links: true,
exclude_inputs: true,
preserveColors: false
});
}
});

});
</script>
