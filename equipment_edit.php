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
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Equipment Edit
            <a href="equipments-list.php" style="float:right"><i class="fas fa-plus"></i> Equipment lIST<a>
        </div>
        <div class="card-body">
		   <?php include 'partial/equipment_edit_form.php'; ?>
		</div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

