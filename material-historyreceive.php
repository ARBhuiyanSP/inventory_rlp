<?php include 'header.php' ?>
<?php if(!check_permission('material-receive-history')){ 
        include("404.php");
        exit();
 } ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active">Material Receive History</li>
    </ol>
    <!-- receive search start here -->
    <?php include 'search/material_history_searchreceive.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>