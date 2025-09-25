<?php 
include 'header.php';

// Pagination setup
$limit = 10;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$offset = ($page - 1) * $limit;

// Search filter
$search = isset($_GET['search']) ? trim($_GET['search']) : "";

// Prepare WHERE clause for search
$where = " WHERE 1=1 ";
$params = [];
$param_types = "";

if (!empty($search)) {
    $where .= " AND (
        p.item_name LIKE ? OR
        p.model LIKE ? OR
        p.brand LIKE ? OR
        p.item_code LIKE ? OR
        e.name LIKE ? OR
        e.employeeid LIKE ? 
    )";
    $search_param = "%$search%";
    $params = array_fill(0, 6, $search_param);
    $param_types = str_repeat("s", 6);
}

// Optimized COUNT query (only necessary joins)
$count_sql = "SELECT COUNT(*) as total 
              FROM product_assign pa 
              LEFT JOIN inv_employee e ON pa.employee_id = e.employeeid
              LEFT JOIN ams_products p ON pa.product_id = p.id
              $where";

$stmt = $conn->prepare($count_sql);
if (!empty($search)) {
    $stmt->bind_param($param_types, ...$params);
}
$stmt->execute();
$count_result = $stmt->get_result()->fetch_assoc();
$total_rows = $count_result['total'];
$total_pages = ceil($total_rows / $limit);

// Final SELECT query
$select_sql = "SELECT pa.id as assign_id, pa.assign_date, pa.refund_date, pa.status as assign_status,
                      p.item_name, p.model, p.brand, p.item_code,
                      e.name as employee_name, e.employeeid as emp_id,
                      ab.name as assigned_by_name
               FROM product_assign pa
               LEFT JOIN ams_products p ON pa.product_id = p.id
               LEFT JOIN inv_employee e ON pa.employee_id = e.employeeid
               LEFT JOIN inv_employee ab ON pa.assigned_by = ab.employeeid
               $where
               ORDER BY pa.id DESC
               LIMIT ? OFFSET ?";

$stmt = $conn->prepare($select_sql);

if (!empty($search)) {
    $param_types .= "ii";
    $params[] = $limit;
    $params[] = $offset;
    $stmt->bind_param($param_types, ...$params);
} else {
    $stmt->bind_param("ii", $limit, $offset);
}

$stmt->execute();
$result = $stmt->get_result();
?>

<div class="container-fluid">
    <!-- Breadcrumbs -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Assign List</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Product Assign List
        </div>
        <div class="card-body">
            <!-- Search Filter -->
            <form method="GET" action="assign-list.php" class="form-inline mb-3">
                <input type="text" name="search" value="<?= htmlspecialchars($_GET['search'] ?? '') ?>" class="form-control mr-2" placeholder="Search by item, model, brand, employee name or ID...">
                <button type="submit" class="btn btn-primary mr-2">Search</button>
                <a href="assign-list.php" class="btn btn-secondary">Reset</a>
            </form>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item</th>
                            <th>Model</th>
                            <th>Brand</th>
                            <th>Employee</th>
                            <th>Assign Date</th>
                            <th>Refund Date</th>
                            <th>Assigned By</th>
                            <th>Status</th>
                            <th width="80">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($result->num_rows > 0): 
                            $i = $offset + 1;
                            while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td><?= $i++; ?></td>
                                <td><?= htmlspecialchars($row['item_name']); ?></td>
                                <td><?= htmlspecialchars($row['model']); ?></td>
                                <td><?= htmlspecialchars($row['brand']); ?></td>
                                <td><?= htmlspecialchars($row['employee_name']); ?> (<?= $row['emp_id']; ?>)</td>
                                <td><?= htmlspecialchars($row['assign_date']); ?></td>
                                <td><?= htmlspecialchars($row['refund_date']); ?></td>
                                <td><?= htmlspecialchars($row['assigned_by_name']); ?></td>
                                <td><?= htmlspecialchars($row['assign_status']); ?></td>
                                <td>
                                    <a href="handover-receipt.php?id=<?= $row['assign_id']; ?>" class="btn btn-info btn-sm">
                                        Handover Receipt
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; else: ?>
                            <tr><td colspan="10" class="text-center">No records found</td></tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>

            <!-- Short Pagination -->
            <nav>
                <ul class="pagination">
                    <li class="page-item <?= ($page <= 1) ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page-1; ?>&search=<?= urlencode($_GET['search'] ?? ''); ?>">« Prev</a>
                    </li>

                    <?php 
                    $range = 2;
                    $start = max(1, $page - $range);
                    $end = min($total_pages, $page + $range);

                    if ($start > 1) {
                        echo '<li class="page-item"><a class="page-link" href="?page=1&search='.urlencode($_GET['search'] ?? '').'">1</a></li>';
                        if ($start > 2) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                    }

                    for ($p = $start; $p <= $end; $p++): ?>
                        <li class="page-item <?= ($page == $p) ? 'active' : '' ?>">
                            <a class="page-link" href="?page=<?= $p; ?>&search=<?= urlencode($_GET['search'] ?? ''); ?>"><?= $p; ?></a>
                        </li>
                    <?php endfor;

                    if ($end < $total_pages) {
                        if ($end < $total_pages - 1) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';
                        echo '<li class="page-item"><a class="page-link" href="?page='.$total_pages.'&search='.urlencode($_GET['search'] ?? '').'">'.$total_pages.'</a></li>';
                    }
                    ?>

                    <li class="page-item <?= ($page >= $total_pages) ? 'disabled' : '' ?>">
                        <a class="page-link" href="?page=<?= $page+1; ?>&search=<?= urlencode($_GET['search'] ?? ''); ?>">Next »</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
