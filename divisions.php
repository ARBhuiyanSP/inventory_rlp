<?php 
include 'header.php';

// Add new branch
if (isset($_POST['add'])) {
    $company_id = $_POST['company_id'];
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];
    $division_address = $_POST['division_address'];
    $created_at = date("Y-m-d H:i:s");
    $updated_at = $created_at;

    $stmt = $conn->prepare("INSERT INTO branch (company_id, name, short_name, division_address, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("isssss", $company_id, $name, $short_name, $division_address, $created_at, $updated_at);
    $stmt->execute();
    $stmt->close();
}

// Update branch
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $company_id = $_POST['company_id'];
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];
    $division_address = $_POST['division_address'];
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE branch SET company_id=?, name=?, short_name=?, division_address=?, updated_at=? WHERE id=?");
    $stmt->bind_param("issssi", $company_id, $name, $short_name, $division_address, $updated_at, $id);
    $stmt->execute();
    $stmt->close();
}

// Delete branch
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM branch WHERE id=$id");
}

// Pagination
$limit = 10;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$start = ($page - 1) * $limit;

$total_result = $conn->query("SELECT COUNT(*) AS total FROM branch");
$total_row = $total_result->fetch_assoc();
$total_pages = ceil($total_row['total'] / $limit);

$result = $conn->query("SELECT b.*, c.company_name FROM branch b LEFT JOIN companies c ON b.company_id=c.id ORDER BY b.id DESC LIMIT $start, $limit");

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

            <!-- Add Branch Form -->
            <div class="col-md-3">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Add New Division</h3>
                    </div>
                    <div class="box-body">
                        <form method="post">
                            <div class="form-group">
                                <label>Company</label>
                                <select name="company_id" class="form-control" required>
                                    <option value="">Select Company</option>
                                    <?php
                                    $companies = $conn->query("SELECT id, company_name FROM companies ORDER BY company_name ASC");
                                    while($comp = $companies->fetch_assoc()) {
                                        echo "<option value='{$comp['id']}'>{$comp['company_name']}</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Division Name" required>
                            </div>
                            <div class="form-group">
                                <input type="text" name="short_name" class="form-control" placeholder="Short Name" required>
                            </div>
                            <div class="form-group">
                                <textarea name="division_address" class="form-control" placeholder="Division Address" rows="3" required></textarea>
                            </div>
                            <button type="submit" name="add" class="btn btn-success btn-block">Add Division</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Branch List -->
            <div class="col-md-9">
                <div class="box box-primary">
                    <div class="box-header">
                        <button class="btn btn-primary linktext" onclick="window.location.href='companies.php';"> Company List</button>
                        <button class="btn btn-success linktext"> Division List</button>
                        <button class="btn btn-primary linktext" onclick="window.location.href='departments.php';"> Department List</button>
                        <button class="btn btn-primary linktext" onclick="window.location.href='prolocs.php';"> Project/Location List</button>
                    </div>
                    <div class="box-body table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Company</th>
                                    <th>Division Name</th>
                                    <th>Short Name</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php while ($row = $result->fetch_assoc()): ?>
                                <tr>
                                    <form method="post">
                                        <td><?= $row['id']; ?></td>
                                        <td>
                                            <select name="company_id" class="form-control" required>
                                                <?php
                                                $companies = $conn->query("SELECT id, company_name FROM companies ORDER BY company_name ASC");
                                                while($comp = $companies->fetch_assoc()) {
                                                    $selected = ($row['company_id'] == $comp['id']) ? 'selected' : '';
                                                    echo "<option value='{$comp['id']}' {$selected}>{$comp['company_name']}</option>";
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <td><input type="text" name="name" class="form-control" value="<?= $row['name']; ?>"></td>
                                        <td><input type="text" name="short_name" class="form-control" value="<?= $row['short_name']; ?>"></td>
                                        <td><textarea name="division_address" class="form-control" rows="2"><?= $row['division_address']; ?></textarea></td>
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