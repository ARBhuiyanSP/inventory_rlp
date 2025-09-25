<?php 
include 'header.php';

/*  if(!check_permission('equipment-list')){ 
        include("404.php");
        exit();
 }  */?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Equipment Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <ul class="pagination pagination-sm no-margin pull-right">
                                <?php //if(hasAccessPermission($user_id_session, 'crlp', 'view_access')){ ?>
                                <li><a href="equipment_entry.php"><i class="fa fa-user-plus"></i> Create</a></li>
                                <?php //} ?>
                            </ul>
		</div>
        <div class="card-body">
                        <?php include 'partial/equipment_list_2.php'; ?>
                   </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
