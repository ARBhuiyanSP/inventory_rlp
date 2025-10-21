<?php 
include 'header.php';

// ================= ADD =================
if (isset($_POST['add'])) {
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];
    $show_order = $_POST['show_order'];

    $stmt = $conn->prepare("INSERT INTO roles (name, short_name, show_order) VALUES (?, ?, ?)");
    $stmt->bind_param("ssi", $name, $short_name, $show_order);
    $stmt->execute();
}

// ================= UPDATE =================
if (isset($_POST['update'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $short_name = $_POST['short_name'];
    $show_order = $_POST['show_order'];

    $stmt = $conn->prepare("UPDATE roles SET name=?, short_name=?, show_order=? WHERE id=?");
    $stmt->bind_param("ssii", $name, $short_name, $show_order, $id);
    $stmt->execute();
}

// ================= DELETE =================
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM roles WHERE id=?");
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
    $where = "WHERE name LIKE '%$safe%' OR short_name LIKE '%$safe%'";
}

// Total rows
$total_sql = "SELECT COUNT(*) AS total FROM roles $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];

$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch roles
$list_sql = "SELECT * FROM roles $where ORDER BY show_order ASC, id DESC LIMIT $start, $limit";
$roles = $conn->query($list_sql);
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Roles</li>
    </ol>

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
            <!-- Add/Edit Form -->
            <div class="col-md-3">
                <form method="post" id="roleForm">
                    <input type="hidden" name="id" id="role_id_hidden">

                    <div class="form-group">
                        <label>Role Name</label>
                        <input type="text" name="name" id="name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Short Name</label>
                        <input type="text" name="short_name" id="short_name" class="form-control" required>
                    </div>
                    
                    <input type="hidden" name="show_order" id="show_order" class="form-control" value="0">
                    

                    <button type="submit" name="add" id="addBtn" class="btn btn-success">Add Role</button>
                    <button type="submit" name="update" id="updateBtn" class="btn btn-primary" style="display:none;">Update Role</button>
                    <button type="button" id="cancelEdit" class="btn btn-secondary" style="display:none;">Cancel</button>
                </form>
            </div>

            <!-- Roles Table -->
            <div class="col-md-9">

                <!-- Search bar -->
                <form method="GET" class="form-inline mb-2">
                    <input type="text" name="search" class="form-control mr-2" style="min-width:280px" placeholder="Search by name, short name" value="<?= htmlspecialchars($search) ?>">
                    <button type="submit" class="btn btn-primary">Search</button>
                    <?php if($search!==''): ?>
                        <a href="?page=1" class="btn btn-secondary">Reset</a>
                    <?php endif; ?>
					<strong style="padding-left:10px;">Total Roles: <?= $total ?></strong>
                </form>

                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Short Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($roles && $roles->num_rows>0): ?>
                            <?php while($row=$roles->fetch_assoc()): ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['name']) ?></td>
                                    <td><?= htmlspecialchars($row['short_name']) ?></td>
                                    <td>
                                        <button class="btn btn-info btn-sm editBtn"
                                            data-id="<?= $row['id'] ?>"
                                            data-name="<?= htmlspecialchars($row['name']) ?>"
                                            data-short_name="<?= htmlspecialchars($row['short_name']) ?>"
                                            data-show_order="<?= (int)$row['show_order'] ?>">Edit</button>
                                        <a href="?delete=<?= $row['id'] ?><?= $search!=='' ? '&search='.urlencode($search) : '' ?>" class="btn btn-danger btn-sm" onclick="return confirm('Delete this role?')">Delete</a>
										
										<a href="role-edit.php?id=<?= $row['id'] ?>" class="btn btn-success btn-sm">Assign Permissions</a>
                                    </td>
                                </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr><td colspan="4" class="text-center">No roles found</td></tr>
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
        $('#role_id_hidden').val($(this).data('id'));
        $('#name').val($(this).data('name'));
        $('#short_name').val($(this).data('short_name'));
        $('#show_order').val($(this).data('show_order'));
        $('#addBtn').hide();
        $('#updateBtn, #cancelEdit').show();
    });

    $('#cancelEdit').click(function(){
        $('#roleForm')[0].reset();
        $('#role_id_hidden').val('');
        $('#addBtn').show();
        $('#updateBtn, #cancelEdit').hide();
    });
});
</script>

<?php include 'footer.php'; ?>
