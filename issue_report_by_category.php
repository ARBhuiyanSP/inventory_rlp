<?php include 'header.php' ?>
<?php if(!check_permission('categorywise-material-issue-details')){ 
        include("404.php");
        exit();
 } ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active">Categorywise Material Issue Report</li>
    </ol>
    <!-- receive search start here -->
    <?php include 'search/issue_report_by_category_search.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>