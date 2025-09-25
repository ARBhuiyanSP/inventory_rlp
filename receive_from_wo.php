<?php 
include 'header.php';
?>
<?php if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Receive Entry Form
            <a href="receive-list.php" style="float:right"><i class="fas fa-list"></i> List<a>
        </div>
        <div class="card-body">
                        <?php include 'partial/receive_from_wo.php'; ?>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>


