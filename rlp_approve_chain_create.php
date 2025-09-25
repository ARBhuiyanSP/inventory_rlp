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
        <li class="breadcrumb-item active"> RLP Approval Chain Create</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> RLP Approval Chain Create
            <a href="rlp_approve_chain_list.php" style="float:right"><i class="fas fa-list"></i> List<a>
        </div>
        <div class="card-body">
                    <!-- /.box-header -->
                    <!-- form start -->
                    <?php include 'partial/rlp_approve_chain_create.php' ?>
                </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>