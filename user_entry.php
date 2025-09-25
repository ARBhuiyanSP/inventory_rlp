<?php 
include 'header.php';
// Fetch all companies
$companies = $conn->query("SELECT * FROM companies ORDER BY company_name ASC");
?>
<?php /* if(!check_permission('user-add')){ 
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
                                <label>First Name</label>
                                <input type="text" name="first_name" id="first_name" class="form-control" required >
                                <!-- <input type="hidden" name="user_add" value="user_add"> -->
                            </div>
                        </div>
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" name="last_name" id="last_name" class="form-control" required >
                            </div>
                        </div>
						
						<div class="col-xs-3">
							<div class="form-group">
								<label>Company</label>
								<select name="company_id" id="company_id" class="form-control" required>
									<option value="">Select Company</option>
									<?php while($c = $companies->fetch_assoc()): ?>
										<option value="<?= $c['id'] ?>"><?= htmlspecialchars($c['company_name']) ?></option>
									<?php endwhile; ?>
								</select>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group">
								<label>Division</label>
								<select name="division_id" id="division_id" class="form-control" required>
									<option value="">Select Division</option>
								</select>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group">
								<label>Department</label>
								<select name="department_id" id="department_id" class="form-control" required>
									<option value="">Select Department</option>
								</select>
							</div>
						</div>
						<div class="col-xs-3">
							<div class="form-group">
								<label>Designation</label>
								<input type="text" name="designation" id="designation" class="form-control">
							</div>
						</div>
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" id="email" class="form-control" required >
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
                                            ?>
                                            <option value="<?php echo $data['id']; ?>"><?php echo $data['name']; ?></option>
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
                                            ?>
                                            <option value="<?php echo $data['id']; ?>"><?php echo $data['name']; ?></option>
                                            <?php
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
						<div class="col-xs-3">
                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" name="password" id="password" class="form-control" required >
                            </div>
                        </div>
                    </div>
                    <div class="row" style="">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <div class="modal-footer">
                                    <input type="submit" name="user_submit" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />
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

<script>
$(document).ready(function(){
    // Load divisions on company change
    $('#company_id').change(function(){
        var company_id = $(this).val();
        $.post('get_branches.php', {company_id: company_id}, function(data){
            $('#division_id').html(data);
            $('#department_id').html('<option value="">Select Department</option>');
        });
    });

    // Load departments on division change
    $('#division_id').change(function(){
        var branch_id = $(this).val();
        $.post('get_departments.php', {branch_id: branch_id}, function(data){
            $('#department_id').html(data);
        });
    });

    // Edit button click
    $('.editBtn').click(function(){
        $('#employee_id').val($(this).data('id'));
        $('#employeeid').val($(this).data('employeeid'));
        $('#name').val($(this).data('name'));
        $('#company_id').val($(this).data('company')).change();
        var division_id = $(this).data('division');
        var department_id = $(this).data('department');
        setTimeout(function(){
            $('#division_id').val(division_id).change();
            setTimeout(function(){
                $('#department_id').val(department_id);
            },200);
        },200);
        $('#designation').val($(this).data('designation'));
        $('#group').val($(this).data('group'));
        $('#addBtn').hide();
        $('#updateBtn, #cancelEdit').show();
    });

    // Cancel edit
    $('#cancelEdit').click(function(){
        $('#employeeForm')[0].reset();
        $('#employee_id').val('');
        $('#addBtn').show();
        $('#updateBtn, #cancelEdit').hide();
    });
});
</script>
<?php include 'footer.php' ?>