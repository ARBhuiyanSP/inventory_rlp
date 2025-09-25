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
        <li class="breadcrumb-item active"> Rental Site RLP List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Rental Site RLP List
            <a href="rental_rlp_create.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
        </div>
        <div class="card-body">
                        <?php include 'partial/rental_site_rlp_list.php'; ?>
                        <?php //include 'partial/rlp_list2.php'; ?>
                     </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>