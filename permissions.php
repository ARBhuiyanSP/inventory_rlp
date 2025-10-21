<?php 
include 'header.php';

// ================= ADD =================
if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $display_name = $_POST['display_name'];
    $permission_category = $_POST['permission_category'];
    $sort = $_POST['sort'];
    $status = $_POST['status'];
    $created_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("INSERT INTO permissions (name, display_name, permission_category, sort, status, created_at) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssiss", $name, $display_name, $permission_category, $sort, $status, $created_at);
    $stmt->execute();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $display_name = $_POST['display_name'];
    $permission_category = $_POST['permission_category'];
    $sort = $_POST['sort'];
    $status = $_POST['status'];
    $updated_at = date("Y-m-d H:i:s");

    $stmt = $conn->prepare("UPDATE permissions SET name=?, display_name=?, permission_category=?, sort=?, status=?, updated_at=? WHERE id=?");
    $stmt->bind_param("sssissi", $name, $display_name, $permission_category, $sort, $status, $updated_at, $id);
    $stmt->execute();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM permissions WHERE id=?");
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
    $where = "WHERE name LIKE '%$safe%' OR display_name LIKE '%$safe%' OR permission_category LIKE '%$safe%'";
}

// Total rows
$total_sql = "SELECT COUNT(*) AS total FROM permissions $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];

$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch permissions
$list_sql = "SELECT * FROM permissions $where ORDER BY id DESC LIMIT $start, $limit";
$permissions = $conn->query($list_sql);
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Permissions</li>
    </ol>

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
            <!-- Add/Edit Form -->
            <div class="col-md-3">
                <form method="post" id="permissionForm">
                    <input type="hidden" name="id" id="perm_id_hidden">

                    <div class="form-group">
                        <label>Name/URL</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Display Name</label>
                        <input type="text" name="display_name" id="display_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <input type="text" name="permission_category" id="permission_category" class="form-control" required>
                    </div>
                    
                        <input type="hidden" name="sort" id="sort" class="form-control" value="0">
                    
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" id="status" class="form-control" required>
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>

                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Permission</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Permission</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>

            <!-- Permissions Table -->
            <div class="col-md-9">
                

                <!-- Search bar -->
                <form method="GET" class="form-inline mb-2">
                    <input type="text" name="search" class="form-control mr-2" style="min-width:280px" placeholder="Search by name, display, category" value="<?= htmlspecialchars($search) ?>">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <?php if($search!==''): ?>
                        <a href="?page=1" class="btn btn-secondary">Reset</a>
                    <?php endif; ?>
				<strong style="padding-left:10px;"> Total Permissions Found: <?= $total ?></strong>
                </form>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name/URL</th>
                            <th>Display Name</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($permissions && $permissions->num_rows>0): ?>
                            <?php while($row=$permissions->fetch_assoc()): ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['name']) ?></td>
                                    <td><?= htmlspecialchars($row['display_name']) ?></td>
                                    <td><?= htmlspecialchars($row['permission_category']) ?></td>
                                    <td><?= (int)$row['sort'] ?></td>
                                    <td><?= $row['status'] ? "Active" : "Inactive" ?></td>
                                    <td>
                                        <button class="btn btn-info btn-sm editBtn"
                                            data-id="<?= $row['id'] ?>"
                                            data-name="<?= htmlspecialchars($row['name']) ?>"
                                            data-display_name="<?= htmlspecialchars($row['display_name']) ?>"
                                            data-permission_category="<?= htmlspecialchars($row['permission_category']) ?>"
                                            data-sort="<?= (int)$row['sort'] ?>"
                                            data-status="<?= $row['status'] ?>">Edit</button>
                                        <a href="?delete=<?= $row['id'] ?><?= $search!=='' ? '&search='.urlencode($search) : '' ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this permission?')">Delete</a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr><td colspan="6" class="text-center">No permissions found</td></tr>
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
        $('#perm_id_hidden').val($(this).data('id'));
        $('#name').val($(this).data('name'));
        $('#display_name').val($(this).data('display_name'));
        $('#permission_category').val($(this).data('permission_category'));
        $('#sort').val($(this).data('sort'));
        $('#status').val($(this).data('status'));
        $('#addBtn').hide();
        $('#updateBtn, #cancelEdit').show();
    });

    $('#cancelEdit').click(function(){
        $('#permissionForm')[0].reset();
        $('#perm_id_hidden').val('');
        $('#addBtn').show();
        $('#updateBtn, #cancelEdit').hide();
    });
});
</script>

<?php include 'footer.php'; ?>
