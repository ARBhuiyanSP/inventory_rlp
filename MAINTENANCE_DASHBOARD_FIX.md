# Maintenance Management Dashboard Fix

## Issue Description
The MAINTENANCE MANAGEMENT section on the dashboard was not showing data because it only queried the `maintenance_cost` table and ignored the `maintenance` and `maintenance_details` tables which contain scheduled maintenance data.

## Problem Analysis

The system has TWO sources of maintenance data:

### 1. **Scheduled Maintenance** (Preventive/Planned)
- **Tables**: `maintenance` + `maintenance_details`
- **Cost Calculation**: `qty * price` from `maintenance_details`
- **Equipment Link**: `equipment_id` in `maintenance` table
- **Date Field**: `lastseervice_date` in `maintenance` table

### 2. **Maintenance Cost** (Repairs/Unscheduled)
- **Tables**: `maintenance_cost` + `maintenance_spare_parts`
- **Cost Calculation**: `amount` from `maintenance_spare_parts`
- **Equipment Link**: `eel_code` in `maintenance_cost` table
- **Date Field**: `created_at` in `maintenance_cost` table

## Changes Made

### 1. **Total Maintenance Count** (Line 537-550)
**Before**: Only counted `maintenance_cost` entries
```php
$sql_maintenance_count = "SELECT COUNT(*) as total FROM `maintenance_cost`";
```

**After**: Counts BOTH sources
```php
// Count scheduled maintenance
$sql_scheduled_count = "SELECT COUNT(*) as total FROM `maintenance`";
// Count maintenance cost entries
$sql_mc_count = "SELECT COUNT(*) as total FROM `maintenance_cost`";
// Total = both sources combined
$maintenance_count = $scheduled_count + $mc_count;
```

### 2. **Total Maintenance Cost** (Line 552-565)
**Before**: Only used `total_cost` field from `maintenance_cost`
```php
$sql_maintenance_total = "SELECT SUM(total_cost) as total_cost FROM `maintenance_cost`";
```

**After**: Calculates from BOTH sources
```php
// Scheduled maintenance cost: qty * price from maintenance_details
$sql_scheduled_cost = "SELECT SUM(md.qty * md.price) as total_cost 
                       FROM `maintenance_details` md 
                       INNER JOIN `maintenance` m ON md.maintenance_id = m.id";

// Maintenance spare parts cost: amount from maintenance_spare_parts
$sql_spare_cost = "SELECT SUM(amount) as total_cost FROM `maintenance_spare_parts`";

// Total = both sources combined
$maintenance_cost = $scheduled_cost + $spare_cost;
```

### 3. **Monthly Maintenance Cost** (Line 567-587)
**Before**: Only checked `maintenance_cost` for current month
```php
$sql_month_cost = "SELECT SUM(total_cost) as total_cost FROM `maintenance_cost` 
                   WHERE DATE_FORMAT(created_at, '%Y-%m') = '$current_month'";
```

**After**: Includes BOTH sources for current month
```php
// This month scheduled maintenance
$sql_month_scheduled = "SELECT SUM(md.qty * md.price) as total_cost 
                        FROM `maintenance_details` md 
                        INNER JOIN `maintenance` m ON md.maintenance_id = m.id 
                        WHERE DATE_FORMAT(m.lastseervice_date, '%Y-%m') = '$current_month'";

// This month maintenance spare parts
$sql_month_spare = "SELECT SUM(msp.amount) as total_cost 
                    FROM `maintenance_spare_parts` msp 
                    INNER JOIN `maintenance_cost` mc ON msp.m_cost_id = mc.m_cost_id 
                    WHERE DATE_FORMAT(mc.created_at, '%Y-%m') = '$current_month'";

// Total = both sources combined
$month_cost = $month_scheduled_cost + $month_spare_cost;
```

### 4. **Top 10 Equipment Chart** (Line 820-884)
**Before**: Only showed equipment from `maintenance_cost` table
```php
$sql_top_equip = "SELECT e.eel_code, e.name, SUM(mc.total_cost) as total_cost 
                  FROM maintenance_cost mc 
                  LEFT JOIN equipments e ON mc.eel_code = e.eel_code 
                  GROUP BY mc.eel_code";
```

**After**: Combines costs from BOTH sources per equipment
```php
// Get costs from maintenance_spare_parts
$sql_spare_equip = "SELECT mc.eel_code, SUM(msp.amount) as total_cost
                    FROM maintenance_spare_parts msp
                    INNER JOIN maintenance_cost mc ON msp.m_cost_id = mc.m_cost_id
                    GROUP BY mc.eel_code";

// Get costs from maintenance_details
$sql_scheduled_equip = "SELECT m.equipment_id, SUM(md.qty * md.price) as total_cost
                        FROM maintenance_details md
                        INNER JOIN maintenance m ON md.maintenance_id = m.id
                        GROUP BY m.equipment_id";

// Combine both sources, sort by total cost, take top 10
```

### 5. **Monthly Maintenance Trend Chart** (Line 886-921)
**Before**: Only showed trend from `maintenance_cost`
```php
$sql_trend = "SELECT SUM(total_cost) as cost FROM maintenance_cost 
              WHERE DATE_FORMAT(created_at, '%Y-%m') = '$month'";
```

**After**: Shows combined trend from BOTH sources for each month
```php
// Get cost from maintenance_spare_parts
$sql_spare_trend = "SELECT SUM(msp.amount) as cost 
                    FROM maintenance_spare_parts msp 
                    INNER JOIN maintenance_cost mc ON msp.m_cost_id = mc.m_cost_id 
                    WHERE DATE_FORMAT(mc.created_at, '%Y-%m') = '$month'";

// Get cost from maintenance_details
$sql_scheduled_trend = "SELECT SUM(md.qty * md.price) as cost 
                        FROM maintenance_details md 
                        INNER JOIN maintenance m ON md.maintenance_id = m.id 
                        WHERE DATE_FORMAT(m.lastseervice_date, '%Y-%m') = '$month'";

// Combine for each month's data point
$total_cost = $spare_cost + $scheduled_cost;
```

## Impact

### ✅ Fixed Issues:
1. **Maintenance count** now includes scheduled maintenance entries
2. **Total cost** now reflects ALL maintenance activities (scheduled + unscheduled)
3. **Monthly cost** shows complete picture of current month expenses
4. **Top 10 Equipment chart** shows equipment with highest total maintenance costs from all sources
5. **Monthly trend chart** shows accurate historical maintenance spending

### 📊 Data Now Visible:
- Scheduled/preventive maintenance activities
- Spare parts costs from repairs
- Equipment maintenance history from both planned and unplanned work
- Complete cost tracking across all maintenance types

## Testing Recommendations

1. Verify scheduled maintenance entries appear in the count
2. Check that costs from `maintenance_details` are being calculated correctly (qty × price)
3. Confirm equipment IDs and eel_codes are properly linked
4. Validate monthly trends show data for months with only scheduled maintenance
5. Ensure Top 10 Equipment chart includes equipment from both maintenance types

## Database Schema Reference

### Key Tables:
- `maintenance` - Scheduled maintenance header
- `maintenance_details` - Scheduled maintenance line items (has `qty`, `price`)
- `maintenance_cost` - Maintenance cost header
- `maintenance_spare_parts` - Spare parts used (has `amount`)
- `equipments` - Equipment master data (has `eel_code`, `name`)

### Key Relationships:
- `maintenance.id` → `maintenance_details.maintenance_id`
- `maintenance_cost.m_cost_id` → `maintenance_spare_parts.m_cost_id`
- `maintenance.equipment_id` → `equipments.id` or `equipments.eel_code`
- `maintenance_cost.eel_code` → `equipments.eel_code`

## Files Modified
- `dashboard.php` - Main dashboard file (5 major sections updated)

## Notes
- All queries include proper error handling with null coalescing operators
- Queries use INNER JOIN to ensure data integrity
- Empty result sets are handled gracefully with default "No Data" entries
- Date formatting uses MySQL DATE_FORMAT for consistency

