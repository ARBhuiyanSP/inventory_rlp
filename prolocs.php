<?php 
include 'header.php';

// ================= ADD =================
if (isset($_POST['add'])) {
    $code = $_POST['code'];
    $company_id = $_POST['company_id'];
    $division_id = $_POST['division_id'];
    $department_id = $_POST['department_id'];
    $project_name = $_POST['project_name'];
    $address = $_POST['address'];
    $created_by = 'admin'; 
    $created_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("INSERT INTO projects (code, company_id, division_id, department_id, project_name, address, created_by, created_at) VALUES (?,?,?,?,?,?,?,?)");
    $stmt->bind_param("siiissss", $code, $company_id, $division_id, $department_id, $project_name, $address, $created_by, $created_at);
    $stmt->execute();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $code = $_POST['code'];
    $company_id = $_POST['company_id'];
    $division_id = $_POST['division_id'];
    $department_id = $_POST['department_id'];
    $project_name = $_POST['project_name'];
    $address = $_POST['address'];
    $updated_by = 'admin';
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE projects SET code=?, company_id=?, division_id=?, department_id=?, project_name=?, address=?, updated_by=?, updated_at=? WHERE id=?");
    $stmt->bind_param("siiissssi", $code, $company_id, $division_id, $department_id, $project_name, $address, $updated_by, $updated_at, $id);
    $stmt->execute();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM projects WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
}

// ================= Pagination =================
$limit = 10;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$start = ($page-1)*$limit;

// Total rows
$total_result = $conn->query("SELECT COUNT(*) as total FROM projects");
$total_row = $total_result->fetch_assoc();
$total_pages = ceil($total_row['total']/$limit);

// Fetch paginated projects
$projects = $conn->query("SELECT p.*, c.company_name, b.name as branch_name, d.name as department_name
                          FROM projects p
                          LEFT JOIN companies c ON p.company_id = c.id
                          LEFT JOIN branch b ON p.division_id = b.id
                          LEFT JOIN department d ON p.department_id = d.id
                          ORDER BY p.id DESC
                          LIMIT $start, $limit");

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
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List</a></div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="row">
            <!-- Add/Edit Form -->
            <div class="col-md-3">
                <form method="post" id="projectForm">
                    <input type="hidden" name="id" id="project_id">
                    <div class="form-group">
                        <label>Project Code</label>
                        <input type="text" name="code" id="code" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Company</label>
                        <select name="company_id" id="company_id" class="form-control" required>
                            <option value="">Select Company</option>
                            <?php while($c = $companies->fetch_assoc()): ?>
                                <option value="<?= $c['id'] ?>"><?= $c['company_name'] ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Branch (Division)</label>
                        <select name="division_id" id="division_id" class="form-control" required>
                            <option value="">Select Branch</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <select name="department_id" id="department_id" class="form-control" required>
                            <option value="">Select Department</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Project Name</label>
                        <input type="text" name="project_name" id="project_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea name="address" id="address" class="form-control"></textarea>
                    </div>
                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Project</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Project</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>

            <!-- Projects Table -->
            <div class="col-md-9">
                <div class="box-header">
                    <button class="btn btn-primary linktext" onclick="window.location.href='companies.php';"> Company List</button>
                    <button class="btn btn-primary linktext" onclick="window.location.href='divisions.php';"> Division List</button>
                    <button class="btn btn-primary linktext" onclick="window.location.href='departments.php';"> Department List</button>
                    <button class="btn btn-success linktext"> Project/Location List</button>
                </div>
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Code</th>
                        <th>Company</th>
                        <th>Branch</th>
                        <th>Department</th>
                        <th>Project Name</th>
                        <th>Address</th>
                        <th>Action</th>
                    </tr>
                    <?php while($row = $projects->fetch_assoc()): ?>
                        <tr>
                            <td><?= $row['id'] ?></td>
                            <td><?= $row['code'] ?></td>
                            <td><?= $row['company_name'] ?></td>
                            <td><?= $row['branch_name'] ?></td>
                            <td><?= $row['department_name'] ?></td>
                            <td><?= $row['project_name'] ?></td>
                            <td><?= $row['address'] ?></td>
                            <td>
                                <button class="btn btn-info btn-sm editBtn"
                                        data-id="<?= $row['id'] ?>"
                                        data-code="<?= $row['code'] ?>"
                                        data-company="<?= $row['company_id'] ?>"
                                        data-division="<?= $row['division_id'] ?>"
                                        data-department="<?= $row['department_id'] ?>"
                                        data-name="<?= $row['project_name'] ?>"
                                        data-address="<?= $row['address'] ?>">Edit</button>
                                <a href="?delete=<?= $row['id'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this project?')">Delete</a>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </table>

                <!-- Pagination Links -->
                <nav>
                    <ul class="pagination">
                        <?php for($i=1; $i<=$total_pages; $i++): ?>
                            <li class="<?= ($i==$page)?'active':''; ?>"><a href="?page=<?= $i ?>"><?= $i ?></a></li>
                        <?php endfor; ?>
                    </ul>
                </nav>
            </div>
        </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<script>
$(document).ready(function(){
    // Load branches on company change
    $('#company_id').change(function(){
        var company_id = $(this).val();
        $.post('get_branches.php', {company_id: company_id}, function(data){
            $('#division_id').html(data);
            $('#department_id').html('<option value="">Select Department</option>');
        });
    });

    // Load departments on branch change
    $('#division_id').change(function(){
        var branch_id = $(this).val();
        $.post('get_departments.php', {branch_id: branch_id}, function(data){
            $('#department_id').html(data);
        });
    });

    // Edit button click
    $('.editBtn').click(function(){
        $('#project_id').val($(this).data('id'));
        $('#code').val($(this).data('code'));
        $('#company_id').val($(this).data('company')).change();
        var division_id = $(this).data('division');
        var department_id = $(this).data('department');
        setTimeout(function(){
            $('#division_id').val(division_id).change();
            setTimeout(function(){
                $('#department_id').val(department_id);
            },200);
        },200);
        $('#project_name').val($(this).data('name'));
        $('#address').val($(this).data('address'));
        $('#addBtn').hide();
        $('#updateBtn, #cancelEdit').show();
    });

    // Cancel edit
    $('#cancelEdit').click(function(){
        $('#projectForm')[0].reset();
        $('#project_id').val('');
        $('#addBtn').show();
        $('#updateBtn, #cancelEdit').hide();
    });
});
</script>
<?php include 'footer.php' ?>