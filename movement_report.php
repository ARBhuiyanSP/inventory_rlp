<?php include 'header.php' ?>
<?php/*  if(!check_permission('material-movement-report')){ 
        include("404.php");
        exit();
 } */ ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active">Material Movement Reports</li>
    </ol>
    <!-- receive search start here -->
    <?php include 'search/movement_report_search.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>