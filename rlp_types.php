<?php 
include 'header.php';

// ======================
// RLP Type CRUD Operations
// ======================

// Add RLP Type
if (isset($_POST['add'])) {
    $name       = trim($_POST['rlp_name']);
    $status     = trim($_POST['status']);
    $timestamp  = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("
        INSERT INTO rlp_types (name, status) 
        VALUES (?, ?)
    ");
    $stmt->bind_param("ss", $name, $status);
    $stmt->execute();
    $stmt->close();
}

// Update RLP Type
if (isset($_POST['update'])) {
    $id     = (int) $_POST['id'];
    $name   = trim($_POST['rlp_name']);
    $status = trim($_POST['status']);

    $stmt = $conn->prepare("
        UPDATE rlp_types 
        SET name = ?, status = ? 
        WHERE id = ?
    ");
    $stmt->bind_param("ssi", $name, $status, $id);
    $stmt->execute();
    $stmt->close();
}

// Delete RLP Type
if (isset($_GET['delete'])) {
    $id = (int) $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM rlp_types WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $stmt->close();
}

// ======================
// Pagination & Fetch Data
// ======================
$limit = 10;
$page  = isset($_GET['page']) ? (int) $_GET['page'] : 1;
$page  = max($page, 1); 
$start = ($page - 1) * $limit;

// Total rows count
$total_result = $conn->query("SELECT COUNT(*) AS total FROM rlp_types");
$total_row    = $total_result->fetch_assoc();
$total_pages  = ceil($total_row['total'] / $limit);

// Get paginated results
$stmt = $conn->prepare("
    SELECT * FROM rlp_types 
    ORDER BY id DESC 
    LIMIT ?, ?
");
$stmt->bind_param("ii", $start, $limit);
$stmt->execute();
$result = $stmt->get_result();
$stmt->close();

?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">RLP Types</li>
    </ol>

    <div class="card">
        <div class="card-header">
            <i class="fas fa-table"></i>
            RLP Types Entry
        </div>
        <div class="card-body">
            <div class="row">

            <!-- Add RLP Type Form -->
            <div class="col-md-4 col-lg-4">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Add New RLP Type</h3>
                    </div>
                    <div class="box-body">
                        <form method="post">
                            <div class="form-group">
                                <input type="text" name="rlp_name" class="form-control" placeholder="RLP Type Name" required>
                            </div>
                            <div class="form-group">
                                <select name="status" class="form-control" required>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <button type="submit" name="add" class="btn btn-success btn-block">Add RLP Type</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- RLP Types List -->
            <div class="col-md-8 col-lg-8">
                <div class="box box-primary">
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>RLP Type Name</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = $result->fetch_assoc()): ?>
                                <tr>
                                    <form method="post">
                                        <td><?= $row['id']; ?></td>
                                        <td><input type="text" name="rlp_name" class="form-control" value="<?= $row['name']; ?>"></td>
                                        <td>
                                            <select name="status" class="form-control">
                                                <option value="Active" <?= ($row['status']=="Active"?"selected":""); ?>>Active</option>
                                                <option value="Inactive" <?= ($row['status']=="Inactive"?"selected":""); ?>>Inactive</option>
                                            </select>
                                        </td>
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
        </div>
    </div>
</div>

<?php include 'footer.php' ?>
