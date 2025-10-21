<?php 
include 'header.php';
?>
<?php  if(!check_permission('workorder-list')){ 
        include("404.php");
        exit();
 }  ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Workorder List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Workorder List
            <a href="rlp_create.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
        </div>
        <div class="card-body">
                       <?php include 'partial/workorders_view.php'; ?>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>





