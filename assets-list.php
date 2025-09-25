<?php 
include 'header.php';
$store_id = $_SESSION['logged']['store_id'];

/* if (!check_permission('material-receive-add')) { 
    include("404.php");
    exit();
} */ 

// ================= Pagination + Search =================
$limit = 12;
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$start = ($page-1)*$limit;

$search = $_GET['search'] ?? '';

if($store_id==1){
	$where = "";
}else{
	$where = "WHERE p.current_store = '$store_id'";  // always enforce store filter
}


//$where = "";
if ($search !== '') {
    $safe = $conn->real_escape_string($search);
    $where = "WHERE p.item_name LIKE '%$safe%'
              OR p.assets_description LIKE '%$safe%'
              OR c.company_name LIKE '%$safe%'
              OR b.name LIKE '%$safe%'
              OR d.name LIKE '%$safe%'
              OR ac.assets_category LIKE '%$safe%'
              OR pr.project_name LIKE '%$safe%'
              OR p.brand LIKE '%$safe%'
              OR p.model LIKE '%$safe%'";
}

// Count total
$total_sql = "SELECT COUNT(*) AS total
              FROM ams_products p
              LEFT JOIN companies c ON p.company_id=c.id
              LEFT JOIN branch b ON p.division_id=b.id
              LEFT JOIN department d ON p.department_id=d.id
              LEFT JOIN projects pr ON p.proloc_id=pr.id
              LEFT JOIN assets_categories ac ON p.assets_category=ac.assets_id
              $where";
$total_result = $conn->query($total_sql);
$total_row = $total_result->fetch_assoc();
$total = (int)$total_row['total'];
$total_pages = max(1, ceil($total/$limit));
if ($page > $total_pages) $page = $total_pages;

// Fetch paginated rows
$list_sql = "SELECT p.*, c.company_name, b.name AS branch_name, d.name AS department_name, pr.project_name, ac.assets_category AS assets_cat_name
             FROM ams_products p
             LEFT JOIN companies c ON p.company_id=c.id
             LEFT JOIN branch b ON p.division_id=b.id
             LEFT JOIN department d ON p.department_id=d.id
             LEFT JOIN projects pr ON p.proloc_id=pr.id
             LEFT JOIN assets_categories ac ON p.assets_category=ac.assets_id
             $where
             ORDER BY p.id DESC
             LIMIT $start, $limit";
$assets = $conn->query($list_sql);
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Assets List</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-table"></i> Assets List</div>
        <div class="card-body">

            <!-- Search -->
            <form method="GET" class="form-inline" style="margin-bottom:10px;">
                <input type="text" name="search" class="form-control" style="min-width:280px"
                       placeholder="Search by item, company, division, dept, category, project, brand, model"
                       value="<?= htmlspecialchars($search) ?>">
                <button type="submit" class="btn btn-primary">Search</button>
                <?php if($search!==''): ?><a href="?page=1" class="btn btn-default">Reset</a><?php endif; ?>
            </form>
<p><strong>Total Assets:</strong> <?= $total ?></p>
            <!-- Table -->
            <table class="table table-bordered table-striped">
                <tr>
                    <th>ID</th>
                    <th>Item</th>
                    <th>Category</th>
                    <th>Company</th>
                    <th>Division</th>
                    <th>Department</th>
                    <th>Project</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Action</th>
                </tr>
                <?php if($assets && $assets->num_rows>0): while($row=$assets->fetch_assoc()): ?>
                    <tr>
                        <td><?= $row['sl_no']?></td>
                        <td><?= htmlspecialchars($row['item_name'])?></td>
                        <td><?= htmlspecialchars($row['assets_cat_name'])?></td>
                        <td><?= htmlspecialchars($row['company_name'])?></td>
                        <td><?= htmlspecialchars($row['branch_name'])?></td>
                        <td><?= htmlspecialchars($row['department_name'])?></td>
                        <td><?= htmlspecialchars($row['project_name'])?></td>
                        <td><?= htmlspecialchars($row['brand'])?></td>
                        <td><?= htmlspecialchars($row['model'])?></td>
						<td>
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-delete" href="assets_edit.php?id=<?php echo $row['id']; ?>" title="edit"><i class="fa fa-edit text-info mborder"></i></a></span>

						
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-approve" href="asset-details.php?id=<?php echo $row['id']; ?>" title="View"><i class="fa fa-eye text-success mborder"></i></a></span>
							
							
							<?php  if($row['assign_status']=='assigned'){ ?>
							
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-delete" href="transfer.php?id=<?php echo $row['id']; ?>" title="transfer"><i class="fa fa-user text-warning mborder"></i></a></span>
							
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-delete" href="refund.php?id=<?php echo $row['id']; ?>" title="refund"><i class="fa fa-user text-info mborder"></i></a></span>
							
							<?php } else { ?>
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-delete" href="assign.php?id=<?php echo $row['id']; ?>" title="assign"><i class="fa fa-user-plus text-success mborder"></i></a></span>
							
							<span style="background-color:#fff;border-radius:5px;padding:1px;margin:1px;"><a class="action-icons c-delete" href="s2s_transfer.php?id=<?php echo $row['id']; ?>" title="s2s transfer"><i class="fas fa-fw fa-server text-danger mborder"></i></a></span>
							<?php } ?>
						</td>
                    </tr>
                <?php endwhile; else: ?>
                    <tr><td colspan="9" class="text-center">No assets found</td></tr>
                <?php endif; ?>
            </table>

            <!-- Pagination -->
            <nav><ul class="pagination">
                <?php
                $adj=2; $prev=$page-1; $next=$page+1;
                $q=($search!==''?'&search='.urlencode($search):'');
                echo ($page>1)?'<li><a href="?page='.$prev.$q.'">&laquo; Prev</a></li>':'<li class="disabled"><span>&laquo; Prev</span></li>';
                if($page>$adj+1){echo '<li><a href="?page=1'.$q.'">1</a></li>'; if($page>$adj+2) echo '<li class="disabled"><span>...</span></li>';}
                for($i=max(1,$page-$adj);$i<=min($total_pages,$page+$adj);$i++){
                    echo ($i==$page)?'<li class="active"><span>'.$i.'</span></li>':'<li><a href="?page='.$i.$q.'">'.$i.'</a></li>';
                }
                if($page<$total_pages-$adj){ if($page<$total_pages-$adj-1) echo '<li class="disabled"><span>...</span></li>'; echo '<li><a href="?page='.$total_pages.$q.'">'.$total_pages.'</a></li>'; }
                echo ($page<$total_pages)?'<li><a href="?page='.$next.$q.'">Next &raquo;</a></li>':'<li class="disabled"><span>Next &raquo;</span></li>';
                ?>
            </ul></nav>

        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
