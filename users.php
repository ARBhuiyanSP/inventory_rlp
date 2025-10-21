<?php
include 'header.php';
if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 }

// ========== Folder for signature uploads ==========
$upload_dir = __DIR__ . "/images/signatures/";
if (!file_exists($upload_dir)) mkdir($upload_dir, 0777, true);

// ========== ADD ==========
if (isset($_POST['add'])) {
    $name           = trim($_POST['name']);
    $email          = trim($_POST['email']);
    $contact_number = trim($_POST['contact_number']);
    $designation    = trim($_POST['designation']);
    $company_id     = $_POST['company_id'];
    $branch_id      = $_POST['branch_id'];
    $department_id  = $_POST['department_id'];
    $project_id     = $_POST['project_id'];
    $office_id      = trim($_POST['office_id']); // manual entry
    $password       = md5($_POST['password']);
    $created_at     = date("Y-m-d H:i:s");

    // signature upload
    $signature_image = null;
    if (!empty($_FILES['signature_image']['name'])) {
        $ext = strtolower(pathinfo($_FILES['signature_image']['name'], PATHINFO_EXTENSION));
        $allowed = ['jpg','jpeg','png'];
        if (in_array($ext, $allowed) && $_FILES['signature_image']['size'] <= 2*1024*1024) {
            $filename = uniqid('sig_') . '.' . $ext;
            move_uploaded_file($_FILES['signature_image']['tmp_name'], $upload_dir . $filename);
            $signature_image = 'images/signatures/' . $filename;
        }
    }

    $stmt = $conn->prepare("INSERT INTO users 
        (company_id, branch_id, department_id, project_id, designation, name, email, contact_number, password, office_id, signature_image, created_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iiiissssssss", $company_id, $branch_id, $department_id, $project_id, $designation, $name, $email, $contact_number, $password, $office_id, $signature_image, $created_at);
    if (!$stmt->execute()) echo "<div class='alert alert-danger'>Insert Error: " . $stmt->error . "</div>";
}

// ========== UPDATE ==========
if (isset($_POST['update'])) {
    $id             = $_POST['id'];
    $name           = trim($_POST['name']);
    $email          = trim($_POST['email']);
    $contact_number = trim($_POST['contact_number']);
    $designation    = trim($_POST['designation']);
    $company_id     = $_POST['company_id'];
    $branch_id      = $_POST['branch_id'];
    $department_id  = $_POST['department_id'];
    $project_id     = $_POST['project_id'];
    $office_id      = trim($_POST['office_id']); // manual entry
    $updated_at     = date("Y-m-d H:i:s");
    $old_signature  = $_POST['old_signature'];

    // signature upload (optional)
    $signature_image = $old_signature;
    if (!empty($_FILES['signature_image']['name'])) {
        $ext = strtolower(pathinfo($_FILES['signature_image']['name'], PATHINFO_EXTENSION));
        $allowed = ['jpg','jpeg','png'];
        if (in_array($ext, $allowed) && $_FILES['signature_image']['size'] <= 2*1024*1024) {
            $filename = uniqid('sig_') . '.' . $ext;
            move_uploaded_file($_FILES['signature_image']['tmp_name'], $upload_dir . $filename);
            $signature_image = 'images/signatures/' . $filename;
        }
    }

    if (!empty($_POST['password'])) {
        $password = md5($_POST['password']);
        $stmt = $conn->prepare("UPDATE users 
            SET company_id=?, branch_id=?, department_id=?, project_id=?, designation=?, name=?, email=?, contact_number=?, password=?, office_id=?, signature_image=?, updated_at=? 
            WHERE id=?");
        $stmt->bind_param("iiiissssssssi", $company_id, $branch_id, $department_id, $project_id, $designation, $name, $email, $contact_number, $password, $office_id, $signature_image, $updated_at, $id);

    } else {
        $stmt = $conn->prepare("UPDATE users 
            SET company_id=?, branch_id=?, department_id=?, project_id=?, designation=?, name=?, email=?, contact_number=?, office_id=?, signature_image=?, updated_at=? 
            WHERE id=?");
        $stmt->bind_param("iiiisssssss", $company_id, $branch_id, $department_id, $project_id, $designation, $name, $email, $contact_number, $office_id, $signature_image, $updated_at, $id);
    }

    if (!$stmt->execute()) echo "<div class='alert alert-danger'>Update Error: " . $stmt->error . "</div>";
}

// ========== DELETE ==========
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM users WHERE id=?");
    $stmt->bind_param("i", $id);
    if (!$stmt->execute()) echo "<div class='alert alert-danger'>Delete Error: " . $stmt->error . "</div>";
}

// ========== Pagination + Search ==========
$limit = 12;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page-1)*$limit;

$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$where = "";
if ($search !== '') {
    $safe = $conn->real_escape_string($search);
    $where = "WHERE u.name LIKE '%$safe%' OR u.email LIKE '%$safe%' OR c.company_name LIKE '%$safe%' OR b.name LIKE '%$safe%' OR d.name LIKE '%$safe%' OR p.project_name LIKE '%$safe%'";
}

$total_sql = "SELECT COUNT(*) AS total
              FROM users u
              LEFT JOIN companies c ON u.company_id = c.id
              LEFT JOIN branch b ON u.branch_id = b.id
              LEFT JOIN department d ON u.department_id = d.id
              LEFT JOIN projects p ON u.project_id = p.id
              $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];
$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

$list_sql = "SELECT u.*, c.company_name, b.name AS branch_name, d.name AS department_name, p.project_name
             FROM users u
             LEFT JOIN companies c ON u.company_id = c.id
             LEFT JOIN branch b ON u.branch_id = b.id
             LEFT JOIN department d ON u.department_id = d.id
             LEFT JOIN projects p ON u.project_id = p.id
             $where
             ORDER BY u.id DESC
             LIMIT $start, $limit";
$users = $conn->query($list_sql);
$companies = $conn->query("SELECT * FROM companies ORDER BY company_name ASC");
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">User Management</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-users"></i> User Entry</div>
        <div class="card-body">
            <div class="row">
                <!-- Form -->
                <div class="col-md-3">
                    <form method="post" id="userForm" enctype="multipart/form-data">
                        <input type="hidden" name="id" id="user_id">
                        <input type="hidden" name="old_signature" id="old_signature">

                        <div class="form-group"><label>Name</label><input type="text" name="name" id="name" class="form-control" required></div>
                        <div class="form-group"><label>Email</label><input type="email" name="email" id="email" class="form-control" required></div>
                        <div class="form-group"><label>Office ID</label><input type="text" name="office_id" id="office_id" class="form-control" required></div>
                        <div class="form-group"><label>Contact Number</label><input type="text" name="contact_number" id="contact_number" class="form-control"></div>
                        
                        <!-- Password field only for Add -->
                        <div class="form-group" id="passwordDiv">
                            <label>Password (MD5)</label>
                            <input type="password" name="password" id="password" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Signature Image</label>
                            <input type="file" name="signature_image" id="signature_image" class="form-control-file">
                            <div id="sigPreview" class="mt-2"></div>
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
                        <div class="form-group"><label>Division</label><select name="branch_id" id="branch_id" class="form-control" required><option value="">Select Division</option></select></div>
                        <div class="form-group"><label>Department</label><select name="department_id" id="department_id" class="form-control" required><option value="">Select Department</option></select></div>
                        <div class="form-group"><label>Project</label><select name="project_id" id="project_id" class="form-control"><option value="">Select Project</option></select></div>
                        <div class="form-group"><label>Designation</label>
						<select class="form-control select2" id="" name="designation" readonly >
							<?php
							$projectsData = getTableDataByTableName('designations');
							;
							if (isset($projectsData) && !empty($projectsData)) {
								foreach ($projectsData as $data) {
									?>
									<option value="<?php echo $data['id']; ?>"><?php echo $data['name'].'|'.$data['id']; ?></option>
									<?php
								}
							}
							?>
						</select>
						<input type="text" name="" id="designation" class="form-control"></div>

                        <button type="submit" name="add" id="addBtn" class="btn btn-success">Add User</button>
                        <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update User</button>
                        <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                    </form>
                </div>

                <!-- Table -->
                <div class="col-md-9">
                    <form method="GET" class="form-inline mb-3">
                        <input type="text" name="search" class="form-control" placeholder="Search by name, email, branch, dept, project" value="<?= htmlspecialchars($search) ?>" style="min-width:300px;">
                        <button type="submit" class="btn btn-primary ml-2">Search</button>
                        <?php if ($search !== ''): ?>
                            <a href="?page=1" class="btn btn-default ml-2">Reset</a>
                        <?php endif; ?>
                    </form>

                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>ID</th><th>Name</th><th>Division</th><th>Department</th><th>Project</th><th>Designation</th><th>Signature</th><th>Action</th>
                        </tr>
                        <?php if ($users && $users->num_rows > 0): ?>
                            <?php while($u = $users->fetch_assoc()): ?>
                            <tr>
                                <td><?= $u['id'] ?></td>
                                <td><?= htmlspecialchars($u['name']) ?></td>
                                <td><?= htmlspecialchars($u['branch_name']) ?></td>
                                <td><?= htmlspecialchars($u['department_name']) ?></td>
                                <td><?= htmlspecialchars($u['project_name']) ?></td>
                                <td><?= htmlspecialchars($u['designation']) ?></td>
                                <td><?php if($u['signature_image']): ?><img src="<?= $u['signature_image'] ?>" height="40"><?php endif; ?></td>
                                <td>
                                    <button class="btn btn-info btn-sm editBtn"
                                        data-id="<?= $u['id'] ?>"
                                        data-name="<?= htmlspecialchars($u['name']) ?>"
                                        data-email="<?= htmlspecialchars($u['email']) ?>"
                                        data-office="<?= htmlspecialchars($u['office_id']) ?>"
                                        data-contact="<?= htmlspecialchars($u['contact_number']) ?>"
                                        data-designation="<?= htmlspecialchars($u['designation']) ?>"
                                        data-company="<?= $u['company_id'] ?>"
                                        data-branch="<?= $u['branch_id'] ?>"
                                        data-department="<?= $u['department_id'] ?>"
                                        data-project="<?= $u['project_id'] ?>"
                                        data-signature="<?= htmlspecialchars($u['signature_image']) ?>">Edit</button>
                                    <a href="?delete=<?= $u['id'] ?>" onclick="return confirm('Delete this user?')" class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr><td colspan="9" class="text-center">No users found</td></tr>
                        <?php endif; ?>
                    </table>

                    <!-- Pagination -->
                    <?php if ($total_pages > 1): ?>
                    <p class="text-center text-muted">
                        Showing <?= ($start+1) ?>–<?= min($start+$limit,$total) ?> of <?= $total ?> users
                    </p>
                    <nav>
                      <ul class="pagination justify-content-center">
                        <li class="page-item <?= ($page<=1)?'disabled':'' ?>">
                          <a class="page-link" href="?page=<?= max(1,$page-1) ?>&search=<?= urlencode($search) ?>">Previous</a>
                        </li>
                        <?php
                        $start_loop = max(1,$page-2);
                        $end_loop   = min($total_pages,$page+2);
                        for($i=$start_loop;$i<=$end_loop;$i++): ?>
                          <li class="page-item <?= ($page==$i)?'active':'' ?>">
                            <a class="page-link" href="?page=<?= $i ?>&search=<?= urlencode($search) ?>"><?= $i ?></a>
                          </li>
                        <?php endfor; ?>
                        <li class="page-item <?= ($page>=$total_pages)?'disabled':'' ?>">
                          <a class="page-link" href="?page=<?= min($total_pages,$page+1) ?>&search=<?= urlencode($search) ?>">Next</a>
                        </li>
                      </ul>
                    </nav>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
    // Dropdowns
    $('#company_id').change(function(){
        var company_id = $(this).val();
        $.post('get_branches.php', {company_id}, function(data){
            $('#branch_id').html(data);
            $('#department_id').html('<option value="">Select Department</option>');
            $('#project_id').html('<option value="">Select Project</option>');
        });
    });
    $('#branch_id').change(function(){
        var branch_id = $(this).val();
        $.post('get_departments.php', {branch_id}, function(data){
            $('#department_id').html(data);
        });
    });
    $('#department_id').change(function(){
        var dept_id = $(this).val();
        $.post('get_projects.php', {department_id: dept_id}, function(data){
            $('#project_id').html(data);
        });
    });

    // Edit
    $('.editBtn').click(function(){
        $('#user_id').val($(this).data('id'));
        $('#name').val($(this).data('name'));
        $('#email').val($(this).data('email'));
        $('#office_id').val($(this).data('office'));
        $('#contact_number').val($(this).data('contact'));
        $('#designation').val($(this).data('designation'));
        $('#old_signature').val($(this).data('signature'));
        $('#sigPreview').html($(this).data('signature') ? '<img src="'+$(this).data('signature')+'" height="50" class="border">' : '');

        var company_id = $(this).data('company');
        var branch_id  = $(this).data('branch');
        var dept_id    = $(this).data('department');
        var project_id = $(this).data('project');

        $('#company_id').val(company_id);
        $.post('get_branches.php', {company_id}, function(branch_html){
            $('#branch_id').html(branch_html).val(branch_id);
            $.post('get_departments.php', {branch_id}, function(dept_html){
                $('#department_id').html(dept_html).val(dept_id);
                $.post('get_projects.php', {department_id: dept_id}, function(proj_html){
                    $('#project_id').html(proj_html).val(project_id);
                });
            });
        });

        $('#addBtn').hide();
        $('#updateBtn,#cancelEdit').show();
        $('#passwordDiv').hide(); // hide password on edit
    });

    // Cancel edit
    $('#cancelEdit').click(function(){
        $('#userForm')[0].reset();
        $('#sigPreview').html('');
        $('#branch_id,#department_id,#project_id').html('<option value="">Select</option>');
        $('#addBtn').show();
        $('#updateBtn,#cancelEdit').hide();
        $('#passwordDiv').show(); // show password again
    });
});
</script>

<?php include 'footer.php'; ?>
