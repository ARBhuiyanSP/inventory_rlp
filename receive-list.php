<?php 
include 'header.php';
?>
<?php 
/* if(!check_permission('receive-list')){ 
    include("404.php");
    exit();
} */ 
?>

<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Receive List</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Receive List
            <a href="receive_entry.php" style="float:right"><i class="fas fa-plus"></i> Add Receive</a>
        </div>
        <div class="card-body">

<?php
// ================= Pagination + Search =================
$limit = 12;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page-1)*$limit;

$search = $_GET['search'] ?? '';
$where = "WHERE 1";  // default

if ($search !== '') {
    $safe = $conn->real_escape_string($search);
    $where .= " AND (
        r.mrr_no LIKE '%$safe%' OR 
        r.remarks LIKE '%$safe%' OR 
        v.vendor_name LIKE '%$safe%' OR 
        r.receive_type LIKE '%$safe%' OR
        r.wo_no LIKE '%$safe%' OR
        r.ns_no LIKE '%$safe%'
    )";
}

// Count total
$total_sql = "SELECT COUNT(*) AS total
              FROM inv_receive r
              LEFT JOIN vendors v ON r.supplier_id = v.vendor_id
              $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];
$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch paginated rows
$list_sql = "SELECT r.*, v.vendor_name, v.address, v.phone
             FROM inv_receive r
             LEFT JOIN vendors v ON r.supplier_id = v.vendor_id
             $where
             ORDER BY r.id DESC
             LIMIT $start, $limit";
$receives = $conn->query($list_sql);
?>

<!-- Total Count -->
<p><strong>Total Receives:</strong> <?= $total ?></p>

<!-- Search Form -->
<form method="GET" class="form-inline mb-3">
    <input type="text" name="search" class="form-control mr-2"
           placeholder="Search by MRR, Vendor, Remarks, WO, NS"
           value="<?= htmlspecialchars($search) ?>">
    <button type="submit" class="btn btn-primary">Search</button>
    <?php if($search!==''): ?><a href="?page=1" class="btn btn-default ml-2">Reset</a><?php endif; ?>
</form>

<!-- Receive Table -->
<table class="table table-bordered table-striped">
    <tr>
        <th>ID</th>
        <th>MRR No</th>
        <th>MRR Date</th>
        <th>Vendor</th>
        <th>Receive Type</th>
        <th>Total Amount</th>
        <th>No of Material</th>
        <th>Remarks</th>
        <th>Action</th>
    </tr>
    <?php if($receives && $receives->num_rows>0): while($row=$receives->fetch_assoc()): ?>
    <tr>
        <td><?= $row['id'] ?></td>
        <td><?= htmlspecialchars($row['mrr_no']) ?></td>
        <td><?= htmlspecialchars($row['mrr_date']) ?></td>
        <td><?= htmlspecialchars($row['vendor_name']) ?></td>
        <td><?= htmlspecialchars($row['receive_type']) ?></td>
        <td><?= htmlspecialchars($row['receive_total']) ?></td>
        <td><?= htmlspecialchars($row['no_of_material']) ?></td>
        <td><?= htmlspecialchars($row['remarks']) ?></td>
        <td>
            <a href="receive-view.php?no=<?= $row['mrr_no'] ?>" class="btn btn-sm btn-success">View</a>
            <a href="receive_edit.php?edit_id=<?= $row['id'] ?>" class="btn btn-sm btn-info">Edit</a>
        </td>
    </tr>
    <?php endwhile; else: ?>
    <tr><td colspan="9" class="text-center">No records found</td></tr>
    <?php endif; ?>
</table>

<!-- Pagination -->
<nav>
    <ul class="pagination">
    <?php
    $adj=2; $prev=$page-1; $next=$page+1;
    $q=($search!==''?'&search='.urlencode($search):'');
    echo ($page>1)?'<li class="page-item"><a class="page-link" href="?page='.$prev.$q.'">&laquo; Prev</a></li>':'<li class="page-item disabled"><span class="page-link">&laquo; Prev</span></li>';
    if($page>$adj+1){echo '<li class="page-item"><a class="page-link" href="?page=1'.$q.'">1</a></li>'; if($page>$adj+2) echo '<li class="page-item disabled"><span class="page-link">...</span></li>';}
    for($i=max(1,$page-$adj);$i<=min($total_pages,$page+$adj);$i++){
        echo ($i==$page)?'<li class="page-item active"><span class="page-link">'.$i.'</span></li>':'<li class="page-item"><a class="page-link" href="?page='.$i.$q.'">'.$i.'</a></li>';
    }
    if($page<$total_pages-$adj){ if($page<$total_pages-$adj-1) echo '<li class="page-item disabled"><span class="page-link">...</span></li>'; echo '<li class="page-item"><a class="page-link" href="?page='.$total_pages.$q.'">'.$total_pages.'</a></li>'; }
    echo ($page<$total_pages)?'<li class="page-item"><a class="page-link" href="?page='.$next.$q.'">Next &raquo;</a></li>':'<li class="page-item disabled"><span class="page-link">Next &raquo;</span></li>';
    ?>
    </ul>
</nav>

        </div>
    </div>
</div>

<?php include 'footer.php' ?>
