<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Maintenance Cost</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Logsheet List
            <a href="logsheet.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
        </div>
        <div class="card-body">
                       <div class="box-body">
		 <!--logsheet_list_table  reference footer.php-->
            <table id="logsheet_list_table" class="table table-striped table-bordered  list-table-custom-style" style="width:100%">
				<thead>
					<tr class="tr_header">	
						<th>slno</th>					
						<th>Date</th>
						<th>Equipment Name</th>
						<th>Project Name</th>
						<th>work Details</th>
						<th>Run HR/KM</th>
						<th>Close HR/KM</th>
						<th>Total HR/KM</th>
						

						<th style="min-width: 190px">Action</th>
					</tr>
				</thead>
			</table>
		</div>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

