<?php 
include 'header.php';

/* if(!check_permission('unit-list')){ 
    include("404.php");
    exit();
} */

// ================= ADD =================
if (isset($_POST['add'])) {
    $vendor_name = $_POST['vendor_name'];
    $address = $_POST['address'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $web = $_POST['web'];
    $status = $_POST['status'];
    $created_at = date("Y-m-d H:i:s");

    $temp_vendor_id = 'TEMP';
    $stmt = $conn->prepare("INSERT INTO vendors (vendor_id, vendor_name, address, email, phone, web, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssis", $temp_vendor_id, $vendor_name, $address, $email, $phone, $web, $status, $created_at);
    $stmt->execute();

    $last_id = $conn->insert_id;
    $vendor_id = 'V-' . str_pad($last_id, 3, '0', STR_PAD_LEFT);

    $stmt2 = $conn->prepare("UPDATE vendors SET vendor_id=? WHERE id=?");
    $stmt2->bind_param("si", $vendor_id, $last_id);
    $stmt2->execute();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $vendor_name = $_POST['vendor_name'];
    $address = $_POST['address'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $web = $_POST['web'];
    $status = $_POST['status'];
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE vendors SET vendor_name=?, address=?, email=?, phone=?, web=?, status=?, updated_at=? WHERE id=?");
    $stmt->bind_param("sssssssi", $vendor_name, $address, $email, $phone, $web, $status, $updated_at, $id);
    $stmt->execute();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM vendors WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
}

// ================= Pagination + Search =================
$limit = 12;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page-1)*$limit;

$search = isset($_GET['search']) ? trim($_GET['search']) : '';
$where = "";
if ($search !== '') {
    $safe = $conn->real_escape_string($search);
    $where = "WHERE vendor_id LIKE '%$safe%' OR vendor_name LIKE '%$safe%' OR address LIKE '%$safe%' OR email LIKE '%$safe%' OR phone LIKE '%$safe%' OR web LIKE '%$safe%' OR status LIKE '%$safe%'";
}

// Total rows
$total_sql = "SELECT COUNT(*) AS total FROM vendors $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total']; // <-- Total vendor count

$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch vendors (paginated + filtered)
$list_sql = "SELECT * FROM vendors $where ORDER BY id DESC LIMIT $start, $limit";
$vendors = $conn->query($list_sql);
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Vendor Entry</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Vendor Entry Form
        </div>
        <div class="card-body">
            <div class="row">
            <!-- Add/Edit Form -->
            <div class="col-md-3">
                <form method="post" id="vendorForm">
                    <input type="hidden" name="id" id="vendor_id_hidden">
                    <div class="form-group">
                        <label>Vendor Name</label>
                        <input type="text" name="vendor_name" id="vendor_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <textarea name="address" id="address" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="email" name="email" id="email" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" id="phone" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Website</label>
                        <input type="text" name="web" id="web" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>
                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Vendor</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Vendor</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>

            <!-- Vendors Table -->
            <div class="col-md-9">
                <div class="mb-2"><strong>Total Vendors: <?= $total ?></strong></div> <!-- Total vendor count -->
                
                <!-- Search bar -->
                <form method="GET" class="form-inline mb-2">
                    <input type="text" name="search" class="form-control mr-2" style="min-width:280px" placeholder="Search by ID, name, address, email, phone, web, status" value="<?= htmlspecialchars($search) ?>">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <?php if($search!==''): ?>
                        <a href="?page=1" class="btn btn-secondary">Reset</a>
                    <?php endif; ?>
                </form>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($vendors && $vendors->num_rows>0): ?>
                            <?php while($row=$vendors->fetch_assoc()): ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['vendor_name']) ?></td>
                                    <td><?= htmlspecialchars($row['address']) ?></td>
                                    <td><?= htmlspecialchars($row['email']) ?></td>
                                    <td><?= htmlspecialchars($row['phone']) ?></td>
                                    <td>
                                        <button class="btn btn-info btn-sm editBtn"
                                            data-id="<?= $row['id'] ?>"
                                            data-vendor_name="<?= htmlspecialchars($row['vendor_name']) ?>"
                                            data-address="<?= htmlspecialchars($row['address']) ?>"
                                            data-email="<?= htmlspecialchars($row['email']) ?>"
                                            data-phone="<?= htmlspecialchars($row['phone']) ?>"
                                            data-web="<?= htmlspecialchars($row['web']) ?>"
                                            data-status="<?= $row['status'] ?>">Edit</button>
                                        <a href="?delete=<?= $row['id'] ?><?= $search!=='' ? '&search='.urlencode($search) : '' ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this vendor?')">Delete</a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr><td colspan="6" class="text-center">No vendors found</td></tr>
                        <?php endif; ?>
                    </tbody>
                </table>

                <!-- Pagination -->
                <nav>
                    <ul class="pagination">
                        <?php
                        $adjacents = 2;
                        $prev = $page - 1;
                        $next = $page + 1;
                        $q = ($search!=='' ? '&search='.urlencode($search) : '');

                        echo ($page>1)? '<li class="page-item"><a class="page-link" href="?page='.$prev.$q.'">&laquo; Prev</a></li>' : '<li class="page-item disabled"><span class="page-link">&laquo; Prev</span></li>';

                        if($page>$adjacents+1){
                            echo '<li class="page-item"><a class="page-link" href="?page=1'.$q.'">1</a></li>';
                            if($page>$adjacents+2) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                        }

                        for($i=max(1,$page-$adjacents);$i<=min($total_pages,$page+$adjacents);$i++){
                            echo ($i==$page)? '<li class="active"><span class="page-link">'.$i.'</span></li>' : '<li class="page-item"><a class="page-link" href="?page='.$i.$q.'">'.$i.'</a></li>';
                        }

                        if($page<$total_pages-$adjacents){
                            if($page<$total_pages-$adjacents-1) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                            echo '<li class="page-item"><a class="page-link" href="?page='.$total_pages.$q.'">'.$total_pages.'</a></li>';
                        }

                        echo ($page<$total_pages)? '<li class="page-item"><a class="page-link" href="?page='.$next.$q.'">Next &raquo;</a></li>' : '<li class="page-item disabled"><span class="page-link">Next &raquo;</span></li>';
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
    $('.editBtn').click(function(){
        $('#vendor_id_hidden').val($(this).data('id'));
        $('#vendor_name').val($(this).data('vendor_name'));
        $('#address').val($(this).data('address'));
        $('#email').val($(this).data('email'));
        $('#phone').val($(this).data('phone'));
        $('#web').val($(this).data('web'));
        $('#status').val($(this).data('status'));
        $('#addBtn').hide();
        $('#updateBtn, #cancelEdit').show();
    });

    $('#cancelEdit').click(function(){
        $('#vendorForm')[0].reset();
        $('#vendor_id_hidden').val('');
        $('#addBtn').show();
        $('#updateBtn, #cancelEdit').hide();
    });
});
</script>

<?php include 'footer.php'; ?>
