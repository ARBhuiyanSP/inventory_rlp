<?php
/**
 * Dashboard Database Verification Script
 * This script checks if all required tables and key fields exist for the dashboard
 * Run this script to verify database setup
 */

include 'connection/connect.php';

// Define required tables and their key fields
$required_tables = [
    'assets_categories' => ['assets_id', 'assets_category'],
    'ams_products' => ['id', 'assets_category', 'status', 'assign_status'],
    'inv_services' => ['id', 'srv_no', 'status', 'assets_id'],
    'rlp_info' => ['id', 'rlp_no', 'rlp_status', 'is_delete'],
    'notesheets_master' => ['id', 'notesheet_no', 'notesheet_status', 'is_delete'],
    'workorders_master' => ['id', 'wo_no', 'status', 'is_delete'],
    'inv_receive' => ['id', 'mrr_no', 'mrr_date'],
    'inv_receivedetail' => ['id', 'mrr_no', 'material_id', 'receive_qty'],
    'inv_issue' => ['id', 'issue_id', 'issue_date'],
    'inv_issuedetail' => ['id', 'issue_id', 'material_id', 'issue_qty'],
    'inv_material' => ['id', 'material_id_code', 'current_balance', 'rate'],
    'inv_materialbalance' => ['id', 'mb_ref_id', 'mb_materialid', 'mbin_val', 'mbout_val', 'warehouse_id', 'project_id'],
    'equipments' => ['id', 'eel_code', 'name', 'status', 'equipment_type'],
    'inspaction' => ['id', 'eel_code', 'ins_date', 'status'],
    'maintenance_cost' => ['id', 'm_cost_id', 'eel_code', 'total_cost', 'created_at'],
    'maintenance_spare_parts' => ['id', 'm_cost_id', 'material_id', 'quantity'],
    'maintenance_mechanic' => ['id', 'm_cost_id', 'mechanic_name'],
    'maintenance_other_cost' => ['id', 'm_cost_id', 'oc_name', 'oc_amount'],
    'rents' => ['id', 'challan_no', 'invoiceable_amount', 'deposit_amount', 'due_amount', 'bill_status'],
    'rent_details' => ['id', 'rent_id', 'equipments', 'rent_amount'],
    'rent_invoice' => ['id', 'invoice_no', 'rent_id', 'amount', 'status'],
    'rent_history' => ['id', 'challan_no', 'eel_code', 'rent_date', 'status'],
    'client_balance' => ['id', 'ref_id', 'client_id', 'cb_dr_amount', 'cb_cr_amount'],
    'warehouse' => ['warehouse_id', 'warehouse_name'],
    'projects' => ['project_id', 'project_name'],
    'vendors' => ['vendor_id', 'vendor_name']
];

// Add optional tables (not critical for dashboard)
$optional_tables = [
    'rlp_acknowledgement' => ['id', 'rlp_info_id', 'user_id', 'ack_status'],
    'equipment_assign' => ['id', 'eel_code', 'project_id', 'assign_date'],
    'settings' => ['id', 'name', 'logo']
];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Database Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background: #f5f5f5;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        h2 {
            color: #34495e;
            margin-top: 30px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .table th, .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .table th {
            background: #3498db;
            color: white;
            font-weight: bold;
        }
        .table tr:hover {
            background: #f5f5f5;
        }
        .status {
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }
        .status-ok {
            background: #2ecc71;
            color: white;
        }
        .status-warning {
            background: #f39c12;
            color: white;
        }
        .status-error {
            background: #e74c3c;
            color: white;
        }
        .summary {
            background: #ecf0f1;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .summary-item {
            display: inline-block;
            margin: 10px 20px 10px 0;
            font-size: 18px;
        }
        .field-list {
            font-size: 12px;
            color: #7f8c8d;
        }
        .missing-fields {
            color: #e74c3c;
            font-weight: bold;
        }
        .note {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 Dashboard Database Verification Report</h1>
        <p>This report checks all required tables and fields for the dashboard to function properly.</p>
        
        <?php
        $total_tables = count($required_tables);
        $tables_ok = 0;
        $tables_missing = 0;
        $fields_missing = [];
        
        echo "<h2>Required Tables Verification</h2>";
        echo "<table class='table'>";
        echo "<thead><tr>";
        echo "<th>Table Name</th>";
        echo "<th>Status</th>";
        echo "<th>Required Fields</th>";
        echo "<th>Details</th>";
        echo "</tr></thead>";
        echo "<tbody>";
        
        foreach ($required_tables as $table => $fields) {
            // Check if table exists
            $table_check = mysqli_query($conn, "SHOW TABLES LIKE '$table'");
            $table_exists = mysqli_num_rows($table_check) > 0;
            
            echo "<tr>";
            echo "<td><strong>$table</strong></td>";
            
            if ($table_exists) {
                // Check fields
                $missing_fields = [];
                foreach ($fields as $field) {
                    $field_check = mysqli_query($conn, "SHOW COLUMNS FROM `$table` LIKE '$field'");
                    if (mysqli_num_rows($field_check) == 0) {
                        $missing_fields[] = $field;
                    }
                }
                
                if (empty($missing_fields)) {
                    echo "<td><span class='status status-ok'>✓ OK</span></td>";
                    $tables_ok++;
                } else {
                    echo "<td><span class='status status-warning'>⚠ Missing Fields</span></td>";
                    $fields_missing[$table] = $missing_fields;
                }
                
                echo "<td class='field-list'>" . implode(', ', $fields) . "</td>";
                
                if (!empty($missing_fields)) {
                    echo "<td class='missing-fields'>Missing: " . implode(', ', $missing_fields) . "</td>";
                } else {
                    echo "<td>All fields present</td>";
                }
            } else {
                echo "<td><span class='status status-error'>✗ Missing</span></td>";
                echo "<td class='field-list'>" . implode(', ', $fields) . "</td>";
                echo "<td class='missing-fields'>Table does not exist</td>";
                $tables_missing++;
            }
            
            echo "</tr>";
        }
        
        echo "</tbody></table>";
        
        // Summary
        $tables_warning = count($fields_missing);
        echo "<div class='summary'>";
        echo "<h3>Summary</h3>";
        echo "<div class='summary-item'>✓ <strong>Tables OK:</strong> <span style='color: #2ecc71; font-size: 24px;'>$tables_ok</span> / $total_tables</div>";
        echo "<div class='summary-item'>⚠ <strong>Tables with Missing Fields:</strong> <span style='color: #f39c12; font-size: 24px;'>$tables_warning</span></div>";
        echo "<div class='summary-item'>✗ <strong>Tables Missing:</strong> <span style='color: #e74c3c; font-size: 24px;'>$tables_missing</span></div>";
        echo "</div>";
        
        // Optional Tables
        echo "<h2>Optional Tables (Not Critical)</h2>";
        echo "<table class='table'>";
        echo "<thead><tr>";
        echo "<th>Table Name</th>";
        echo "<th>Status</th>";
        echo "<th>Purpose</th>";
        echo "</tr></thead>";
        echo "<tbody>";
        
        foreach ($optional_tables as $table => $fields) {
            $table_check = mysqli_query($conn, "SHOW TABLES LIKE '$table'");
            $table_exists = mysqli_num_rows($table_check) > 0;
            
            echo "<tr>";
            echo "<td><strong>$table</strong></td>";
            
            if ($table_exists) {
                echo "<td><span class='status status-ok'>✓ Present</span></td>";
            } else {
                echo "<td><span class='status status-warning'>Not Found</span></td>";
            }
            
            // Add purpose description
            $purposes = [
                'rlp_acknowledgement' => 'RLP approval workflow tracking',
                'equipment_assign' => 'Equipment assignment history',
                'settings' => 'Application settings and configuration'
            ];
            echo "<td>" . ($purposes[$table] ?? 'Supporting data') . "</td>";
            echo "</tr>";
        }
        
        echo "</tbody></table>";
        
        // Recommendations
        if ($tables_missing > 0 || !empty($fields_missing)) {
            echo "<div class='note'>";
            echo "<h3>⚠️ Action Required</h3>";
            
            if ($tables_missing > 0) {
                echo "<p><strong>Missing Tables:</strong> Your database is missing $tables_missing required tables. ";
                echo "Please import the complete database schema or contact your database administrator.</p>";
            }
            
            if (!empty($fields_missing)) {
                echo "<p><strong>Missing Fields:</strong> Some tables are missing required fields. ";
                echo "This may cause errors in the dashboard. Consider running database migrations or updates.</p>";
                echo "<ul>";
                foreach ($fields_missing as $table => $fields) {
                    echo "<li><strong>$table:</strong> Missing fields: " . implode(', ', $fields) . "</li>";
                }
                echo "</ul>";
            }
            
            echo "</div>";
        } else {
            echo "<div class='note' style='background: #d4edda; border-color: #28a745;'>";
            echo "<h3>✅ Database Check Complete</h3>";
            echo "<p><strong>All required tables and fields are present!</strong> Your database is properly configured for the dashboard.</p>";
            echo "</div>";
        }
        
        // Additional Recommendations
        echo "<h2>Performance Recommendations</h2>";
        echo "<div class='note' style='background: #d1ecf1; border-color: #0c5460;'>";
        echo "<h3>Suggested Database Optimizations</h3>";
        echo "<ol>";
        echo "<li>Add indexes on frequently queried fields:";
        echo "<ul>";
        echo "<li>CREATE INDEX idx_ams_status ON ams_products(status);</li>";
        echo "<li>CREATE INDEX idx_ams_assign ON ams_products(assign_status);</li>";
        echo "<li>CREATE INDEX idx_rlp_status ON rlp_info(rlp_status, is_delete);</li>";
        echo "<li>CREATE INDEX idx_equip_status ON equipments(status);</li>";
        echo "<li>CREATE INDEX idx_rent_status ON rents(bill_status);</li>";
        echo "</ul></li>";
        echo "<li>Enable MySQL query cache for better performance</li>";
        echo "<li>Regular maintenance: Run OPTIMIZE TABLE on large tables monthly</li>";
        echo "<li>Consider archiving old data (> 2 years) to separate tables</li>";
        echo "</ol>";
        echo "</div>";
        
        // Connection Info
        echo "<h2>Database Connection Information</h2>";
        echo "<table class='table'>";
        echo "<tr><td><strong>Host:</strong></td><td>localhost</td></tr>";
        echo "<tr><td><strong>Database:</strong></td><td>inventory_rlp</td></tr>";
        echo "<tr><td><strong>Connection Status:</strong></td><td><span class='status status-ok'>Connected</span></td></tr>";
        echo "<tr><td><strong>MySQL Version:</strong></td><td>" . mysqli_get_server_info($conn) . "</td></tr>";
        echo "<tr><td><strong>Character Set:</strong></td><td>" . mysqli_character_set_name($conn) . "</td></tr>";
        echo "</table>";
        
        mysqli_close($conn);
        ?>
        
        <div style="margin-top: 30px; padding-top: 20px; border-top: 2px solid #ddd; text-align: center; color: #7f8c8d;">
            <p>Database Verification Script v1.0 | Generated: <?php echo date('Y-m-d H:i:s'); ?></p>
            <p><a href="dashboard.php" style="color: #3498db;">← Back to Dashboard</a></p>
        </div>
    </div>
</body>
</html>

