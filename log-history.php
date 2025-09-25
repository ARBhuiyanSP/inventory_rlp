<?php include 'header.php' ?>
<?php/*  if(!check_permission('log-history')){ 
        include("404.php");
        exit();
 } */ ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Log History</li>
    </ol>
    <!-- receive search start here -->
    <?php include 'search/log_search.php'; ?>
    <!-- end receive search -->


</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>