<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> RLP List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> RLP List
            <a href="rlp_create.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
        </div>
        <div class="card-body">
                        <?php include 'partial/rent-list.php'; ?>
                        <?php //include 'partial/rlp_list2.php'; ?>
                     </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>