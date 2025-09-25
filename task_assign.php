<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Task Assign Form
            <a href="task_list.php" style="float:right"><i class="fas fa-plus"></i> Task List<a>
        </div>
        <div class="card-body">
		   <?php include 'partial/task_assign.php'; ?>
		</div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

