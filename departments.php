<?php 
include 'header.php';
// ================= ADD =================
if (isset($_POST['add'])) {
    $company_id = $_POST['company_id'];
    $branch_id = $_POST['branch_id'];
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];

    $stmt = $conn->prepare("INSERT INTO department (company_id, branch_id, name, short_name) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $company_id, $branch_id, $name, $short_name);
    $stmt->execute();
    $stmt->close();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $company_id = $_POST['company_id'];
    $branch_id = $_POST['branch_id'];
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];

    $stmt = $conn->prepare("UPDATE department SET company_id=?, branch_id=?, name=?, short_name=? WHERE id=?");
    $stmt->bind_param("iissi", $company_id, $branch_id, $name, $short_name, $id);
    $stmt->execute();
    $stmt->close();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM department WHERE id=$id");
}

// ================= AJAX: GET BRANCHES =================
if (isset($_GET['get_branches'])) {
    $company_id = intval($_GET['get_branches']);
    $branches = $conn->query("SELECT id, name FROM branch WHERE company_id=$company_id");
    while ($b = $branches->fetch_assoc()) {
        echo "<option value='".$b['id']."'>".$b['name']."</option>";
    }
    exit();
}

// ================= Pagination =================
$limit = 10; // rows per page
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$start = ($page - 1) * $limit;

// Total rows
$total_result = $conn->query("SELECT COUNT(*) as total FROM department");
$total_row = $total_result->fetch_assoc();
$total_pages = ceil($total_row['total'] / $limit);

// Fetch rows with limit
$result = $conn->query("SELECT d.*, c.company_name, b.name as branch_name 
                         FROM department d 
                         LEFT JOIN companies c ON d.company_id=c.id 
                         LEFT JOIN branch b ON d.branch_id=b.id 
                         ORDER BY d.id DESC 
                         LIMIT $start, $limit");
?>
<?php /* if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 }  */?>
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
            <div class="col-md-3">
                <!-- Department Form -->
                <form method="POST" id="deptForm">
                    <input type="hidden" name="id" id="dept_id">
                    <div class="form-group">
                        <label>Company</label>
                        <select name="company_id" id="company_id" class="form-control" required>
                            <option value="">Select Company</option>
                            <?php
                            $companies = $conn->query("SELECT * FROM companies");
                            while ($c = $companies->fetch_assoc()) {
                                echo "<option value='".$c['id']."'>".$c['company_name']."</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Branch</label>
                        <select name="branch_id" id="branch_id" class="form-control" required>
                            <option value="">Select Branch</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Department Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Short Name</label>
                        <input type="text" name="short_name" id="short_name" class="form-control" required>
                    </div>
                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Department</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Department</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>
            <div class="col-md-9">
                
                <div class="box-header">
                    <button class="btn btn-primary linktext" onclick="window.location.href='companies.php';"> Company List</button>
                    <button class="btn btn-primary linktext" onclick="window.location.href='divisions.php';"> Division List</button>
                    <button class="btn btn-success linktext"> Department List</button>
                    <button class="btn btn-primary linktext" onclick="window.location.href='prolocs.php';"> Project/Location List</button>
                </div>
                <!-- Department Table -->
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <th>Company</th>
                        <th>Branch</th>
                        <th>Name</th>
                        <th>Short Name</th>
                        <th>Action</th>
                    </tr>
                    <?php
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>
                                <td>".$row['id']."</td>
                                <td>".$row['company_name']."</td>
                                <td>".$row['branch_name']."</td>
                                <td>".$row['name']."</td>
                                <td>".$row['short_name']."</td>
                                <td>
                                    <button class='btn btn-info btn-sm editBtn'
                                        data-id='".$row['id']."'
                                        data-company='".$row['company_id']."'
                                        data-branch='".$row['branch_id']."'
                                        data-name='".$row['name']."'
                                        data-short='".$row['short_name']."'>Edit</button>
                                    <a href='departments.php?delete=".$row['id']."' class='btn btn-danger btn-sm' onclick=\"return confirm('Are you sure?')\">Delete</a>
                                </td>
                              </tr>";
                    }
                    ?>
                </table>

                <!-- Pagination Links -->
                <nav>
                    <ul class="pagination">
                        <?php for($i = 1; $i <= $total_pages; $i++): ?>
                            <li class="<?php echo ($i == $page) ? 'active' : ''; ?>">
                                <a href="?page=<?php echo $i; ?>"><?php echo $i; ?></a>
                            </li>
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
<script src="vendor/bower_components/jquery/dist/jquery.min.js"></script>
<script>
$(document).ready(function(){
    // Load Branches on Company Change
    $("#company_id").change(function(){
        var company_id = $(this).val();
        $.get("departments.php?get_branches="+company_id, function(data){
            $("#branch_id").html("<option value=''>Select Branch</option>"+data);
        });
    });

    // Edit Button
    $(".editBtn").click(function(){
        $("#dept_id").val($(this).data("id"));
        $("#company_id").val($(this).data("company"));
        $("#name").val($(this).data("name"));
        $("#short_name").val($(this).data("short"));

        // Load branches first, then select correct one
        var companyId = $(this).data("company");
        var branchId = $(this).data("branch");
        $.get("departments.php?get_branches="+companyId, function(data){
            $("#branch_id").html("<option value=''>Select Branch</option>"+data);
            $("#branch_id").val(branchId);
        });

        $("#addBtn").hide();
        $("#updateBtn, #cancelEdit").show();
    });

    // Cancel Edit
    $("#cancelEdit").click(function(){
        $("#deptForm")[0].reset();
        $("#dept_id").val("");
        $("#addBtn").show();
        $("#updateBtn, #cancelEdit").hide();
    });
});
</script>
<?php include 'footer.php' ?>