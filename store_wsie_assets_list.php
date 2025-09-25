<?php 
include 'header.php';
?>
<?php/*  if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 }  */?>
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
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List</a></div>
        <div class="card-body">
            <!--here your code will go-->
            
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label>Store</label>
												<select class="form-control select2" id="project_id" name="store_id">
														<option value="all">All Store</option>
														<?php $results = mysqli_query($conn, "SELECT * FROM `store`"); 
														while ($row = mysqli_fetch_array($results)) { ?>
														<option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
														<?php } ?>
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
							
							 <?php
if(isset($_POST['submit'])){
	$status	= 'active';
	//$origin			= $_POST['origin'];
	$store_id		= $_POST['store_id'];
	if($store_id>0){
		$store = getStoreNameById($store_id);
	}else{
		$store = 'All Store';
	}
	
	
	//query from db
	$resultSet = mysqli_query($conn, "SELECT * FROM `ams_products` WHERE `status` =  '$status'".($store_id!='all'?" AND `store_id` = '$store_id'":'')." ");
	
	/* $resultSet = mysqli_query($conn, "SELECT * FROM `equipments` WHERE `assign_status` =  '$assign_status'".($project_id!='all'?" AND `project_id` = '$project_id'":'')." ".($makeby!='all'?" AND `makeby` = '$makeby'":'')." "); */
	$count = $resultSet->num_rows;
	
/* 	echo "<pre>";
print_r($resultSet);
echo "</pre>"; */
	
	if($resultSet->num_rows > 0){
		echo "<div id='printableArea'><center><h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1><h2>SAIF POWERTEC LIMITED</h2><p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p><h3>Assets List Report</h3>Store Location : $store - Total Assets: $count</center>";
		echo "<table id='rlp_list_table' class='table table-bordered table-striped list-table-custom-style'>
		<tr>
			<th width='5%'>SL No</th>
			<th>Item Name</th>
			<th width='10%'>Item Code</th>
			<th>Description</th>
			<th>Model</th>
		</tr>";

		$i = 0;
		while($rows = $resultSet->fetch_assoc()) {
			$i++;
			echo "<tr><td>" . $i . "</td>
					<td>" . $rows['item_name'] . "</td>
					<td>" . $rows['sl_no'] . "</td>
					<td>" . $rows['assets_description'] . "</td>
					<td>" . $rows['model'] . "</td>
					
					
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