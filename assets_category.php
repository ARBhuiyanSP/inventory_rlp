<?php 
include 'header.php';

// Auto Generate assets_id
function generateAssetsId($conn) {
    $result = $conn->query("SELECT assets_id FROM assets_categories ORDER BY id DESC LIMIT 1");
    if ($row = $result->fetch_assoc()) {
        $lastId = $row['assets_id'];
        $num = intval(substr($lastId, 2)); // A-0040 হলে শুধু 40 নিব
        $newId = "A-" . str_pad($num + 1, 4, "0", STR_PAD_LEFT);
    } else {
        $newId = "A-0001";
    }
    return $newId;
}

// Insert
if (isset($_POST['add'])) {
    $assets_id = generateAssetsId($conn);
    $name = $_POST['name'];
    $created_at = date("Y-m-d H:i:s");
    $updated_at = $created_at;

    $stmt = $conn->prepare("INSERT INTO assets_categories (assets_id, assets_category, created_at, updated_at) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("ssss", $assets_id, $name, $created_at, $updated_at);
    $stmt->execute();
    $stmt->close();
}

// Update
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE assets_categories SET assets_category=?, updated_at=? WHERE id=?");
    $stmt->bind_param("ssi", $name, $updated_at, $id);
    $stmt->execute();
    $stmt->close();
}

// Delete
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM assets_categories WHERE id=$id");
}

$result = $conn->query("SELECT * FROM assets_categories ORDER BY id DESC");

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
            <h2>Add Assets Category</h2>
    <form method="post">
        <input type="text" name="name" placeholder="Assets Category Name" required>
        <button type="submit" name="add">Add</button>
    </form>

    <h2>Assets Categories List</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Assets ID</th>
            <th>Name</th>
            <th>Created At</th>
            <th>Updated At</th>
            <th>Action</th>
        </tr>
        <?php while ($row = $result->fetch_assoc()): ?>
        <tr>
            <form method="post">
                <td><?php echo $row['id']; ?></td>
                <td><?php echo $row['assets_id']; ?></td>
                <td>
                    <input type="text" name="name" value="<?php echo $row['assets_category']; ?>">
                </td>
                <td><?php echo $row['created_at']; ?></td>
                <td><?php echo $row['updated_at']; ?></td>
                <td>
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <button type="submit" name="update">Update</button>
                    <a href="?delete=<?php echo $row['id']; ?>" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </form>
        </tr>
        <?php endwhile; ?>
    </table>
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