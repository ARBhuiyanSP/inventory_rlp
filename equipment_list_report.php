
<?php 
include 'header.php';
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
										<div class="col-sm-3">
											<div class="form-group">
												<label>Project/Location</label>
												<select class="form-control material_select_2" id="project_id" name="project_id">
														<option value="all">All Project</option>
														<?php $results = mysqli_query($conn, "SELECT * FROM `projects`"); 
														while ($row = mysqli_fetch_array($results)) {
															if($_POST['project_id'] == $row['id']){
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
										<div class="col-sm-3">
											<div class="form-group">
												<label>Make By</label>
												<select class="form-control material_select_2" id="makeby" name="makeby">
														<option value="all">All Brand</option>
														<option value="DENAIR" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'DENAIR'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>DENAIR</option>
														<option value="ULTRATEX" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'ULTRATEX'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>ULTRATEX</option>
														<option value="VOGLEE" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'VOGLEE'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>VOGLEE</option>
														<option value="TTM" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'TTM'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>TTM</option>
														<option value="CASE" <?php if($_POST['makeby'] == 'CASE'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>CASE</option>
														<option value="ZENITH" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'ZENITH'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>ZENITH</option>
														<option value="ZOOMLION" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'ZOOMLION'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>ZOOMLION</option>
														<option value="LOCAL" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'LOCAL'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>LOCAL</option>
														<option value="POWER PLUS" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'POWER PLUS'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>POWER PLUS</option>
														<option value="LIUGONG" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'LIUGONG'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>LIUGONG</option>
														<option value="NICOL" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'NICOL'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>NICOL</option>
														<option value="XCMG" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'XCMG'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>XCMG</option>
														<option value="DAWEOO" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'DAWEOO'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>DAWEOO</option>
														<option value="SIFANG" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'SIFANG'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>SIFANG</option>
														<option value="FUJIAN" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'FUJIAN'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>FUJIAN</option>
														<option value="MINDONG" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'MINDONG'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>MINDONG</option>
														<option value="TEKSAN" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'TEKSAN'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>TEKSAN</option>
														<option value="PRAMAC" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'PRAMAC'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>PRAMAC</option>
														<option value="STARKE" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'STARKE'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>STARKE</option>
														<option value="IHC-BEAVER" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'IHC-BEAVER'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>IHC-BEAVER</option>
														<option value="Longking" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'Longking'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>Longking</option>
														<option value="JULONG" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'JULONG'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>JULONG</option>
														<option value="SINO" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'SINO'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>SINO</option>
														<option value="EICHER" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'EICHER'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>EICHER</option>
														<option value="DOOSAN" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'DOOSAN'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>DOOSAN</option>
														<option value="SOOSAN" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'SOOSAN'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>SOOSAN</option>
														<option value="TATA" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'TATA'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>TATA</option>
														<option value="ACE" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'ACE'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>ACE</option>
														<option value="HAMM" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'HAMM'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>HAMM</option>
														<option value="JUNMA" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'JUNMA'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>JUNMA</option>
														<option value="AMYTECH" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'AMYTECH'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>AMYTECH</option>
														<option value="SONALIKA" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'SONALIKA'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>SONALIKA</option>
														<option value="TAFE" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'TAFE'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>TAFE</option>
														<option value="Changling" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'Changling'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>Changling</option>
														<option value="Euro" <?php if(isset($_POST['makeby']) && $_POST['makeby'] == 'Euro'){$selected='selected';}else{$selected	= '';} echo $selected; ?>>Euro</option>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search Data" />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label></label>
												<input type="button" name="" id="" class="btn btn-block btn-primary" value="Back To Reports Section" onclick="location.href='reports.php';"/>
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
	$makeby			= $_POST['makeby'];
	
	//query from db
	
	$resultSet = mysqli_query($conn, "SELECT * FROM `equipments` WHERE `assign_status` =  '$assign_status'".($project_id!='all'?" AND `project_id` = '$project_id'":'')." ".($makeby!='all'?" AND `makeby` = '$makeby'":'')." ");
	$count = $resultSet->num_rows;
	
/* 	echo "<pre>";
print_r($resultSet);
echo "</pre>"; */
	
	if($resultSet->num_rows > 0){
		echo "<div id='printableArea'><center><h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1><h2>SAIF POWERTEC LIMITED</h2><p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p><h3>Equipment List Report</h3>Total Equipment: $count</center>";
		echo "<table id='htmltable' class='table table-bordered table-striped list-table-custom-style'>
		<tr>
			<th>SL No</th>
			<th>Name</th>
			<th>EEl Code</th>
			<th>Origin</th>
			<th>Capacity</th>
			<th>Make By</th>
			<th>Model</th>
			<th>Engine Model</th>
			<th>Price</th>
			<th>Man. Year</th>
			<th>Location</th>
		</tr>";

		$i = 0;
		while($rows = $resultSet->fetch_assoc()) {
			$i++;
			echo "<tr><td>" . $i . "</td>
					<td>" . $rows['name'] . "</td>
					<td>" . $rows['eel_code'] . "</td>
					<td>" . $rows['origin'] . "</td>
					<td>" . $rows['capacity'] . "</td>
					<td>" . $rows['makeby'] . "</td>
					<td>" . $rows['model'] . "</td>
					<td>" . $rows['engine_model'] . "</td>
					<td>" . $rows['price'] . "</td>
					<td>" . $rows['year_manufacture'] . "</td>
					<td>" . $rows['present_location'] . "</td>
					
					
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
