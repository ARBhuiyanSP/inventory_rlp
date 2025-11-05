<?php include 'header.php';
$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
$user_id        =   $_SESSION['logged']['user_id'];
$role_id        =   $_SESSION['logged']['role_id'];
 ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<style>
.dashboard-card {
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin-bottom: 20px;
    border: none;
}
.dashboard-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 12px rgba(0,0,0,0.15);
}
.stat-card {
    padding: 20px;
    text-align: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 10px;
    margin-bottom: 15px;
}
.stat-card.blue {
    background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
}
.stat-card.green {
    background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
}
.stat-card.orange {
    background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
}
.stat-card.red {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
}
.stat-card.purple {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}
.stat-card.teal {
    background: linear-gradient(135deg, #0ba360 0%, #3cba92 100%);
}
.stat-number {
    font-size: 36px;
    font-weight: bold;
    margin: 10px 0;
}
.stat-label {
    font-size: 14px;
    opacity: 0.9;
    text-transform: uppercase;
    letter-spacing: 1px;
}
.section-header {
    font-weight: bold;
    color: #2c3e50;
    margin: 20px 0 15px 0;
    padding-bottom: 10px;
    border-bottom: 3px solid #3498db;
    font-size: 20px;
}
.chart-container {
    background: white;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    margin-bottom: 20px;
}
.info-table {
    font-size: 13px;
}
.info-table td {
    padding: 8px !important;
}
.badge-custom {
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 11px;
}
</style>

<div class="container-fluid">
    <!-- Page Header -->
    <div class="row" style="padding-bottom:10px;">
        <div class="col-lg-12 col-md-12">
            <center><h1 style="color: #2c3e50; font-weight: bold;"><?= $settings['name']; ?></h1></center>
            <center><p style="color: #7f8c8d;">Dynamic Management Dashboard</p></center>
        </div>
    </div>

    <!-- ========================================
         AT A GLANCE SECTION - FIXED ASSETS & SERVICE
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-eye"></i> AT A GLANCE - FIXED ASSETS & SERVICE
    </div>

    <div class="row">
        <?php
        // Get Fixed Assets Count by Category
        $sql_categories = "SELECT * FROM `assets_categories` ORDER BY `assets_category`";
        $result_categories = mysqli_query($conn, $sql_categories);
        
        while ($cat = mysqli_fetch_array($result_categories)) {
            $assets_category = $cat['assets_id'];
            
            // Total assets in category
            $sql_total = "SELECT COUNT(*) as total FROM `ams_products` WHERE `assets_category`='$assets_category' AND `status`='active'";
            $result_total = mysqli_query($conn, $sql_total);
            $total_count = mysqli_fetch_assoc($result_total)['total'];
            
            // Assigned assets
            $sql_assigned = "SELECT COUNT(*) as assigned FROM `ams_products` WHERE `assets_category`='$assets_category' AND `assign_status`='assigned' AND `status`='active'";
            $result_assigned = mysqli_query($conn, $sql_assigned);
            $assigned_count = mysqli_fetch_assoc($result_assigned)['assigned'];
            
            // Available assets
            $available_count = $total_count - $assigned_count;
        ?>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="stat-card blue">
                <div class="stat-label"><?php echo $cat['assets_category']; ?></div>
                <div class="stat-number"><?php echo $total_count; ?></div>
                <small>Assigned: <?php echo $assigned_count; ?> | Available: <?php echo $available_count; ?></small>
                <div style="margin-top: 10px;">
                    <a href="assets-list.php?category=<?php echo $assets_category; ?>" class="btn btn-sm btn-light">View Details</a>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>

    <!-- Service Status Summary -->
    <div class="row">
        <?php
        // Service data counts
        $sql_service_total = "SELECT COUNT(*) as total FROM `inv_services`";
        $result_service_total = mysqli_query($conn, $sql_service_total);
        $service_total = mysqli_fetch_assoc($result_service_total)['total'];
        
        $sql_service_at = "SELECT COUNT(*) as total FROM `inv_services` WHERE `status`='at_servicing'";
        $result_service_at = mysqli_query($conn, $sql_service_at);
        $service_at_servicing = mysqli_fetch_assoc($result_service_at)['total'];
        
        $sql_service_completed = "SELECT COUNT(*) as total FROM `inv_services` WHERE `status`='active'";
        $result_service_completed = mysqli_query($conn, $sql_service_completed);
        $service_completed = mysqli_fetch_assoc($result_service_completed)['total'];
        ?>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="stat-card green">
                <div class="stat-label">Total Services</div>
                <div class="stat-number"><?php echo $service_total; ?></div>
                <a href="service_entry.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="stat-card orange">
                <div class="stat-label">At Servicing</div>
                <div class="stat-number"><?php echo $service_at_servicing; ?></div>
                <small>Currently being serviced</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="stat-card teal">
                <div class="stat-label">Completed Services</div>
                <div class="stat-number"><?php echo $service_completed; ?></div>
                <small>Successfully completed</small>
            </div>
        </div>
    </div>

    <!-- ========================================
         PROCUREMENT SECTION
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-shopping-cart"></i> PROCUREMENT AREA
    </div>

    <div class="row">
        <?php
        // RLP Data
        $sql_rlp_total = "SELECT COUNT(*) as total FROM `rlp_info` WHERE `is_delete`=0";
        $result_rlp_total = mysqli_query($conn, $sql_rlp_total);
        $rlp_total = mysqli_fetch_assoc($result_rlp_total)['total'];
        
        $sql_rlp_approved = "SELECT COUNT(*) as total FROM `rlp_info` WHERE `is_delete`=0 AND `rlp_status`=1";
        $result_rlp_approved = mysqli_query($conn, $sql_rlp_approved);
        $rlp_approved = mysqli_fetch_assoc($result_rlp_approved)['total'];
        
        $sql_rlp_pending = "SELECT COUNT(*) as total FROM `rlp_info` WHERE `is_delete`=0 AND `rlp_status`!=1";
        $result_rlp_pending = mysqli_query($conn, $sql_rlp_pending);
        $rlp_pending = mysqli_fetch_assoc($result_rlp_pending)['total'];
        
        // Notesheet Data (with error handling)
        $sql_ns_total = "SELECT COUNT(*) as total FROM `notesheets_master` WHERE `is_delete`=0";
        $result_ns_total = mysqli_query($conn, $sql_ns_total);
        $ns_total = ($result_ns_total && $row = mysqli_fetch_assoc($result_ns_total)) ? $row['total'] : 0;
        
        $sql_ns_approved = "SELECT COUNT(*) as total FROM `notesheets_master` WHERE `is_delete`=0 AND `notesheet_status`=1";
        $result_ns_approved = mysqli_query($conn, $sql_ns_approved);
        $ns_approved = ($result_ns_approved && $row = mysqli_fetch_assoc($result_ns_approved)) ? $row['total'] : 0;
        
        $sql_ns_pending = "SELECT COUNT(*) as total FROM `notesheets_master` WHERE `is_delete`=0 AND `notesheet_status`!=1";
        $result_ns_pending = mysqli_query($conn, $sql_ns_pending);
        $ns_pending = ($result_ns_pending && $row = mysqli_fetch_assoc($result_ns_pending)) ? $row['total'] : 0;
        
        // Work Order Data (with error handling)
        $sql_wo_total = "SELECT COUNT(*) as total FROM `workorders_master` WHERE `is_delete`=0";
        $result_wo_total = mysqli_query($conn, $sql_wo_total);
        $wo_total = ($result_wo_total && $row = mysqli_fetch_assoc($result_wo_total)) ? $row['total'] : 0;
        
        $sql_wo_approved = "SELECT COUNT(*) as total FROM `workorders_master` WHERE `is_delete`=0 AND `status`=1";
        $result_wo_approved = mysqli_query($conn, $sql_wo_approved);
        $wo_approved = ($result_wo_approved && $row = mysqli_fetch_assoc($result_wo_approved)) ? $row['total'] : 0;
        
        $sql_wo_pending = "SELECT COUNT(*) as total FROM `workorders_master` WHERE `is_delete`=0 AND `status`!=1";
        $result_wo_pending = mysqli_query($conn, $sql_wo_pending);
        $wo_pending = ($result_wo_pending && $row = mysqli_fetch_assoc($result_wo_pending)) ? $row['total'] : 0;
        ?>
        
        <!-- RLP Cards -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card purple">
                <div class="stat-label">Total RLPs</div>
                <div class="stat-number"><?php echo $rlp_total; ?></div>
                <a href="rlp_list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card green">
                <div class="stat-label">Approved RLPs</div>
                <div class="stat-number"><?php echo $rlp_approved; ?></div>
                <small>Successfully approved</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Pending RLPs</div>
                <div class="stat-number"><?php echo $rlp_pending; ?></div>
                <small>Awaiting approval</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card blue">
                <div class="stat-label">Approval Rate</div>
                <div class="stat-number"><?php echo $rlp_total > 0 ? round(($rlp_approved/$rlp_total)*100) : 0; ?>%</div>
                <small>Overall approval percentage</small>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Notesheet Cards -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card teal">
                <div class="stat-label">Total Notesheets</div>
                <div class="stat-number"><?php echo $ns_total; ?></div>
                <a href="notesheets_list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card green">
                <div class="stat-label">Approved NS</div>
                <div class="stat-number"><?php echo $ns_approved; ?></div>
                <small>Approved notesheets</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Pending NS</div>
                <div class="stat-number"><?php echo $ns_pending; ?></div>
                <small>Pending notesheets</small>
            </div>
        </div>
        
        <!-- Work Order Summary -->
        <div class="col-lg-3 col-md-6">
            <div class="stat-card red">
                <div class="stat-label">Work Orders</div>
                <div class="stat-number"><?php echo $wo_total; ?></div>
                <small>Approved: <?php echo $wo_approved; ?> | Pending: <?php echo $wo_pending; ?></small>
                <div style="margin-top: 10px;">
                    <a href="workorders_list.php" class="btn btn-sm btn-light">View All</a>
                </div>
            </div>
        </div>
    </div>

    <!-- ========================================
         INVENTORY SECTION
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-boxes"></i> INVENTORY MANAGEMENT
    </div>

    <div class="row">
        <?php
        // Material Receive Count (with error handling)
        $sql_receive = "SELECT COUNT(*) as total FROM `inv_receive`";
        $result_receive = mysqli_query($conn, $sql_receive);
        $receive_total = ($result_receive && $row = mysqli_fetch_assoc($result_receive)) ? $row['total'] : 0;
        
        // Material Issue Count (with error handling)
        $sql_issue = "SELECT COUNT(*) as total FROM `inv_issue`";
        $result_issue = mysqli_query($conn, $sql_issue);
        $issue_total = ($result_issue && $row = mysqli_fetch_assoc($result_issue)) ? $row['total'] : 0;
        
        // Total Stock Value (with error handling) - Calculate from materialbalance table
        $sql_stock = "SELECT SUM(mbin_val - mbout_val) as total_value FROM `inv_materialbalance`";
        $result_stock = mysqli_query($conn, $sql_stock);
        $stock_value = ($result_stock && $row = mysqli_fetch_assoc($result_stock)) ? ($row['total_value'] ?? 0) : 0;
        
        // Unique Materials (with error handling)
        $sql_materials = "SELECT COUNT(DISTINCT material_id_code) as total FROM `inv_material`";
        $result_materials = mysqli_query($conn, $sql_materials);
        $materials_count = ($result_materials && $row = mysqli_fetch_assoc($result_materials)) ? $row['total'] : 0;
        ?>
        
        <div class="col-lg-3 col-md-6">
            <div class="stat-card blue">
                <div class="stat-label">Material Receive</div>
                <div class="stat-number"><?php echo $receive_total; ?></div>
                <a href="receive-list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Material Issue</div>
                <div class="stat-number"><?php echo $issue_total; ?></div>
                <a href="issue-list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card green">
                <div class="stat-label">Stock Value</div>
                <div class="stat-number">৳<?php echo number_format($stock_value, 0); ?></div>
                <a href="stock_report.php" class="btn btn-sm btn-light" style="margin-top: 10px;">Stock Report</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card purple">
                <div class="stat-label">Unique Materials</div>
                <div class="stat-number"><?php echo $materials_count; ?></div>
                <a href="material.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View Materials</a>
            </div>
        </div>
    </div>

    <!-- Stock by Warehouse with Dropdown Filter -->
    <div class="row">
        <div class="col-lg-6">
            <div class="chart-container">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                    <h5 style="font-weight: bold; color: #2c3e50; margin: 0;"><i class="fas fa-warehouse"></i> Stock by Warehouse</h5>
                    <select id="warehouseFilter" class="form-control" style="width: 250px;">
                        <option value="all">All Warehouses</option>
                        <?php
                        // Only show warehouses that have stock data
                        $sql_wh_list = "SELECT DISTINCT w.id, w.name
                                        FROM inv_materialbalance mb
                                        INNER JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id
                                        GROUP BY w.id
                                        HAVING SUM(mb.mbin_val - mb.mbout_val) > 0
                                        ORDER BY w.name";
                        $result_wh_list = mysqli_query($conn, $sql_wh_list);
                        if($result_wh_list) {
                            while($wh = mysqli_fetch_assoc($result_wh_list)) {
                                echo "<option value='{$wh['id']}'>{$wh['name']}</option>";
                            }
                        }
                        ?>
                    </select>
                </div>
                <div id="warehouseStockInfo" style="background: #ecf0f1; padding: 15px; border-radius: 5px; margin-bottom: 15px;">
                    <div class="row">
                        <div class="col-6">
                            <strong>Total Items:</strong> <span id="warehouseItemCount">-</span>
                        </div>
                        <div class="col-6">
                            <strong>Stock Value:</strong> ৳<span id="warehouseStockValue">-</span>
                        </div>
                    </div>
                </div>
                <div id="warehouseChart"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="chart-container">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                    <h5 style="font-weight: bold; color: #2c3e50; margin: 0;"><i class="fas fa-project-diagram"></i> Stock by Project</h5>
                    <select id="projectFilter" class="form-control" style="width: 250px;">
                        <option value="all">All Projects</option>
                        <?php
                        // Only show projects that have stock data
                        $sql_proj_list = "SELECT DISTINCT mb.project_id, p.project_name 
                                          FROM inv_materialbalance mb
                                          INNER JOIN projects p ON mb.project_id = p.id
                                          GROUP BY mb.project_id
                                          HAVING SUM(mb.mbin_val - mb.mbout_val) > 0
                                          ORDER BY p.project_name";
                        $result_proj_list = mysqli_query($conn, $sql_proj_list);
                        if($result_proj_list) {
                            while($proj = mysqli_fetch_assoc($result_proj_list)) {
                                echo "<option value='{$proj['project_id']}'>{$proj['project_name']}</option>";
                            }
                        }
                        ?>
                    </select>
                </div>
                <div id="projectStockInfo" style="background: #ecf0f1; padding: 15px; border-radius: 5px; margin-bottom: 15px;">
                    <div class="row">
                        <div class="col-6">
                            <strong>Total Items:</strong> <span id="projectItemCount">-</span>
                        </div>
                        <div class="col-6">
                            <strong>Stock Value:</strong> ৳<span id="projectStockValue">-</span>
                        </div>
                    </div>
                </div>
                <div id="projectChart"></div>
            </div>
        </div>
    </div>

    <!-- ========================================
         EQUIPMENT SECTION
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-tools"></i> EQUIPMENT MANAGEMENT
    </div>

    <div class="row">
        <?php
        // Equipment Data (with error handling)
        $sql_equip_total = "SELECT COUNT(*) as total FROM `equipments`";
        $result_equip_total = mysqli_query($conn, $sql_equip_total);
        $equip_total = ($result_equip_total && $row = mysqli_fetch_assoc($result_equip_total)) ? $row['total'] : 0;
        
        // Equipment by Status (with error handling)
        $sql_equip_running = "SELECT COUNT(*) as total FROM `equipments` WHERE `status`='Running'";
        $result_equip_running = mysqli_query($conn, $sql_equip_running);
        $equip_running = ($result_equip_running && $row = mysqli_fetch_assoc($result_equip_running)) ? $row['total'] : 0;
        
        $sql_equip_idle = "SELECT COUNT(*) as total FROM `equipments` WHERE `status`='breakdown'";
        $result_equip_idle = mysqli_query($conn, $sql_equip_idle);
        $equip_idle = ($result_equip_idle && $row = mysqli_fetch_assoc($result_equip_idle)) ? $row['total'] : 0;
        
        $sql_equip_rented = "SELECT COUNT(*) as total FROM `equipments` WHERE `status`='Rented'";
        $result_equip_rented = mysqli_query($conn, $sql_equip_rented);
        $equip_rented = ($result_equip_rented && $row = mysqli_fetch_assoc($result_equip_rented)) ? $row['total'] : 0;
        
        // Inspection Data (with error handling)
        $sql_inspection = "SELECT COUNT(*) as total FROM `inspaction`";
        $result_inspection = mysqli_query($conn, $sql_inspection);
        $inspection_total = ($result_inspection && $row = mysqli_fetch_assoc($result_inspection)) ? $row['total'] : 0;
        ?>
        
        <div class="col-lg-3 col-md-6">
            <div class="stat-card purple">
                <div class="stat-label">Total Equipment</div>
                <div class="stat-number"><?php echo $equip_total; ?></div>
                <a href="equipments-list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card green">
                <div class="stat-label">Running</div>
                <div class="stat-number"><?php echo $equip_running; ?></div>
                <small>Currently operational</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card blue">
                <div class="stat-label">Idle Equipment</div>
                <div class="stat-number"><?php echo $equip_idle; ?></div>
                <small>Not in use</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card teal">
                <div class="stat-label">Rented Out</div>
                <div class="stat-number"><?php echo $equip_rented; ?></div>
                <small>Currently rented</small>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Total Inspections</div>
                <div class="stat-number"><?php echo $inspection_total; ?></div>
                <a href="inspection-history.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View History</a>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="chart-container">
                <h5 style="font-weight: bold; color: #2c3e50;"><i class="fas fa-chart-pie"></i> Equipment Status Distribution</h5>
                <div id="equipmentStatusChart"></div>
            </div>
        </div>
    </div>

    <!-- ========================================
         MAINTENANCE SECTION
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-wrench"></i> MAINTENANCE MANAGEMENT
    </div>

    <div class="row">
								<?php
        // Maintenance Data (with error handling)
        $sql_maintenance_count = "SELECT COUNT(*) as total FROM `maintenance_cost`";
        $result_maintenance_count = mysqli_query($conn, $sql_maintenance_count);
        $maintenance_count = ($result_maintenance_count && $row = mysqli_fetch_assoc($result_maintenance_count)) ? $row['total'] : 0;
        
        // Get total maintenance cost (with error handling)
        $sql_maintenance_total = "SELECT SUM(total_cost) as total_cost FROM `maintenance_cost`";
        $result_maintenance_total = mysqli_query($conn, $sql_maintenance_total);
        $maintenance_cost = ($result_maintenance_total && $row = mysqli_fetch_assoc($result_maintenance_total)) ? ($row['total_cost'] ?? 0) : 0;
        
        // Get this month maintenance cost (with error handling)
        $current_month = date('Y-m');
        $sql_month_cost = "SELECT SUM(total_cost) as total_cost FROM `maintenance_cost` WHERE DATE_FORMAT(created_at, '%Y-%m') = '$current_month'";
        $result_month_cost = mysqli_query($conn, $sql_month_cost);
        $month_cost = ($result_month_cost && $row = mysqli_fetch_assoc($result_month_cost)) ? ($row['total_cost'] ?? 0) : 0;
        ?>
        
        <div class="col-lg-3 col-md-6">
            <div class="stat-card red">
                <div class="stat-label">Total Maintenance</div>
                <div class="stat-number"><?php echo $maintenance_count; ?></div>
                <a href="maintenancecost_list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Total Cost</div>
                <div class="stat-number">৳<?php echo number_format($maintenance_cost, 0); ?></div>
                <small>All time maintenance cost</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card purple">
                <div class="stat-label">This Month</div>
                <div class="stat-number">৳<?php echo number_format($month_cost, 0); ?></div>
                <small><?php echo date('F Y'); ?></small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card blue">
                <div class="stat-label">Avg per Maintenance</div>
                <div class="stat-number">৳<?php echo $maintenance_count > 0 ? number_format($maintenance_cost/$maintenance_count, 0) : 0; ?></div>
                <small>Average cost</small>
            </div>
        </div>
    </div>

    <!-- Top Cost Equipment & Maintenance Trend -->
    <div class="row">
        <div class="col-lg-6">
            <div class="chart-container">
                <h5 style="font-weight: bold; color: #2c3e50;"><i class="fas fa-chart-bar"></i> Top 10 Cost Equipment</h5>
                <div id="topEquipmentChart"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="chart-container">
                <h5 style="font-weight: bold; color: #2c3e50;"><i class="fas fa-chart-line"></i> Monthly Maintenance Cost Trend</h5>
                <div id="maintenanceTrendChart"></div>
            </div>
        </div>
    </div>

    <!-- ========================================
         RENTAL SECTION
    ========================================= -->
    <div class="section-header">
        <i class="fas fa-handshake"></i> RENTAL MANAGEMENT
    </div>

    <div class="row">
										<?php
        // Rental Data (with error handling)
        $sql_rental_total = "SELECT COUNT(*) as total FROM `rents`";
        $result_rental_total = mysqli_query($conn, $sql_rental_total);
        $rental_total = ($result_rental_total && $row = mysqli_fetch_assoc($result_rental_total)) ? $row['total'] : 0;
        
        // Total rental revenue (with error handling)
        $sql_rental_revenue = "SELECT SUM(invoiceable_amount) as total FROM `rents`";
        $result_rental_revenue = mysqli_query($conn, $sql_rental_revenue);
        $rental_revenue = ($result_rental_revenue && $row = mysqli_fetch_assoc($result_rental_revenue)) ? ($row['total'] ?? 0) : 0;
        
        // Invoices (with error handling)
        $sql_invoices = "SELECT COUNT(*) as total FROM `rent_invoice`";
        $result_invoices = mysqli_query($conn, $sql_invoices);
        $invoices_total = ($result_invoices && $row = mysqli_fetch_assoc($result_invoices)) ? $row['total'] : 0;
        
        // Collections (with error handling)
        $sql_collections = "SELECT SUM(amount) as total FROM `client_balance` WHERE cb_cr_amount > 0";
        $result_collections = mysqli_query($conn, $sql_collections);
        $collections_total = ($result_collections && $row = mysqli_fetch_assoc($result_collections)) ? ($row['total'] ?? 0) : 0;
        
        // Pending bills (with error handling)
        $sql_pending_bills = "SELECT COUNT(*) as total FROM `rents` WHERE `bill_status`='Pending'";
        $result_pending_bills = mysqli_query($conn, $sql_pending_bills);
        $pending_bills = ($result_pending_bills && $row = mysqli_fetch_assoc($result_pending_bills)) ? $row['total'] : 0;
        
        // Due amount (with error handling)
        $sql_due = "SELECT SUM(due_amount) as total FROM `rents` WHERE `bill_status`='Pending'";
        $result_due = mysqli_query($conn, $sql_due);
        $due_amount = ($result_due && $row = mysqli_fetch_assoc($result_due)) ? ($row['total'] ?? 0) : 0;
        ?>
        
        <div class="col-lg-3 col-md-6">
            <div class="stat-card blue">
                <div class="stat-label">Total Rentals</div>
                <div class="stat-number"><?php echo $rental_total; ?></div>
                <a href="rent-list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View All</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card green">
                <div class="stat-label">Total Revenue</div>
                <div class="stat-number">৳<?php echo number_format($rental_revenue, 0); ?></div>
                <small>Total rental income</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card purple">
                <div class="stat-label">Total Invoices</div>
                <div class="stat-number"><?php echo $invoices_total; ?></div>
                <a href="invoice_list.php" class="btn btn-sm btn-light" style="margin-top: 10px;">View Invoices</a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card teal">
                <div class="stat-label">Collections</div>
                <div class="stat-number">৳<?php echo number_format($collections_total, 0); ?></div>
                <small>Total collected amount</small>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="stat-card orange">
                <div class="stat-label">Pending Bills</div>
                <div class="stat-number"><?php echo $pending_bills; ?></div>
                <small>Bills awaiting payment</small>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stat-card red">
                <div class="stat-label">Due Amount</div>
                <div class="stat-number">৳<?php echo number_format($due_amount, 0); ?></div>
                <small>Total pending payments</small>
            </div>
									</div>
        <div class="col-lg-6">
            <div class="chart-container">
                <h5 style="font-weight: bold; color: #2c3e50;"><i class="fas fa-chart-pie"></i> Payment Status</h5>
                <div id="paymentStatusChart"></div>
                                    </div>
                                </div>
                            </div>

    <!-- Rental Invoice Summary -->
    <div class="row">
        <div class="col-lg-12">
            <div class="chart-container">
                <h5 style="font-weight: bold; color: #2c3e50;"><i class="fas fa-chart-area"></i> Rental Revenue & Collection Trend</h5>
                <div id="rentalTrendChart"></div>
            </div>
						</div>
    </div>

					</div>
      <!-- /.container-fluid -->

<?php
// Get data for charts
// Warehouse Stock Data (with error handling) - Detailed with item count
$warehouse_data = [];
$warehouse_details = []; // For dropdown filtering
$sql_warehouse = "SELECT 
                    COALESCE(w.id, '0') as warehouse_id,
                    COALESCE(w.name, 'Not Assigned') as warehouse_name,
                    COUNT(DISTINCT mb.mb_materialid) as item_count,
                    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
                  FROM inv_materialbalance mb 
                  LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id 
                  GROUP BY w.id
                  HAVING SUM(mb.mbin_val - mb.mbout_val) > 0";
$result_warehouse = mysqli_query($conn, $sql_warehouse);
if($result_warehouse && mysqli_num_rows($result_warehouse) > 0) {
    while($row = mysqli_fetch_assoc($result_warehouse)) {
        if(($row['stock_value'] ?? 0) > 0) {
            $warehouse_data[] = [
                'name' => $row['warehouse_name'],
                'y' => (float)$row['stock_value']
            ];
            $warehouse_details[$row['warehouse_id']] = [
                'name' => $row['warehouse_name'],
                'item_count' => (int)$row['item_count'],
                'stock_value' => (float)$row['stock_value']
            ];
        }
    }
}
// Add default data if no results
if(empty($warehouse_data)) {
    $warehouse_data[] = ['name' => 'No Data', 'y' => 0];
    $warehouse_details['0'] = ['name' => 'No Data', 'item_count' => 0, 'stock_value' => 0];
}

// Debug: Log warehouse data structure
// echo "<!-- Warehouse Details: " . print_r($warehouse_details, true) . " -->";

// Project Stock Data (with error handling) - Detailed with item count
$project_data = [];
$project_details = []; // For dropdown filtering
$sql_project = "SELECT 
                    COALESCE(mb.project_id, '0') as project_id,
                    COALESCE(p.project_name, 'Not Assigned') as project_name,
                    COUNT(DISTINCT mb.mb_materialid) as item_count,
                    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
                FROM inv_materialbalance mb 
                LEFT JOIN projects p ON mb.project_id = p.id 
                GROUP BY mb.project_id 
                HAVING SUM(mb.mbin_val - mb.mbout_val) > 0
                ORDER BY stock_value DESC
                LIMIT 10";
$result_project = mysqli_query($conn, $sql_project);
if($result_project && mysqli_num_rows($result_project) > 0) {
    while($row = mysqli_fetch_assoc($result_project)) {
        if(($row['stock_value'] ?? 0) > 0) {
            $project_data[] = [
                'name' => $row['project_name'],
                'y' => (float)$row['stock_value']
            ];
            $project_details[$row['project_id']] = [
                'name' => $row['project_name'],
                'item_count' => (int)$row['item_count'],
                'stock_value' => (float)$row['stock_value']
            ];
        }
    }
}
// Add default data if no results
if(empty($project_data)) {
    $project_data[] = ['name' => 'No Data', 'y' => 0];
    $project_details['0'] = ['name' => 'No Data', 'item_count' => 0, 'stock_value' => 0];
}

// Debug: Log project data structure
// echo "<!-- Project Details: " . print_r($project_details, true) . " -->";

// Top 10 Equipment by Maintenance Cost (with error handling)
$top_equipment = [];
$sql_top_equip = "SELECT 
                    COALESCE(e.eel_code, 'Unknown') as eel_code,
                    COALESCE(e.name, 'Unknown Equipment') as name,
                    SUM(mc.total_cost) as total_cost 
                  FROM maintenance_cost mc 
                  LEFT JOIN equipments e ON mc.eel_code = e.eel_code 
                  GROUP BY mc.eel_code 
                  HAVING SUM(mc.total_cost) > 0
                  ORDER BY total_cost DESC 
                  LIMIT 10";
$result_top_equip = mysqli_query($conn, $sql_top_equip);
if($result_top_equip && mysqli_num_rows($result_top_equip) > 0) {
    while($row = mysqli_fetch_assoc($result_top_equip)) {
        if(($row['total_cost'] ?? 0) > 0) {
            $top_equipment[] = [
                'name' => $row['eel_code'] . ' - ' . $row['name'],
                'y' => (float)$row['total_cost']
            ];
        }
    }
}
// Add default data if no results
if(empty($top_equipment)) {
    $top_equipment[] = ['name' => 'No Data', 'y' => 0];
}

// Monthly Maintenance Trend (Last 6 months) with error handling
$maintenance_trend = [];
for($i = 5; $i >= 0; $i--) {
    $month = date('Y-m', strtotime("-$i months"));
    $sql_trend = "SELECT SUM(total_cost) as cost FROM maintenance_cost WHERE DATE_FORMAT(created_at, '%Y-%m') = '$month'";
    $result_trend = mysqli_query($conn, $sql_trend);
    $cost = 0;
    if($result_trend && $row = mysqli_fetch_assoc($result_trend)) {
        $cost = $row['cost'] ?? 0;
    }
    $maintenance_trend[] = [
        'month' => date('M Y', strtotime($month.'-01')),
        'cost' => (float)$cost
    ];
}

// Rental Revenue Trend (Last 6 months) with error handling
$rental_trend = [];
for($i = 5; $i >= 0; $i--) {
    $month = date('Y-m', strtotime("-$i months"));
    $sql_rental = "SELECT SUM(invoiceable_amount) as revenue, SUM(deposit_amount) as collection 
                   FROM rents WHERE DATE_FORMAT(created_at, '%Y-%m') = '$month'";
    $result_rental = mysqli_query($conn, $sql_rental);
    $revenue = 0;
    $collection = 0;
    if($result_rental && $data = mysqli_fetch_assoc($result_rental)) {
        $revenue = $data['revenue'] ?? 0;
        $collection = $data['collection'] ?? 0;
    }
    $rental_trend[] = [
        'month' => date('M Y', strtotime($month.'-01')),
        'revenue' => (float)$revenue,
        'collection' => (float)$collection
    ];
}
?>

<script>
// Declare global variables for charts and data
var warehouseChart, projectChart;
var warehouseDetails, projectDetails;
var allWarehouseData, allProjectData;

// Wait for DOM to be ready
$(document).ready(function() {
    console.log('Dashboard filters initializing...');
    
    // Store warehouse details for filtering
    warehouseDetails = <?php echo json_encode($warehouse_details); ?>;
    allWarehouseData = <?php echo json_encode($warehouse_data); ?>;
    
    console.log('Warehouse data loaded:', warehouseDetails);

    // Initialize Warehouse Stock Chart
    warehouseChart = Highcharts.chart('warehouseChart', {
        chart: { type: 'pie' },
        title: { text: '' },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: ৳{point.y:,.0f}'
                }
            }
        },
        series: [{
            name: 'Stock Value',
            colorByPoint: true,
            data: allWarehouseData
        }]
    });

    // Update warehouse info display
    window.updateWarehouseInfo = function(warehouseId) {
        console.log('📍 updateWarehouseInfo called with:', warehouseId);
        console.log('📍 warehouseChart exists:', typeof warehouseChart);
        console.log('📍 warehouseDetails object:', warehouseDetails);
        
        if(warehouseId === 'all') {
            // Calculate totals for all warehouses
            var totalItems = 0;
            var totalValue = 0;
            for(var key in warehouseDetails) {
                totalItems += warehouseDetails[key].item_count;
                totalValue += warehouseDetails[key].stock_value;
            }
            document.getElementById('warehouseItemCount').textContent = totalItems.toLocaleString();
            document.getElementById('warehouseStockValue').textContent = totalValue.toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
            
            // Update chart with all data
            console.log('📊 Updating chart with ALL warehouses:', allWarehouseData.length, 'items');
            console.log('📊 Chart series before:', warehouseChart.series[0].data.length, 'points');
            warehouseChart.series[0].update({
                data: allWarehouseData
            }, true);
            console.log('📊 Chart series after:', warehouseChart.series[0].data.length, 'points');
            console.log('📊 Chart redrawn');
        } else {
            // Show selected warehouse data
            console.log('🔍 Looking for warehouse ID:', warehouseId, 'Type:', typeof warehouseId);
            console.log('🔍 Available warehouse IDs:', Object.keys(warehouseDetails));
            
            if(warehouseDetails[warehouseId]) {
                var wh = warehouseDetails[warehouseId];
                console.log('✅ Warehouse found:', wh);
                document.getElementById('warehouseItemCount').textContent = wh.item_count.toLocaleString();
                document.getElementById('warehouseStockValue').textContent = wh.stock_value.toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
                
                // Update chart with single warehouse data
                console.log('📊 Updating chart with single warehouse');
                warehouseChart.series[0].update({
                    data: [{
                        name: wh.name,
                        y: wh.stock_value
                    }]
                }, true);
                console.log('📊 Chart updated and redrawn');
            } else {
                console.error('❌ Warehouse ID not found in warehouseDetails!');
                console.log('Available keys:', Object.keys(warehouseDetails));
            }
        }
    }

    // Warehouse filter dropdown event
    $('#warehouseFilter').on('change', function() {
        var selectedValue = this.value;
        console.log('🔄 Warehouse changed to:', selectedValue);
        console.log('📊 Warehouse data for ' + selectedValue + ':', warehouseDetails[selectedValue]);
        updateWarehouseInfo(selectedValue);
        console.log('✅ Warehouse chart updated');
    });

    // Initialize with all warehouses
    console.log('🚀 Initializing warehouse filter with ALL');
    console.log('📦 Chart object:', typeof warehouseChart);
    console.log('📦 Total warehouses:', Object.keys(warehouseDetails).length);
    updateWarehouseInfo('all');
    console.log('✅ Warehouse filter ready');

    // Store project details for filtering
    projectDetails = <?php echo json_encode($project_details); ?>;
    allProjectData = <?php echo json_encode($project_data); ?>;
    
    console.log('Project data loaded:', projectDetails);

    // Initialize Project Stock Chart
    projectChart = Highcharts.chart('projectChart', {
        chart: { type: 'column' },
        title: { text: '' },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '11px'
                }
            }
        },
        yAxis: {
            min: 0,
            title: { text: 'Stock Value (৳)' }
        },
        legend: { enabled: false },
        series: [{
            name: 'Stock Value',
            data: allProjectData,
            dataLabels: {
                enabled: true,
                format: '৳{point.y:.0f}'
            }
        }]
    });

    // Update project info display
    window.updateProjectInfo = function(projectId) {
        console.log('📍 updateProjectInfo called with:', projectId);
        console.log('📍 projectChart exists:', typeof projectChart);
        console.log('📍 projectDetails object:', projectDetails);
        
        if(projectId === 'all') {
            // Calculate totals for all projects
            var totalItems = 0;
            var totalValue = 0;
            for(var key in projectDetails) {
                totalItems += projectDetails[key].item_count;
                totalValue += projectDetails[key].stock_value;
            }
            document.getElementById('projectItemCount').textContent = totalItems.toLocaleString();
            document.getElementById('projectStockValue').textContent = totalValue.toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
            
            // Update chart with all data
            console.log('📊 Updating chart with ALL projects:', allProjectData.length, 'items');
            console.log('📊 Chart series before:', projectChart.series[0].data.length, 'points');
            projectChart.series[0].update({
                data: allProjectData
            }, true);
            console.log('📊 Chart series after:', projectChart.series[0].data.length, 'points');
            console.log('📊 Chart redrawn');
        } else {
            // Show selected project data
            console.log('🔍 Looking for project ID:', projectId, 'Type:', typeof projectId);
            console.log('🔍 Available project IDs:', Object.keys(projectDetails));
            
            if(projectDetails[projectId]) {
                var proj = projectDetails[projectId];
                console.log('✅ Project found:', proj);
                document.getElementById('projectItemCount').textContent = proj.item_count.toLocaleString();
                document.getElementById('projectStockValue').textContent = proj.stock_value.toLocaleString('en-IN', {minimumFractionDigits: 2, maximumFractionDigits: 2});
                
                // Update chart with single project data
                console.log('📊 Updating chart with single project');
                projectChart.series[0].update({
                    data: [{
                        name: proj.name,
                        y: proj.stock_value
                    }]
                }, true);
                console.log('📊 Chart updated and redrawn');
            } else {
                console.error('❌ Project ID not found in projectDetails!');
                console.log('Available keys:', Object.keys(projectDetails));
            }
        }
    }

    // Project filter dropdown event
    $('#projectFilter').on('change', function() {
        var selectedValue = this.value;
        console.log('🔄 Project changed to:', selectedValue);
        console.log('📊 Project data for ' + selectedValue + ':', projectDetails[selectedValue]);
        updateProjectInfo(selectedValue);
        console.log('✅ Project chart updated');
    });

    // Initialize with all projects
    console.log('🚀 Initializing project filter with ALL');
    console.log('📊 Chart object:', typeof projectChart);
    console.log('📊 Total projects:', Object.keys(projectDetails).length);
    updateProjectInfo('all');
    console.log('✅ Project filter ready');
    
    console.log('🎉 All filters initialized successfully!');
    console.log('==================================================');
    console.log('TRY: Change warehouse or project dropdown above');
    console.log('EXPECTED: Chart should update WITHOUT page refresh');
    console.log('==================================================');
});

// Equipment Status Chart
Highcharts.chart('equipmentStatusChart', {
    chart: { type: 'pie' },
    title: { text: '' },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.y}'
            }
        }
    },
    series: [{
        name: 'Equipment',
        colorByPoint: true,
        data: [
            { name: 'Running', y: <?php echo $equip_running; ?>, color: '#43e97b' },
            { name: 'Idle', y: <?php echo $equip_idle; ?>, color: '#FB828B' },
            { name: 'Rented', y: <?php echo $equip_rented; ?>, color: '#667eea' }
        ]
    }]
});

// Top Equipment Cost Chart
Highcharts.chart('topEquipmentChart', {
    chart: { type: 'bar' },
    title: { text: '' },
    xAxis: {
        type: 'category',
        labels: {
            style: { fontSize: '11px' }
        }
    },
    yAxis: {
        min: 0,
        title: { text: 'Maintenance Cost (৳)' }
    },
    legend: { enabled: false },
    series: [{
        name: 'Cost',
        data: <?php echo json_encode($top_equipment); ?>,
        color: '#f5576c',
        dataLabels: {
            enabled: true,
            format: '৳{point.y:.0f}'
        }
    }]
});

// Maintenance Trend Chart
Highcharts.chart('maintenanceTrendChart', {
    chart: { type: 'line' },
    title: { text: '' },
    xAxis: {
        categories: <?php echo json_encode(array_column($maintenance_trend, 'month')); ?>
    },
    yAxis: {
        title: { text: 'Cost (৳)' }
    },
    series: [{
        name: 'Maintenance Cost',
        data: <?php echo json_encode(array_column($maintenance_trend, 'cost')); ?>,
        color: '#fa709a'
    }]
});

// Payment Status Chart
Highcharts.chart('paymentStatusChart', {
    chart: { type: 'pie' },
    title: { text: '' },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: ৳{point.y:.0f}'
            }
        }
    },
    series: [{
        name: 'Amount',
        colorByPoint: true,
        data: [
            { name: 'Collected', y: <?php echo $collections_total; ?>, color: '#43e97b' },
            { name: 'Due', y: <?php echo $due_amount; ?>, color: '#f5576c' }
        ]
    }]
});

// Rental Trend Chart
Highcharts.chart('rentalTrendChart', {
    chart: { type: 'area' },
    title: { text: '' },
    xAxis: {
        categories: <?php echo json_encode(array_column($rental_trend, 'month')); ?>
    },
    yAxis: {
        title: { text: 'Amount (৳)' }
    },
    series: [{
        name: 'Revenue',
        data: <?php echo json_encode(array_column($rental_trend, 'revenue')); ?>,
        color: '#4facfe'
    }, {
        name: 'Collection',
        data: <?php echo json_encode(array_column($rental_trend, 'collection')); ?>,
        color: '#43e97b'
    }]
});
</script>

<?php include 'footer.php' ?>
