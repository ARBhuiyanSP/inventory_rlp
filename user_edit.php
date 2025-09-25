<?php 
include 'header.php';

$id = $_GET['id'];
$queryUser = "SELECT * FROM `users` WHERE `id`='$id'";
$resultUser = $conn->query($queryUser);
 $userData = $resultUser->fetch_object();
?>
<?php /* if(!check_permission('user-edit')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<!--<link href="css/form-entry.css" rel="stylesheet">-->
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">User Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            User Entry
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List<a></div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post">
                    <div class="row" id="div1" style="">
                        <div class="col-xs-3">
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" name="name" id="name" class="form-control" value="<?php echo $userData->name; ?>" required >
                            </div>
                        </div>
						<input type="hidden" name="id" id="name" class="form-control" value="<?php echo $userData->id; ?>" required >
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" id="email" class="form-control" value="<?php echo $userData->email; ?>" required >
                            </div>
                        </div>
						
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>User Role</label>
                                <select class="form-control" id="role_id" name="role_id" required>
                                    <option value="">Select</option>
                                    <?php
                                    $roleData = getTableDataByTableName('roles');
                                    ;
                                    if (isset($roleData) && !empty($roleData)) {
                                        foreach ($roleData as $data) {
                                            if($userData->role_id == $data['id']){
                                                $selected   = 'selected';
                                                }else{
                                                $selected   = '';
                                                }
                                            ?>
                                            <option value="<?php echo $data['id']; ?>" <?php echo $selected; ?>><?php echo $data['name']; ?></option>
                                            <?php
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>Warehouse</label>
                                <select class="form-control" id="warehouse_id" name="warehouse_id" required>
                                    <option value="">Select</option>
                                    <?php
                                    $projectsData = getTableDataByTableName('inv_warehosueinfo');
                                    ;
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                                if($userData->warehouse_id == $data['id']){
                                                $selected   = 'selected';
                                                }else{
                                                $selected   = '';
                                                }
                                            ?>
                                            <option value="<?php echo $data['id']; ?>" <?php echo $selected; ?>><?php echo $data['name']; ?></option>
                                            <?php
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="modal-footer">
                                    <input type="submit" name="user_update_submit" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />
                                </div>    
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<script>
    $(function () {
        $("#mrr_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#challan_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#requisition_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<?php include 'footer.php' ?>