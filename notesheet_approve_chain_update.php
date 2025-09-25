<?php 
include 'header.php';
?>
<?php if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Notesheet Approval Chain List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Notesheet Approval Chain List
			<a href="notesheet_approve_chain_list.php" style="float:right"><i class="fas fa-list"></i> List<a>
		</div>
        <div class="card-body">
                        <?php include 'partial/notesheet_approve_chain_update.php'; ?>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>