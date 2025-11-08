<?php
/**
 * Test Script for Maintenance Dashboard Fix
 * This script tests all the maintenance queries to verify data is showing correctly
 */

include 'connection/connect.php';

echo "<h1>Maintenance Dashboard Data Test</h1>";
echo "<style>
    body { font-family: Arial, sans-serif; padding: 20px; }
    h2 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 5px; }
    h3 { color: #34495e; }
    .section { margin: 20px 0; padding: 15px; background: #ecf0f1; border-radius: 5px; }
    .success { color: #27ae60; font-weight: bold; }
    .warning { color: #e67e22; font-weight: bold; }
    .error { color: #e74c3c; font-weight: bold; }
    table { border-collapse: collapse; width: 100%; margin: 10px 0; }
    th, td { border: 1px solid #bdc3c7; padding: 8px; text-align: left; }
    th { background: #3498db; color: white; }
    tr:nth-child(even) { background: #f8f9fa; }
</style>";

// Test 1: Scheduled Maintenance Count
echo "<div class='section'>";
echo "<h2>Test 1: Scheduled Maintenance Count</h2>";
$sql_scheduled_count = "SELECT COUNT(*) as total FROM `maintenance`";
$result = mysqli_query($conn, $sql_scheduled_count);
if($result && $row = mysqli_fetch_assoc($result)) {
    $count = $row['total'];
    echo "<p>Scheduled Maintenance Entries: <span class='".($count > 0 ? 'success' : 'warning')."'>$count</span></p>";
    
    // Show sample data
    if($count > 0) {
        $sql_sample = "SELECT id, equipment_id, lastseervice_date FROM `maintenance` LIMIT 5";
        $result_sample = mysqli_query($conn, $sql_sample);
        echo "<h3>Sample Scheduled Maintenance Records:</h3>";
        echo "<table><tr><th>ID</th><th>Equipment ID</th><th>Last Service Date</th></tr>";
        while($row_sample = mysqli_fetch_assoc($result_sample)) {
            echo "<tr><td>{$row_sample['id']}</td><td>{$row_sample['equipment_id']}</td><td>{$row_sample['lastseervice_date']}</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p class='error'>Query failed: " . mysqli_error($conn) . "</p>";
}
echo "</div>";

// Test 2: Maintenance Cost Count
echo "<div class='section'>";
echo "<h2>Test 2: Maintenance Cost Count</h2>";
$sql_mc_count = "SELECT COUNT(*) as total FROM `maintenance_cost`";
$result = mysqli_query($conn, $sql_mc_count);
if($result && $row = mysqli_fetch_assoc($result)) {
    $count = $row['total'];
    echo "<p>Maintenance Cost Entries: <span class='".($count > 0 ? 'success' : 'warning')."'>$count</span></p>";
    
    // Show sample data
    if($count > 0) {
        $sql_sample = "SELECT m_cost_id, eel_code, created_at FROM `maintenance_cost` LIMIT 5";
        $result_sample = mysqli_query($conn, $sql_sample);
        echo "<h3>Sample Maintenance Cost Records:</h3>";
        echo "<table><tr><th>M Cost ID</th><th>EEL Code</th><th>Created At</th></tr>";
        while($row_sample = mysqli_fetch_assoc($result_sample)) {
            echo "<tr><td>{$row_sample['m_cost_id']}</td><td>{$row_sample['eel_code']}</td><td>{$row_sample['created_at']}</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p class='error'>Query failed: " . mysqli_error($conn) . "</p>";
}
echo "</div>";

// Test 3: Scheduled Maintenance Cost
echo "<div class='section'>";
echo "<h2>Test 3: Scheduled Maintenance Cost Calculation</h2>";
$sql_scheduled_cost = "SELECT SUM(md.qty * md.price) as total_cost, COUNT(*) as detail_count
                       FROM `maintenance_details` md 
                       INNER JOIN `maintenance` m ON md.maintenance_id = m.id";
$result = mysqli_query($conn, $sql_scheduled_cost);
if($result && $row = mysqli_fetch_assoc($result)) {
    $cost = $row['total_cost'] ?? 0;
    $detail_count = $row['detail_count'];
    echo "<p>Maintenance Details Records: <span class='".($detail_count > 0 ? 'success' : 'warning')."'>$detail_count</span></p>";
    echo "<p>Total Scheduled Maintenance Cost: <span class='success'>৳" . number_format($cost, 2) . "</span></p>";
    
    // Show sample calculations
    if($detail_count > 0) {
        $sql_sample = "SELECT md.id, md.maintenance_id, md.qty, md.price, (md.qty * md.price) as cost 
                       FROM `maintenance_details` md LIMIT 5";
        $result_sample = mysqli_query($conn, $sql_sample);
        echo "<h3>Sample Cost Calculations (qty × price):</h3>";
        echo "<table><tr><th>ID</th><th>Maintenance ID</th><th>Qty</th><th>Price</th><th>Cost</th></tr>";
        while($row_sample = mysqli_fetch_assoc($result_sample)) {
            echo "<tr><td>{$row_sample['id']}</td><td>{$row_sample['maintenance_id']}</td><td>{$row_sample['qty']}</td><td>৳{$row_sample['price']}</td><td>৳" . number_format($row_sample['cost'], 2) . "</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p class='error'>Query failed: " . mysqli_error($conn) . "</p>";
}
echo "</div>";

// Test 4: Spare Parts Cost
echo "<div class='section'>";
echo "<h2>Test 4: Maintenance Spare Parts Cost</h2>";
$sql_spare_cost = "SELECT SUM(amount) as total_cost, COUNT(*) as parts_count FROM `maintenance_spare_parts`";
$result = mysqli_query($conn, $sql_spare_cost);
if($result && $row = mysqli_fetch_assoc($result)) {
    $cost = $row['total_cost'] ?? 0;
    $parts_count = $row['parts_count'];
    echo "<p>Spare Parts Records: <span class='".($parts_count > 0 ? 'success' : 'warning')."'>$parts_count</span></p>";
    echo "<p>Total Spare Parts Cost: <span class='success'>৳" . number_format($cost, 2) . "</span></p>";
    
    // Show sample data
    if($parts_count > 0) {
        $sql_sample = "SELECT msp.id, msp.m_cost_id, msp.spare_parts_name, msp.qty, msp.rate, msp.amount 
                       FROM `maintenance_spare_parts` msp LIMIT 5";
        $result_sample = mysqli_query($conn, $sql_sample);
        echo "<h3>Sample Spare Parts Records:</h3>";
        echo "<table><tr><th>ID</th><th>M Cost ID</th><th>Spare Part</th><th>Qty</th><th>Rate</th><th>Amount</th></tr>";
        while($row_sample = mysqli_fetch_assoc($result_sample)) {
            echo "<tr><td>{$row_sample['id']}</td><td>{$row_sample['m_cost_id']}</td><td>{$row_sample['spare_parts_name']}</td><td>{$row_sample['qty']}</td><td>৳{$row_sample['rate']}</td><td>৳" . number_format($row_sample['amount'], 2) . "</td></tr>";
        }
        echo "</table>";
    }
} else {
    echo "<p class='error'>Query failed: " . mysqli_error($conn) . "</p>";
}
echo "</div>";

// Test 5: Combined Total Cost
echo "<div class='section'>";
echo "<h2>Test 5: Combined Total Maintenance Cost</h2>";
$sql_scheduled = "SELECT SUM(md.qty * md.price) as total_cost FROM `maintenance_details` md INNER JOIN `maintenance` m ON md.maintenance_id = m.id";
$sql_spare = "SELECT SUM(amount) as total_cost FROM `maintenance_spare_parts`";

$result_scheduled = mysqli_query($conn, $sql_scheduled);
$result_spare = mysqli_query($conn, $sql_spare);

$scheduled_cost = 0;
$spare_cost = 0;

if($result_scheduled && $row = mysqli_fetch_assoc($result_scheduled)) {
    $scheduled_cost = $row['total_cost'] ?? 0;
}
if($result_spare && $row = mysqli_fetch_assoc($result_spare)) {
    $spare_cost = $row['total_cost'] ?? 0;
}

$total_cost = $scheduled_cost + $spare_cost;

echo "<p>Scheduled Maintenance Cost: <span class='success'>৳" . number_format($scheduled_cost, 2) . "</span></p>";
echo "<p>Spare Parts Cost: <span class='success'>৳" . number_format($spare_cost, 2) . "</span></p>";
echo "<p><strong>TOTAL MAINTENANCE COST: <span class='success'>৳" . number_format($total_cost, 2) . "</span></strong></p>";
echo "</div>";

// Test 6: Current Month Cost
echo "<div class='section'>";
echo "<h2>Test 6: Current Month Maintenance Cost</h2>";
$current_month = date('Y-m');
echo "<p>Current Month: <strong>" . date('F Y') . "</strong></p>";

$sql_month_scheduled = "SELECT SUM(md.qty * md.price) as total_cost 
                        FROM `maintenance_details` md 
                        INNER JOIN `maintenance` m ON md.maintenance_id = m.id 
                        WHERE DATE_FORMAT(m.lastseervice_date, '%Y-%m') = '$current_month'";
$sql_month_spare = "SELECT SUM(msp.amount) as total_cost 
                    FROM `maintenance_spare_parts` msp 
                    INNER JOIN `maintenance_cost` mc ON msp.m_cost_id = mc.m_cost_id 
                    WHERE DATE_FORMAT(mc.created_at, '%Y-%m') = '$current_month'";

$result_month_scheduled = mysqli_query($conn, $sql_month_scheduled);
$result_month_spare = mysqli_query($conn, $sql_month_spare);

$month_scheduled_cost = 0;
$month_spare_cost = 0;

if($result_month_scheduled && $row = mysqli_fetch_assoc($result_month_scheduled)) {
    $month_scheduled_cost = $row['total_cost'] ?? 0;
}
if($result_month_spare && $row = mysqli_fetch_assoc($result_month_spare)) {
    $month_spare_cost = $row['total_cost'] ?? 0;
}

$month_total = $month_scheduled_cost + $month_spare_cost;

echo "<p>This Month Scheduled Cost: <span class='".($month_scheduled_cost > 0 ? 'success' : 'warning')."'>৳" . number_format($month_scheduled_cost, 2) . "</span></p>";
echo "<p>This Month Spare Parts Cost: <span class='".($month_spare_cost > 0 ? 'success' : 'warning')."'>৳" . number_format($month_spare_cost, 2) . "</span></p>";
echo "<p><strong>THIS MONTH TOTAL: <span class='".($month_total > 0 ? 'success' : 'warning')."'>৳" . number_format($month_total, 2) . "</span></strong></p>";
echo "</div>";

// Test 7: Equipment Cost Summary
echo "<div class='section'>";
echo "<h2>Test 7: Top Equipment by Maintenance Cost</h2>";

// Get equipment costs from both sources
$equipment_costs = [];

$sql_spare_equip = "SELECT mc.eel_code, SUM(msp.amount) as total_cost
                    FROM maintenance_spare_parts msp
                    INNER JOIN maintenance_cost mc ON msp.m_cost_id = mc.m_cost_id
                    WHERE mc.eel_code IS NOT NULL AND mc.eel_code != ''
                    GROUP BY mc.eel_code";
$result_spare_equip = mysqli_query($conn, $sql_spare_equip);
if($result_spare_equip) {
    while($row = mysqli_fetch_assoc($result_spare_equip)) {
        $equipment_costs[$row['eel_code']] = $row['total_cost'] ?? 0;
    }
}

$sql_scheduled_equip = "SELECT m.equipment_id, SUM(md.qty * md.price) as total_cost
                        FROM maintenance_details md
                        INNER JOIN maintenance m ON md.maintenance_id = m.id
                        WHERE m.equipment_id IS NOT NULL AND m.equipment_id != ''
                        GROUP BY m.equipment_id";
$result_scheduled_equip = mysqli_query($conn, $sql_scheduled_equip);
if($result_scheduled_equip) {
    while($row = mysqli_fetch_assoc($result_scheduled_equip)) {
        $equipment_id = $row['equipment_id'];
        if(!isset($equipment_costs[$equipment_id])) {
            $equipment_costs[$equipment_id] = 0;
        }
        $equipment_costs[$equipment_id] += $row['total_cost'] ?? 0;
    }
}

arsort($equipment_costs);
$top_equipment = array_slice($equipment_costs, 0, 10, true);

echo "<p>Equipment with Maintenance Costs: <span class='".(!empty($equipment_costs) ? 'success' : 'warning')."'>" . count($equipment_costs) . "</span></p>";

if(!empty($top_equipment)) {
    echo "<h3>Top 10 Equipment by Maintenance Cost:</h3>";
    echo "<table><tr><th>Rank</th><th>Equipment Code/ID</th><th>Equipment Name</th><th>Total Cost</th></tr>";
    $rank = 1;
    foreach($top_equipment as $eel_code => $cost) {
        $sql_name = "SELECT name, eel_code FROM equipments WHERE eel_code = '$eel_code' OR id = '$eel_code' LIMIT 1";
        $result_name = mysqli_query($conn, $sql_name);
        $equipment_name = 'Unknown';
        if($result_name && $row_name = mysqli_fetch_assoc($result_name)) {
            $equipment_name = $row_name['name'];
        }
        echo "<tr><td>$rank</td><td>$eel_code</td><td>$equipment_name</td><td>৳" . number_format($cost, 2) . "</td></tr>";
        $rank++;
    }
    echo "</table>";
} else {
    echo "<p class='warning'>No equipment maintenance cost data found</p>";
}
echo "</div>";

// Summary
echo "<div class='section' style='background: #2c3e50; color: white;'>";
echo "<h2 style='color: white; border-color: white;'>Summary</h2>";
$scheduled_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) as total FROM `maintenance`"))['total'] ?? 0;
$mc_count = mysqli_fetch_assoc(mysqli_query($conn, "SELECT COUNT(*) as total FROM `maintenance_cost`"))['total'] ?? 0;
$total_count = $scheduled_count + $mc_count;

echo "<h3>Total Maintenance Records: $total_count</h3>";
echo "<ul>";
echo "<li>Scheduled Maintenance: $scheduled_count</li>";
echo "<li>Maintenance Cost: $mc_count</li>";
echo "</ul>";

echo "<h3>Total Maintenance Cost: ৳" . number_format($total_cost, 2) . "</h3>";
echo "<ul>";
echo "<li>From Scheduled Maintenance: ৳" . number_format($scheduled_cost, 2) . "</li>";
echo "<li>From Spare Parts: ৳" . number_format($spare_cost, 2) . "</li>";
echo "</ul>";

if($total_count > 0 && $total_cost > 0) {
    echo "<p class='success' style='font-size: 18px;'>✓ Dashboard should now show maintenance data correctly!</p>";
} else {
    echo "<p class='warning' style='font-size: 18px;'>⚠ No maintenance data found in database. Add some maintenance records to see data on dashboard.</p>";
}
echo "</div>";

mysqli_close($conn);
?>

