<?php include 'header.php' ?>
<?php /* if(!check_permission('categorywise-material-receive-details')){ 
        include("404.php");
        exit();
 } */ ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active">Materialwise Material Consumption Report</li>
    </ol>
    <!-- receive search start here -->
    <?php include 'search/materialwise_consumption_report_search.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>