<?php 
include 'header.php';
?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Role Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Role Entry Form
			<a href="role-list.php" style="float:right"><i class="fas fa-list"></i> Role List<a>
		</div>

<?php 
// if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['role_create']=='role_create') {
      if (isset($_POST['role_create']) && !empty($_POST['role_create'])) {
    if (empty($_POST["name"])) {
        $nameErr = "Name is required";
      } else {
        $name = $_POST["name"]; 
      }

    $permissions= $_POST['permissions']; //array data

    // echo "<pre>";
    // print_r($permissions);
    // echo "</pre>";

    //Insert into Roles
    $queryRole = "INSERT INTO `roles` (`name`,`status`) VALUES ('$name','1')";
    $resultRole = $conn->query($queryRole);
    $lastinsertedId =  mysqli_insert_id($conn);

    //Insert into permission_role table
    foreach($permissions as $permission){
        $queryPermission = "INSERT INTO `permission_role` (`permission_id`,`role_id`) VALUES ('$permission','$lastinsertedId')";
        $resultPermission = $conn->query($queryPermission);
    }
}
?>

        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post" name="add_name" id="Role_entry_form" onsubmit="showFormIsProcessing('Role_entry_form');">
                    <div class="row" id="div1" style="">
						<div class="col-xs-4">
                            <div class="form-group">
                                <label>Role Name</label>
                                <input type="text" name="name" id="name" class="form-control" required >
                                <!-- <input type="hidden" name="role_create" value="role_create"> -->
                            </div>
                        </div>
                         <label>Permissions</label>
                         <?php

                                    $rearrange = [];
                                    $permissionData = getTableDataByTableName('permissions');
                                    ;
                                    if (isset($permissionData) && !empty($permissionData)) {
                                        foreach ($permissionData as $data) {
                                                $rearrange[$data["permission_category"]][]=$data;
                                           
                                        }
                                    }
                                    ?>
                        <div class="col-xs-12">
                           <?PHP 
                             foreach ($rearrange as $key=> $data) {
                                ?>
                                <div class="col-md-12"><h3><?php echo $key; ?></h3></div>
                                
                                <?php
                                foreach($data as $key_val){ ?>
                                    <div class="col-xs-4">
                                        <div class="d-flex">
                                            <input id="<?php echo $key_val['id']; ?>" type="checkbox" name="permissions[]"  value="<?php echo $key_val['id']; ?>" style="width: 24px;height: 24px;">
                                            <label for="<?php echo $key_val['id']; ?>" ><?php echo $key_val["display_name"]; ?></label>
                                        </div>
                                    </div>
                                 
                            <?php     }     } ?>
                               
                                
                            
                        </div>
						<div class="col-xs-4">
                            <div class="form-group">
								<label>.</label>
                                <input type="submit" name="role_create" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />   
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
<?php include 'footer.php' ?>