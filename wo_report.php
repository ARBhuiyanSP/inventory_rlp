
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
        <li class="breadcrumb-item active"> Workorder Reports</li>
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
										<div class="col-sm-2">
											<div class="form-group">
												<label for="todate">From Date</label>
												<input type="text" class="form-control" id="from_date" name="from_date" value="<?php if(isset($_POST['from_date'])){ echo $_POST['from_date']; } ?>" autocomplete="off" required >
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label for="todate">To Date</label>
												<input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_POST['to_date'])){ echo $_POST['to_date']; } ?>" autocomplete="off" required >
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search Data" />
											</div>
										</div>
										<div class="col-sm-2">
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
	//$origin			= $_POST['origin'];
	$project_id		= $_POST['project_id'];
	$from_date		= $_POST['from_date'];
	$to_date		= $_POST['to_date'];
	
	//query from db
	
	$resultSet = mysqli_query($conn, "SELECT * FROM `workorders_master` WHERE `wo_no` !=  ''".($project_id!='all'?" AND `request_project` = '$project_id'":'')." AND `created_at` BETWEEN '$from_date' AND '$to_date' ");
	$count = $resultSet->num_rows;
	
/* 	echo "<pre>";
print_r($resultSet);
echo "</pre>"; */
	
	if($resultSet->num_rows > 0){
		echo "<div id='printableArea'><center><h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1><h2>SAIF POWERTEC LIMITED</h2><p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p><h5>Notesheet List Report</h5>From :";
		echo "<span style='text-decoration:underline'>" . date('jS F Y', strtotime($from_date))."</span>";
		echo " To ";
		echo "<span style='text-decoration:underline'>" . date('jS F Y', strtotime($to_date))."</span></center>";
		echo "<table id='htmltable' class='table table-bordered table-striped'>
		<tr>
			<th>RLP No</th>
			<th>Project</th>
			<th>Request Date</th>
			<th>Status</th>
		</tr>";

		$i = 0;
		while($rows = $resultSet->fetch_assoc()) {
			$i++;
			echo "<tr>
					<td><a href='workorders_view.php?id=" . $rows['wo_no'] . "' target='blank'>" . $rows['wo_no'] . "</a></td>
					<td>" . getProjectNameByID($rows['request_project']) . "</td>
					<td>" . date('jS F Y', strtotime($rows['created_at'])) . "</td>
					<td>" . get_status_name($rows['status']) . "</td>
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
<script>
    $(function () {
        $("#from_date").datepicker({
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
        $("#to_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
