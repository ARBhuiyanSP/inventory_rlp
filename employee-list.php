<?php 
include 'header.php';

/*  if(!check_permission('unit-list')){ 
        include("404.php");
        exit();
 } */ 
 // ================= ADD =================
if (isset($_POST['add'])) {
    $employeeid = $_POST['employeeid'];
    $name = $_POST['name'];
    $compnay = $_POST['company_id']; // keeping typo as in table
    $division = $_POST['division_id'];
    $department = $_POST['department_id'];
    $designation = $_POST['designation'];
    $group = $_POST['group'];
    $created_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("INSERT INTO inv_employee (employeeid, name, compnay, division, department, designation, `group`, created_at) VALUES (?,?,?,?,?,?,?,?)");
    $stmt->bind_param("ssiiisss", $employeeid, $name, $compnay, $division, $department, $designation, $group, $created_at);
    $stmt->execute();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $employeeid = $_POST['employeeid'];
    $name = $_POST['name'];
    $compnay = $_POST['company_id'];
    $division = $_POST['division_id'];
    $department = $_POST['department_id'];
    $designation = $_POST['designation'];
    $group = $_POST['group'];
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE inv_employee SET employeeid=?, name=?, compnay=?, division=?, department=?, designation=?, `group`=?, updated_at=? WHERE id=?");
    $stmt->bind_param("ssiiisssi", $employeeid, $name, $compnay, $division, $department, $designation, $group, $updated_at, $id);
    $stmt->execute();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM inv_employee WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
}

// ================= Pagination + Search =================
$limit = 12; // change to 15 if you want: $limit = 15;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page-1)*$limit;

$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$where = "";
if ($search !== '') {
    $safe = $conn->real_escape_string($search);
    $where = "WHERE e.employeeid LIKE '%$safe%'
              OR e.name LIKE '%$safe%'
              OR c.company_name LIKE '%$safe%'
              OR b.name LIKE '%$safe%'
              OR d.name LIKE '%$safe%'
              OR e.designation LIKE '%$safe%'
              OR e.`group` LIKE '%$safe%'";
}

// Total rows (with same joins so search works correctly)
$total_sql = "SELECT COUNT(*) AS total
              FROM inv_employee e
              LEFT JOIN companies c ON e.compnay = c.id
              LEFT JOIN branch b ON e.division = b.id
              LEFT JOIN department d ON e.department = d.id
              $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];
$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch employees (paginated + filtered)
$list_sql = "SELECT e.*, c.company_name, b.name AS branch_name, d.name AS department_name
             FROM inv_employee e
             LEFT JOIN companies c ON e.compnay = c.id
             LEFT JOIN branch b ON e.division = b.id
             LEFT JOIN department d ON e.department = d.id
             $where
             ORDER BY e.id DESC
             LIMIT $start, $limit";
$employees = $conn->query($list_sql);

// Fetch all companies
$companies = $conn->query("SELECT * FROM companies ORDER BY company_name ASC");

 
 ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Unit Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Unit Entry Form
		</div>
        <div class="card-body">
            <div class="row">
            <!-- Add/Edit Form -->
            <div class="col-md-3">
                <form method="post" id="employeeForm">
                    <input type="hidden" name="id" id="employee_id">
                    <div class="form-group">
                        <label>Employee ID</label>
                        <input type="text" name="employeeid" id="employeeid" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Company</label>
                        <select name="company_id" id="company_id" class="form-control" required>
                            <option value="">Select Company</option>
                            <?php while($c = $companies->fetch_assoc()): ?>
                                <option value="<?= $c['id'] ?>"><?= htmlspecialchars($c['company_name']) ?></option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Division</label>
                        <select name="division_id" id="division_id" class="form-control" required>
                            <option value="">Select Division</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department</label>
                        <select name="department_id" id="department_id" class="form-control" required>
                            <option value="">Select Department</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designation</label>
                        <input type="text" name="designation" id="designation" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Group</label>
                        <input type="text" name="group" id="group" class="form-control">
                    </div>
                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Employee</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Employee</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>

            <!-- Employees Table -->
            <div class="col-md-9">
                <!-- Search bar -->
                <form method="GET" class="form-inline" style="margin-bottom:10px;">
                    <div class="form-group">
                        <input type="text" name="search" class="form-control" style="min-width:280px"
                               placeholder="Search by ID, name, company, division, department, designation, group"
                               value="<?= htmlspecialchars($search) ?>">
                    </div>
                    <button type="submit" class="btn btn-primary">Search</button>
                    <?php if ($search !== ''): ?>
                        <a href="?page=1" class="btn btn-default">Reset</a>
                    <?php endif; ?>
                </form>

                <table class="table table-bordered table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Company</th>
                        <th>Division</th>
                        <th>Department</th>
                        <th>Designation</th>
                        <th>Group</th>
                        <th>Action</th>
                    </tr>
                    <?php if ($employees && $employees->num_rows > 0): ?>
                        <?php while($row = $employees->fetch_assoc()): ?>
                            <tr>
                                <td><?= $row['id'] ?></td>
                                <td><?= htmlspecialchars($row['employeeid']) ?></td>
                                <td><?= htmlspecialchars($row['name']) ?></td>
                                <td><?= htmlspecialchars($row['company_name']) ?></td>
                                <td><?= htmlspecialchars($row['branch_name']) ?></td>
                                <td><?= htmlspecialchars($row['department_name']) ?></td>
                                <td><?= htmlspecialchars($row['designation']) ?></td>
                                <td><?= htmlspecialchars($row['group']) ?></td>
                                <td>
                                    <button class="btn btn-info btn-sm editBtn"
                                            data-id="<?= $row['id'] ?>"
                                            data-employeeid="<?= htmlspecialchars($row['employeeid']) ?>"
                                            data-name="<?= htmlspecialchars($row['name']) ?>"
                                            data-company="<?= $row['compnay'] ?>"
                                            data-division="<?= $row['division'] ?>"
                                            data-department="<?= $row['department'] ?>"
                                            data-designation="<?= htmlspecialchars($row['designation']) ?>"
                                            data-group="<?= htmlspecialchars($row['group']) ?>">Edit</button>
                                    <a href="?delete=<?= $row['id'] ?><?= $search!=='' ? '&search='.urlencode($search) : '' ?>"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Delete this employee?')">Delete</a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="9" class="text-center">No employees found</td></tr>
                    <?php endif; ?>
                </table>

                <!-- Pagination Links (keeps search term) -->
                <nav>
                    <ul class="pagination">
                        <?php
                        $adjacents = 2;
                        $prev = $page - 1;
                        $next = $page + 1;
                        $q = ($search!=='' ? '&search='.urlencode($search) : '');

                        // Prev
                        echo ($page > 1)
                            ? '<li><a href="?page='.$prev.$q.'">&laquo; Prev</a></li>'
                            : '<li class="disabled"><span>&laquo; Prev</span></li>';

                        // First
                        if ($page > $adjacents + 1) {
                            echo '<li><a href="?page=1'.$q.'">1</a></li>';
                            if ($page > $adjacents + 2) echo '<li class="disabled"><span>...</span></li>';
                        }

                        // Middle pages
                        for ($i = max(1, $page-$adjacents); $i <= min($total_pages, $page+$adjacents); $i++) {
                            echo ($i == $page)
                                ? '<li class="active"><span>'.$i.'</span></li>'
                                : '<li><a href="?page='.$i.$q.'">'.$i.'</a></li>';
                        }

                        // Last
                        if ($page < $total_pages - $adjacents) {
                            if ($page < $total_pages - $adjacents - 1) echo '<li class="disabled"><span>...</span></li>';
                            echo '<li><a href="?page='.$total_pages.$q.'">'.$total_pages.'</a></li>';
                        }

                        // Next
                        echo ($page < $total_pages)
                            ? '<li><a href="?page='.$next.$q.'">Next &raquo;</a></li>'
                            : '<li class="disabled"><span>Next &raquo;</span></li>';
                        ?>
                    </ul>
                </nav>
            </div>
        </div>
        </div>
    </div>

</div>

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
<!-- /.container-fluid -->
<?php include 'footer.php' ?>