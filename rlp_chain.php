<?php 
include 'header.php';
if(!check_permission('rlp-chain-list')){ 
    include("404.php");
    exit();
}

$currentUser = $_SESSION['logged']['user_id'] ?? 1; // demo

// --- CREATE / UPDATE ---
if(isset($_POST['save'])){
    $id         = $_POST['id'] ?? '';
    $division   = $_POST['division_id'];
    $department = $_POST['department_id'];
    $project    = $_POST['project_id'];
    $rlp_type   = $_POST['rlp_type'];

    $user_ids   = $_POST['user_id'] ?? [];
    $positions  = $_POST['position'] ?? [];

    $users = [];
    foreach($user_ids as $k=>$uid){
        if(!empty($uid) && !empty($positions[$k])){
            $users[$uid] = $positions[$k];
        }
    }
    $users_json = json_encode($users);

    if($id){ // update
        $sql = "UPDATE rlp_access_chain SET 
                division_id='$division',
                department_id='$department',
                project_id='$project',
                rlp_type='$rlp_type',
                users='$users_json',
                updated_by='$currentUser',
                updated_at=NOW()
                WHERE id='$id'";
    } else { // insert
        $sql = "INSERT INTO rlp_access_chain 
                (division_id, department_id, project_id, rlp_type, users, created_by, created_at)
                VALUES ('$division','$department','$project','$rlp_type','$users_json','$currentUser',NOW())";
    }
    mysqli_query($conn,$sql);
    header("Location: rlp_chain.php"); exit;
}

// --- DELETE ---
if(isset($_GET['delete'])){
    $id = intval($_GET['delete']);
    mysqli_query($conn,"DELETE FROM rlp_access_chain WHERE id=$id");
    header("Location: rlp_chain.php"); exit;
}

// --- EDIT LOAD ---
$edit = null;
$edit_users = [];
if(isset($_GET['edit'])){
    $id = intval($_GET['edit']);
    $edit = mysqli_fetch_assoc(mysqli_query($conn,"SELECT * FROM rlp_access_chain WHERE id=$id"));
    $edit_users = json_decode($edit['users'],true);
}
?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">RLP Chain Info</li>
    </ol>

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
				<div class="col-md-6">
					<form method="post">
						<div class="row">
							<div class="col-md-6">
                                <div class="form-group">
                                    <label for="sel1">Division:</label>
                                    <select class="form-control" id="branch_id" name="division_id" onchange="getDepartmentByBranch(this.value);">
                                        <option value="">Please select</option>
                                        <?php
                                        $table = "branch";
                                        $order = "ASC";
                                        $column = "name";
                                        $datas = getTableDataByTableNameRlp($table, $order, $column);
                                        foreach ($datas as $data) {
                                            ?>
                                            <option value="<?php echo $data->id; ?>" <?php if(isset($edit['division_id']) && $edit['division_id'] == $data->id){ echo 'selected'; } ?>><?php echo $data->name; ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="sel1">Department:</label>
                                    <select class="form-control" id="department_id" name="department_id">
                                        <option value="">Please select</option>
                                        <?php
										if(isset($edit['department_id'])){
                                        $table = "department";
                                        $order = "ASC";
                                        $column = "name";
                                        $datas = getTableDataByTableNameRlp($table, $order, $column);
                                        foreach ($datas as $data) {
                                            ?>
                                            <option value="<?php echo $data->id; ?>" <?php if(isset($edit['department_id']) && $edit['department_id'] == $data->id){ echo 'selected'; } ?>><?php echo $data->name; ?></option>
                                        <?php }} ?>
                                    </select>
                                </div>                        
                            </div>
						</div>
						
						<input type="hidden" name="id" value="<?= $edit['id'] ?? '' ?>">
						

						<div id="user_list">
							<?php
							if($edit){
								foreach($edit_users as $uid=>$pos){
									echo "<div class='row user-item mb-2'>
											<div class='col-md-6'>
												<select name='user_id[]' class='form-control select2'>";
									$uq=mysqli_query($conn,"SELECT id,name,office_id FROM users ORDER BY name");
									while($u=mysqli_fetch_assoc($uq)){
										$sel = ($u['id']==$uid) ? "selected" : "";
										echo "<option value='{$u['id']}' $sel>{$u['office_id']} | {$u['name']}</option>";
									}
									echo "      </select>
											</div>
											<div class='col-md-4'>
												<input type='number' name='position[]' class='form-control' value='$pos'>
											</div>
											<div class='col-md-2'>
												<button type='button' class='btn btn-danger remove-user'>X</button>
											</div>
										</div>";
								}
							} else {
								echo "<div class='row user-item mb-2'>
										<div class='col-md-6'>
											<select name='user_id[]' class='form-control select2'>";
								$uq=mysqli_query($conn,"SELECT id,name,office_id FROM users ORDER BY name");
								while($u=mysqli_fetch_assoc($uq)){
									echo "<option value='{$u['id']}'>{$u['office_id']} | {$u['name']}</option>";
								}
								echo "      </select>
										</div>
										<div class='col-md-4'>
											<input type='number' name='position[]' class='form-control' placeholder='Approval Position'>
										</div>
										<div class='col-md-2'>
											<button type='button' class='btn btn-danger remove-user'>X</button>
										</div>
									</div>";
							}
							?>
						</div>
						<br>
						<button type="button" id="add_user" class="btn btn-success">+ Add User</button>
						<button type="submit" name="save" class="btn btn-primary">Save</button>
					</form>
				</div>
				<div class="col-md-6">
				<h3>Existing RLP Chains</h3>
            <table class="table table-bordered">
                <tr>
					<th>Division</th>
					<th>Department</th>
					<th>Users</th>
					<th>Action</th></tr>
                <?php
                $res=mysqli_query($conn,"SELECT * FROM rlp_access_chain ORDER BY id DESC");
                while($row=mysqli_fetch_assoc($res)){
                    $users=json_decode($row['users'],true);
					$division =getDivisionNameById($row['division_id']);
					$department =getDepartmentNameById($row['department_id']);
                    echo "<tr>
                            <td>{$division}</td>
                            <td>{$department}</td>
                            <td>";
                    foreach($users as $uid=>$pos){
                        $uname=mysqli_fetch_assoc(mysqli_query($conn,"SELECT name FROM users WHERE id=$uid"));
                        echo $uname['name']." (Pos: $pos)<br>";
                    }
                    echo "</td>
                          <td>
                            <a href='rlp_chain.php?edit={$row['id']}' class='btn btn-info btn-xs'>Edit</a>
                            <a href='rlp_chain.php?delete={$row['id']}' class='btn btn-danger btn-xs' onclick='return confirm(\"Delete?\")'>Delete</a>
                          </td>
                          </tr>";
                }
                ?>
            </table>
				</div>
			</div>
        </div>
    </div>
</div>

<!-- include select2 js/css -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
$(document).ready(function(){
    // function to initialize select2 with proper width
    function initSelect2(el){
        el.select2({
            width: '100%'  // ensure full width
        });
    }

    // initialize all existing select2
    initSelect2($('.select2'));

    // Add/remove user row
    $(document).on('click','#add_user',function(){
        // Clone the first row
        var firstRow = $(".user-item:first");
        
        // Destroy select2 in the row before cloning
        firstRow.find('select.select2').select2('destroy');
        
        var newRow = firstRow.clone(true, true);

        // Reset inputs and selects
        newRow.find("input").val("");
        newRow.find("select").val("").prop('selected', false);

        // Re-initialize select2 for both first and cloned row
        initSelect2(firstRow.find('select'));
        initSelect2(newRow.find('select'));

        $("#user_list").append(newRow);
    });

    // Remove user row
    $(document).on('click','.remove-user',function(){
        $(this).closest('.user-item').remove();
    });
});
</script>


<?php include 'footer.php' ?>
