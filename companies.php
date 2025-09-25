<?php 
include 'header.php';
// Add new company

// ======================
// Company CRUD Operations
// ======================

// Add Company
if (isset($_POST['add'])) {
    $name       = trim($_POST['company_name']);
    $address    = trim($_POST['company_address']);
    $timestamp  = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("
        INSERT INTO companies (company_name, company_address, created_at, updated_at) 
        VALUES (?, ?, ?, ?)
    ");
    $stmt->bind_param("ssss", $name, $address, $timestamp, $timestamp);
    $stmt->execute();
    $stmt->close();
}

// Update Company
if (isset($_POST['update'])) {
    $id         = (int) $_POST['id'];
    $name       = trim($_POST['company_name']);
    $address    = trim($_POST['company_address']);
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("
        UPDATE companies 
        SET company_name = ?, company_address = ?, updated_at = ? 
        WHERE id = ?
    ");
    $stmt->bind_param("sssi", $name, $address, $updated_at, $id);
    $stmt->execute();
    $stmt->close();
}

// Delete Company
if (isset($_GET['delete'])) {
    $id = (int) $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM companies WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
}

// ======================
// Pagination & Fetch Data
// ======================
$limit = 10;
$page  = isset($_GET['page']) ? (int) $_GET['page'] : 1;
$page  = max($page, 1); // Negative page এড়াতে
$start = ($page - 1) * $limit;

// Total rows count
$total_result = $conn->query("SELECT COUNT(*) AS total FROM companies");
$total_row    = $total_result->fetch_assoc();
$total_pages  = ceil($total_row['total'] / $limit);

// Get paginated results
$stmt = $conn->prepare("
    SELECT * FROM companies 
    ORDER BY id DESC 
    LIMIT ?, ?
");
$stmt->bind_param("ii", $start, $limit);
$stmt->execute();
$result = $stmt->get_result();
$stmt->close();



/* if(!check_permission('user-add')){ 
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
        <li class="breadcrumb-item active">Company Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card">
        <div class="card-header">
            <i class="fas fa-table"></i>
            User Entry
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List</a>
		</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="row">

            <!-- Add Company Form -->
            <div class="col-md-4 col-lg-4">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Add New Company</h3>
                    </div>
                    <div class="box-body">
                        <form method="post">
                <div class="form-group">
                    <input type="text" name="company_name" class="form-control" placeholder="Company Name" required>
                </div>
                <div class="form-group">
                    <textarea name="company_address" class="form-control" placeholder="Company Address" rows="3" required></textarea>
                </div>
                <button type="submit" name="add" class="btn btn-success btn-block">Add Company</button>
            </form>
                    </div>
                </div>
            </div>

            <!-- Companies List -->
            <div class="col-md-8 col-lg-8">
                <div class="box box-primary">
                    <div class="box-header">
                        <button class="btn btn-success linktext"> Company List</button>
                        <button class="btn btn-primary linktext" onclick="window.location.href='divisions.php';"> Division List</button>
                        <button class="btn btn-primary linktext" onclick="window.location.href='departments.php';"> Department List</button>
                        <button class="btn btn-primary linktext" onclick="window.location.href='prolocs.php';"> Project/Location List</button>
                    </div>
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Company Name</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = $result->fetch_assoc()): ?>
                                <tr>
                                    <form method="post">
                                        <td><?= $row['id']; ?></td>
                                        <td><input type="text" name="company_name" class="form-control" value="<?= $row['company_name']; ?>"></td>
                                        <td><textarea name="company_address" class="form-control" rows="2"><?= $row['company_address']; ?></textarea></td>
                                        <td>
                                            <input type="hidden" name="id" value="<?= $row['id']; ?>">
                                            <button type="submit" name="update" class="btn btn-primary btn-sm">Update</button>
                                            <a href="?delete=<?= $row['id']; ?>" onclick="return confirm('Are you sure?')" class="btn btn-danger btn-sm">Delete</a>
                                        </td>
                                    </form>
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>

                        <!-- Pagination -->
                        <nav>
                            <ul class="pagination">
                                <?php for($i = 1; $i <= $total_pages; $i++): ?>
                                    <li class="<?= ($i == $page) ? 'active' : ''; ?>">
                                        <a href="?page=<?= $i; ?>"><?= $i; ?></a>
                                    </li>
                                <?php endfor; ?>
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>

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