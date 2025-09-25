<?php 
include 'header.php';


    $currentUserId  =   $_SESSION['logged']['user_id'];
    $cs_id         =   $_GET['id'];    
    $cs_details    =   getCsDetailsData($cs_id);   
    $cs_info       =   $cs_details['cs_info']; 
    $cs_details    =   $cs_details['cs_details'];
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
            <i class="fas fa-table"></i> CS Edit
            <a href="cs_list.php" style="float:right"><i class="fas fa-list"></i> List<a>
        </div>
        <div class="card-body">
                        <?php include 'partial/cs_edit_form.php'; ?>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>