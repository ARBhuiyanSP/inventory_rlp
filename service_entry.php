<?php 
include 'header.php';
?>

<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Service List</li>
    </ol>

    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <form action="" id="warehouse_stock_search_form" method="GET">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="todate">Select Asset For Repair/Servicing</label>
                                    <select name="id" class="form-control select2">
                                        <option>Select Product</option>
                                        <?php
                                        $sqlvs="SELECT * FROM `ams_products` WHERE `status`='active' ";
                                        $resultvs = mysqli_query($conn,$sqlvs);
                                        while($rowvs = mysqli_fetch_array($resultvs)) {
                                            $selected = (isset($_GET['id']) && $_GET['id'] == $rowvs['id']) ? 'selected' : '';
                                        ?>
                                        <option value="<?php echo $rowvs['id']; ?>" <?php echo $selected; ?>>
                                            <?php echo $rowvs['sl_no'] ?> || <?php echo $rowvs['item_name'] ?> || <?php echo $rowvs['model'] ?> || <?php echo $rowvs['assets_description'] ?>
                                        </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="todate">.</label>
                                    <button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <?php
            if(isset($_GET['submit'])){
                $id = $_GET['id'];
                $sql = "SELECT * FROM `ams_products` WHERE `id`='$id'";
                $result = mysqli_query($conn, $sql);
                $row=mysqli_fetch_array($result);
                include('service_entry_form.php');
            } else { 
            ?>
            <!-- Search Form -->
            <form method="GET" action="">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <input type="text" name="search" class="form-control" 
                               placeholder="Search by SRV No, Asset ID, Vendor or Status"
                               value="<?php echo isset($_GET['search']) ? $_GET['search'] : ''; ?>">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="form-control btn btn-info">Search</button>
                    </div>
                </div>
            </form>

            <?php
            // Pagination + Search Logic
            $limit = 10; // rows per page
            $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
            $start = ($page - 1) * $limit;

            $search = "";
            $where = " WHERE 1 ";

            if (!empty($_GET['search'])) {
                $search = mysqli_real_escape_string($conn, $_GET['search']);
                $where .= " AND (s.srv_no LIKE '%$search%' 
                            OR s.assets_id LIKE '%$search%' 
                            OR v.vendor_name LIKE '%$search%' 
                            OR s.status LIKE '%$search%')";
            }

            // Get data with JOIN to vendors
            $sql = "SELECT s.*, v.vendor_name 
                    FROM inv_services s 
                    LEFT JOIN vendors v ON s.vendor = v.vendor_id 
                    $where 
                    ORDER BY s.id DESC 
                    LIMIT $start, $limit";
            $result = mysqli_query($conn, $sql);

            // Count total records (with same JOIN and WHERE)
            $countSql = "SELECT COUNT(*) as total 
                         FROM inv_services s 
                         LEFT JOIN vendors v ON s.vendor = v.vendor_id 
                         $where";
            $countResult = mysqli_query($conn, $countSql);
            $countRow = mysqli_fetch_assoc($countResult);
            $total = $countRow['total'];

            $pages = ceil($total / $limit);
            ?>

            <!-- Table -->
            <div class="table-responsive">
              <table class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>SRV No</th>
                    <th>Asset ID</th>
                    <th>Vendor</th>
                    <th>Handover Date</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <?php if(mysqli_num_rows($result) > 0){ 
                    while($row = mysqli_fetch_assoc($result)){ ?>
                      <tr>
                        <td><?php echo $row['srv_no']; ?></td>
                        <td><?php echo $row['assets_slno']; ?></td>
                        <td><?php echo $row['vendor_name'] ? $row['vendor_name'] : 'N/A'; ?></td>
                        <td><?php echo $row['handover_date']; ?></td>
                        <td><?php echo $row['status']; ?></td>
                        <td>
                          <a href="srv-handover-receipt.php?id=<?php echo $row['id']; ?>" class="btn btn-info btn-sm"><i class="fa fa-eye"></i></a>
						  
						  <?php if($row['status']=='at_servicing'){ ?>
						  <a href="srv_return.php?id=<?php echo $row['id']; ?>" class="btn btn-warning btn-sm"><i class="fa fa-regular fa-thumbs-up"></i></a>
						  
						  
							<?php } else{?>
							<a href="srv_bill.php?id=<?php echo $row['srv_no']; ?>" class="btn btn-danger btn-sm"><i class="fa fa-solid fa-money-bill"></i></a>
							<?php } ?>
						
                        </td>
                      </tr>
                  <?php } } else { ?>
                      <tr><td colspan="6" class="text-center">No Records Found</td></tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>

            <!-- Pagination -->
            <nav>
              <ul class="pagination">
                <?php if($page > 1){ ?>
                  <li class="page-item"><a class="page-link" href="?page=<?php echo $page-1; ?>&search=<?php echo $search; ?>">Previous</a></li>
                <?php } ?>

                <?php for($i=1; $i <= $pages; $i++){ ?>
                  <li class="page-item <?php if($i==$page) echo 'active'; ?>">
                    <a class="page-link" href="?page=<?php echo $i; ?>&search=<?php echo $search; ?>"><?php echo $i; ?></a>
                  </li>
                <?php } ?>

                <?php if($page < $pages){ ?>
                  <li class="page-item"><a class="page-link" href="?page=<?php echo $page+1; ?>&search=<?php echo $search; ?>">Next</a></li>
                <?php } ?>
              </ul>
            </nav>
            <?php } ?>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>
