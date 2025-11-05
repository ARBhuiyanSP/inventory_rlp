# Warehouse Table Name Fix

## সমস্যা
Dashboard এ "Stock by Warehouse" chart এ data দেখাচ্ছিল না কারণ ভুল table name use করা হচ্ছিল।

## সমাধান

### ভুল Table Name (আগে):
```sql
FROM warehouse
LEFT JOIN warehouse w ON mb.warehouse_id = w.warehouse_id
```

### সঠিক Table Name (এখন):
```sql
FROM inv_warehosueinfo
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id
```

## Table Structure

### `inv_warehosueinfo` Table:
```sql
CREATE TABLE `inv_warehosueinfo` (
  `id` int(11) NOT NULL,
  `ware_hosue_id` int(11) NOT NULL,
  `ware_hosue_name` varchar(75) NOT NULL
)
```

### Fields Used:
- **Join Field**: `id` (warehouse এর unique identifier)
- **Name Field**: `ware_hosue_name` (warehouse এর name)

## Changes Made

### 1. dashboard.php
**Line 636-639**: Updated warehouse query
```sql
-- Before
LEFT JOIN warehouse w ON mb.warehouse_id = w.warehouse_id
COALESCE(w.warehouse_name, 'Not Assigned')

-- After
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id
COALESCE(w.ware_hosue_name, 'Not Assigned')
```

### 2. test_dashboard_data.php
**Updated in 3 places**:
1. Line 91-96: Test query
2. Line 164-167: Table structure check
3. Line 220-225: Test query example

## Verification

### Test করার জন্য SQL Query:
```sql
-- Check warehouse stock
SELECT 
    w.ware_hosue_name, 
    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
FROM inv_materialbalance mb 
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id 
GROUP BY mb.warehouse_id;
```

### Expected Result:
```
+------------------+-------------+
| ware_hosue_name  | stock_value |
+------------------+-------------+
| Main Warehouse   | 150000.00   |
| Store A          | 85000.00    |
| Store B          | 42000.00    |
+------------------+-------------+
```

## Testing Instructions

### Step 1: Refresh Dashboard
```
http://your-domain/dashboard.php
```
Chart এ এখন warehouse wise stock দেখাবে

### Step 2: Run Test Script
```
http://your-domain/test_dashboard_data.php
```
এটি দেখাবে:
- Warehouse wise stock breakdown
- Table structure verification
- Data availability check

## Common Issues & Solutions

### Issue 1: Still showing "No Data"
**Solution**: 
- Check if `inv_materialbalance` table এ `warehouse_id` field populate করা আছে কিনা
- Material receive করার সময় warehouse select করতে হবে

### Issue 2: Warehouse name showing NULL
**Solution**:
- Check if `inv_warehosueinfo` table এ warehouses আছে কিনা
- Verify JOIN condition: `mb.warehouse_id = w.id`

### Issue 3: Wrong warehouse names
**Solution**:
- Verify field name: `ware_hosue_name` (not `warehouse_name`)
- Check table name: `inv_warehosueinfo` (not `warehouse` or `inv_warehouse`)

## Database Schema Notes

### Important Points:
1. **Table Name**: `inv_warehosueinfo` (note: "warehosue" has a typo but that's the actual table name)
2. **Primary Key**: `id`
3. **Name Field**: `ware_hosue_name`
4. **Alternative ID**: `ware_hosue_id` (may not be used in all places)

### JOIN Logic:
```sql
inv_materialbalance.warehouse_id = inv_warehosueinfo.id
```

## Files Modified

| File | Changes | Status |
|------|---------|--------|
| dashboard.php | Updated warehouse query | ✅ Fixed |
| test_dashboard_data.php | Updated test queries | ✅ Fixed |

## Performance Impact
- **Query Performance**: No impact (same JOIN complexity)
- **Memory Usage**: No change
- **Load Time**: No change

## Before & After

### Before:
- ❌ Chart showing "No Data"
- ❌ Wrong table name: `warehouse`
- ❌ Wrong field name: `warehouse_name`
- ❌ SQL Error: Table 'warehouse' doesn't exist

### After:
- ✅ Chart showing warehouse-wise stock
- ✅ Correct table name: `inv_warehosueinfo`
- ✅ Correct field name: `ware_hosue_name`
- ✅ No SQL errors

## Related Tables

### Tables Used Together:
1. `inv_materialbalance` - Material stock data
2. `inv_warehosueinfo` - Warehouse master data
3. `projects` - Project master data

### Common Query Pattern:
```sql
SELECT 
    w.ware_hosue_name,
    p.project_name,
    SUM(mb.mbin_val - mb.mbout_val) as stock_value
FROM inv_materialbalance mb
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id
LEFT JOIN projects p ON mb.project_id = p.project_id
GROUP BY mb.warehouse_id, mb.project_id
```

## Future Recommendations

### 1. Database Normalization
Consider renaming for consistency:
```sql
-- Suggested rename (optional):
ALTER TABLE inv_warehosueinfo RENAME TO inv_warehouse;
ALTER TABLE inv_warehosueinfo CHANGE ware_hosue_name warehouse_name VARCHAR(75);
```

### 2. Add Indexes
For better performance:
```sql
ALTER TABLE inv_warehosueinfo ADD INDEX idx_id (id);
ALTER TABLE inv_materialbalance ADD INDEX idx_warehouse (warehouse_id);
```

### 3. Data Validation
Ensure referential integrity:
```sql
ALTER TABLE inv_materialbalance 
ADD FOREIGN KEY (warehouse_id) 
REFERENCES inv_warehosueinfo(id);
```

## Troubleshooting Commands

### Check if table exists:
```sql
SHOW TABLES LIKE 'inv_warehosueinfo';
```

### Check table structure:
```sql
DESCRIBE inv_warehosueinfo;
```

### Check warehouse data:
```sql
SELECT * FROM inv_warehosueinfo;
```

### Check materialbalance warehouse IDs:
```sql
SELECT DISTINCT warehouse_id 
FROM inv_materialbalance 
WHERE warehouse_id IS NOT NULL;
```

### Find orphaned records:
```sql
SELECT mb.warehouse_id, COUNT(*) as count
FROM inv_materialbalance mb
LEFT JOIN inv_warehosueinfo w ON mb.warehouse_id = w.id
WHERE w.id IS NULL AND mb.warehouse_id IS NOT NULL
GROUP BY mb.warehouse_id;
```

## Summary

✅ **Fixed**: Warehouse table name corrected from `warehouse` to `inv_warehosueinfo`  
✅ **Fixed**: Field name corrected from `warehouse_name` to `ware_hosue_name`  
✅ **Fixed**: JOIN condition corrected to use `id` field  
✅ **Tested**: No SQL errors  
✅ **Verified**: Charts now show warehouse-wise stock data  

---

**Fix Date**: November 5, 2025  
**Status**: ✅ RESOLVED  
**Version**: 1.2

