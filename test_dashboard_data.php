<?php
/**
 * Dashboard Data Test Script
 * এই script টি run করলে দেখতে পারবেন dashboard এর জন্য কি data আছে
 */

include 'connection/connect.php';

echo "<!DOCTYPE html>
<html>
<head>
    <meta charset='UTF-8'>
    <title>Dashboard Data Test</title>
    <style>
        body { font-family: Arial; margin: 20px; background: #f5f5f5; }
        .section { background: white; padding: 20px; margin: 20px 0; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin: 10px 0; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background: #3498db; color: white; }
        .success { color: #27ae60; font-weight: bold; }
        .warning { color: #e67e22; font-weight: bold; }
        .error { color: #e74c3c; font-weight: bold; }
        .info { background: #ecf0f1; padding: 10px; border-left: 4px solid #3498db; margin: 10px 0; }
    </style>
</head>
<body>
    <h1>📊 Dashboard Data Test Report</h1>
    <p>Generated: " . date('Y-m-d H:i:s') . "</p>";

// Test 1: Stock Value
echo "<div class='section'>
    <h2>1. Stock Value Test</h2>";
$sql = "SELECT SUM(mbin_val - mbout_val) as total_value FROM `inv_materialbalance`";
$result = mysqli_query($conn, $sql);
if($result) {
    $row = mysqli_fetch_assoc($result);
    $value = $row['total_value'] ?? 0;
    echo "<p><strong>Total Stock Value:</strong> <span class='success'>৳" . number_format($value, 2) . "</span></p>";
    
    if($value == 0) {
        echo "<p class='warning'>⚠️ Stock value is 0. This might mean:</p>
              <ul>
                <li>No materials have been received yet</li>
                <li>All received materials have been issued</li>
                <li>Check if data exists in inv_materialbalance table</li>
              </ul>";
    }
} else {
    echo "<p class='error'>❌ Error: " . mysqli_error($conn) . "</p>";
}

// Test 2: Material Balance Count
$sql = "SELECT COUNT(*) as count FROM `inv_materialbalance`";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
echo "<p><strong>Material Balance Records:</strong> " . $row['count'] . "</p>";

// Test 3: Sample Data
$sql = "SELECT * FROM `inv_materialbalance` LIMIT 5";
$result = mysqli_query($conn, $sql);
if(mysqli_num_rows($result) > 0) {
    echo "<h3>Sample Material Balance Data:</h3>
          <table>
          <tr>
            <th>Material ID</th>
            <th>Received Qty</th>
            <th>Received Value</th>
            <th>Issued Qty</th>
            <th>Issued Value</th>
            <th>Balance Value</th>
          </tr>";
    while($row = mysqli_fetch_assoc($result)) {
        $balance = $row['mbin_val'] - $row['mbout_val'];
        echo "<tr>
                <td>{$row['mb_materialid']}</td>
                <td>{$row['mbin_qty']}</td>
                <td>৳" . number_format($row['mbin_val'], 2) . "</td>
                <td>{$row['mbout_qty']}</td>
                <td>৳" . number_format($row['mbout_val'], 2) . "</td>
                <td>৳" . number_format($balance, 2) . "</td>
              </tr>";
    }
    echo "</table>";
}
echo "</div>";

// Test 4: Warehouse Stock
echo "<div class='section'>
    <h2>2. Stock by Warehouse Test</h2>";
$sql = "SELECT 
            COALESCE(w.name, 'Not Assigned') as warehouse_name, 
            COUNT(*) as record_count,
            SUM(mb.mbin_val - mb.mbout_val) as stock_value 
        FROM inv_materialbalance mb 
        LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id 
        GROUP BY mb.warehouse_id";
$result = mysqli_query($conn, $sql);
if($result && mysqli_num_rows($result) > 0) {
    echo "<table>
          <tr>
            <th>Warehouse</th>
            <th>Records</th>
            <th>Stock Value</th>
          </tr>";
    while($row = mysqli_fetch_assoc($result)) {
        $status = $row['stock_value'] > 0 ? 'success' : 'warning';
        echo "<tr>
                <td>{$row['warehouse_name']}</td>
                <td>{$row['record_count']}</td>
                <td class='$status'>৳" . number_format($row['stock_value'], 2) . "</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "<p class='warning'>⚠️ No warehouse data found or query failed</p>";
    if(!$result) {
        echo "<p class='error'>Error: " . mysqli_error($conn) . "</p>";
    }
}
echo "</div>";

// Test 5: Project Stock
echo "<div class='section'>
    <h2>3. Stock by Project Test</h2>";
$sql = "SELECT 
            COALESCE(p.project_name, 'Not Assigned') as project_name, 
            COUNT(*) as record_count,
            SUM(mb.mbin_val - mb.mbout_val) as stock_value 
        FROM inv_materialbalance mb 
        LEFT JOIN projects p ON mb.project_id = p.project_id 
        GROUP BY mb.project_id
        ORDER BY stock_value DESC
        LIMIT 10";
$result = mysqli_query($conn, $sql);
if($result && mysqli_num_rows($result) > 0) {
    echo "<table>
          <tr>
            <th>Project</th>
            <th>Records</th>
            <th>Stock Value</th>
          </tr>";
    while($row = mysqli_fetch_assoc($result)) {
        $status = $row['stock_value'] > 0 ? 'success' : 'warning';
        echo "<tr>
                <td>{$row['project_name']}</td>
                <td>{$row['record_count']}</td>
                <td class='$status'>৳" . number_format($row['stock_value'], 2) . "</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "<p class='warning'>⚠️ No project data found or query failed</p>";
    if(!$result) {
        echo "<p class='error'>Error: " . mysqli_error($conn) . "</p>";
    }
}
echo "</div>";

// Test 6: Table Structure Check
echo "<div class='section'>
    <h2>4. Database Structure Check</h2>";

$tables = [
    'inv_materialbalance' => ['mb_materialid', 'mbin_val', 'mbout_val', 'warehouse_id', 'project_id'],
    'inv_warehosueinfo' => ['id', 'warehouse_id', 'name'],
    'projects' => ['id', 'project_name']
];

foreach($tables as $table => $fields) {
    echo "<h3>Table: $table</h3>";
    
    // Check if table exists
    $result = mysqli_query($conn, "SHOW TABLES LIKE '$table'");
    if(mysqli_num_rows($result) > 0) {
        echo "<p class='success'>✓ Table exists</p>";
        
        // Check fields
        echo "<p><strong>Required Fields:</strong></p><ul>";
        foreach($fields as $field) {
            $result = mysqli_query($conn, "SHOW COLUMNS FROM `$table` LIKE '$field'");
            if(mysqli_num_rows($result) > 0) {
                echo "<li class='success'>✓ $field</li>";
            } else {
                echo "<li class='error'>✗ $field (MISSING)</li>";
            }
        }
        echo "</ul>";
        
        // Count records
        $result = mysqli_query($conn, "SELECT COUNT(*) as count FROM `$table`");
        $row = mysqli_fetch_assoc($result);
        echo "<p><strong>Total Records:</strong> {$row['count']}</p>";
        
    } else {
        echo "<p class='error'>✗ Table does not exist</p>";
    }
}
echo "</div>";

// Test 7: Recommendations
echo "<div class='section'>
    <h2>5. Recommendations</h2>
    <div class='info'>
        <h3>যদি Charts এ data না দেখায়:</h3>
        <ol>
            <li><strong>Material Receive করুন:</strong> যদি কোনো material receive না করা হয় তাহলে stock 0 দেখাবে</li>
            <li><strong>Warehouse & Project Assign করুন:</strong> Material receive করার সময় warehouse এবং project select করতে হবে</li>
            <li><strong>Data Check করুন:</strong> উপরের tables গুলোতে data আছে কিনা check করুন</li>
            <li><strong>Query Test করুন:</strong> MySQL তে directly query run করে দেখুন:</li>
        </ol>
        
        <h3>Test Queries:</h3>
        <pre style='background: #2c3e50; color: #ecf0f1; padding: 15px; border-radius: 5px; overflow-x: auto;'>
-- Check total stock value
SELECT SUM(mbin_val - mbout_val) as stock_value 
FROM inv_materialbalance;

-- Check warehouse-wise stock
SELECT 
    w.name as warehouse_name, 
    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
FROM inv_materialbalance mb 
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id 
GROUP BY mb.warehouse_id;

-- Check project-wise stock
SELECT 
    p.project_name, 
    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
FROM inv_materialbalance mb 
LEFT JOIN projects p ON mb.project_id = p.project_id 
GROUP BY mb.project_id;
        </pre>
    </div>
</div>";

echo "<div class='section'>
    <h2>✅ Test Complete</h2>
    <p><a href='dashboard.php' style='background: #3498db; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; display: inline-block;'>← Back to Dashboard</a></p>
</div>";

echo "</body></html>";

mysqli_close($conn);
?>

