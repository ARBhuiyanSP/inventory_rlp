-- ============================================
-- DASHBOARD USEFUL SQL QUERIES
-- Collection of helpful queries for data analysis and troubleshooting
-- ============================================

-- ============================================
-- ASSET MANAGEMENT QUERIES
-- ============================================

-- 1. Get all assets by category with status
SELECT 
    ac.assets_category,
    COUNT(ap.id) as total_assets,
    SUM(CASE WHEN ap.assign_status = 'assigned' THEN 1 ELSE 0 END) as assigned,
    SUM(CASE WHEN ap.assign_status != 'assigned' THEN 1 ELSE 0 END) as available
FROM assets_categories ac
LEFT JOIN ams_products ap ON ac.assets_id = ap.assets_category
WHERE ap.status = 'active'
GROUP BY ac.assets_id, ac.assets_category
ORDER BY total_assets DESC;

-- 2. Assets due for service (example: not serviced in 6 months)
SELECT 
    ap.sl_no,
    ap.item_name,
    ap.model,
    MAX(s.handover_date) as last_service_date,
    DATEDIFF(NOW(), MAX(s.handover_date)) as days_since_service
FROM ams_products ap
LEFT JOIN inv_services s ON ap.id = s.assets_id
GROUP BY ap.id
HAVING days_since_service > 180 OR days_since_service IS NULL
ORDER BY days_since_service DESC;

-- 3. Most frequently serviced assets
SELECT 
    ap.sl_no,
    ap.item_name,
    ap.model,
    COUNT(s.id) as service_count,
    MAX(s.handover_date) as last_service
FROM ams_products ap
INNER JOIN inv_services s ON ap.id = s.assets_id
GROUP BY ap.id
ORDER BY service_count DESC
LIMIT 10;

-- ============================================
-- PROCUREMENT QUERIES
-- ============================================

-- 4. RLP approval timeline analysis
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') as month,
    COUNT(*) as total_rlps,
    SUM(CASE WHEN rlp_status = 1 THEN 1 ELSE 0 END) as approved,
    SUM(CASE WHEN rlp_status != 1 THEN 1 ELSE 0 END) as pending,
    ROUND(SUM(CASE WHEN rlp_status = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as approval_rate
FROM rlp_info
WHERE is_delete = 0
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY month DESC
LIMIT 12;

-- 5. Notesheet processing time (if timestamps available)
SELECT 
    ns_no,
    notesheet_date,
    created_at,
    updated_at,
    TIMESTAMPDIFF(DAY, created_at, updated_at) as processing_days,
    notesheet_status
FROM notesheets_master
WHERE notesheet_status = 1
  AND updated_at IS NOT NULL
ORDER BY processing_days DESC
LIMIT 20;

-- 6. Work Order completion statistics
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') as month,
    COUNT(*) as total_wo,
    SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) as completed,
    SUM(CASE WHEN status != 1 THEN 1 ELSE 0 END) as pending
FROM workorders_master
WHERE is_delete = 0
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY month DESC
LIMIT 6;

-- ============================================
-- INVENTORY QUERIES
-- ============================================

-- 7. Current stock value by warehouse
SELECT 
    w.warehouse_name,
    COUNT(DISTINCT mb.mb_materialid) as unique_materials,
    SUM(mb.mbin_val - mb.mbout_val) as stock_value
FROM inv_materialbalance mb
LEFT JOIN warehouse w ON mb.warehouse_id = w.warehouse_id
GROUP BY mb.warehouse_id, w.warehouse_name
ORDER BY stock_value DESC;

-- 8. Current stock value by project
SELECT 
    p.project_name,
    COUNT(DISTINCT mb.mb_materialid) as unique_materials,
    SUM(mb.mbin_val - mb.mbout_val) as stock_value
FROM inv_materialbalance mb
LEFT JOIN projects p ON mb.project_id = p.project_id
GROUP BY mb.project_id, p.project_name
ORDER BY stock_value DESC;

-- 9. Low stock materials (current balance < minimum threshold)
SELECT 
    material_id_code,
    material_name,
    current_balance,
    rate,
    (current_balance * rate) as stock_value,
    unit
FROM inv_material
WHERE current_balance < 10  -- Adjust threshold as needed
ORDER BY stock_value DESC;

-- 10. Most frequently issued materials
SELECT 
    m.material_id_code,
    m.material_name,
    COUNT(id.id) as issue_count,
    SUM(id.issue_qty) as total_issued,
    m.unit
FROM inv_issuedetail id
LEFT JOIN inv_material m ON id.material_id = m.material_id_code
GROUP BY id.material_id
ORDER BY issue_count DESC
LIMIT 20;

-- 11. Material movement summary (last 30 days)
SELECT 
    m.material_id_code,
    m.material_name,
    SUM(CASE WHEN mb.mbtype = 'Receive' THEN mb.mbin_qty ELSE 0 END) as received,
    SUM(CASE WHEN mb.mbtype = 'Issue' THEN mb.mbout_qty ELSE 0 END) as issued,
    m.current_balance
FROM inv_materialbalance mb
LEFT JOIN inv_material m ON mb.mb_materialid = m.material_id_code
WHERE mb.mb_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY mb.mb_materialid
ORDER BY received DESC, issued DESC;

-- ============================================
-- EQUIPMENT QUERIES
-- ============================================

-- 12. Equipment utilization by status
SELECT 
    status,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM equipments), 2) as percentage
FROM equipments
GROUP BY status
ORDER BY count DESC;

-- 13. Equipment by type and location
SELECT 
    et.type_name,
    e.present_location,
    COUNT(*) as equipment_count,
    e.status
FROM equipments e
LEFT JOIN equipment_type et ON e.equipment_type = et.id
GROUP BY e.equipment_type, e.present_location, e.status
ORDER BY equipment_count DESC;

-- 14. Equipment inspection history
SELECT 
    e.eel_code,
    e.name,
    i.ins_date as last_inspection,
    i.status as inspection_status,
    DATEDIFF(NOW(), i.ins_date) as days_since_inspection
FROM equipments e
LEFT JOIN (
    SELECT eel_code, MAX(ins_date) as ins_date, status
    FROM inspaction
    GROUP BY eel_code
) i ON e.eel_code = i.eel_code
ORDER BY days_since_inspection DESC;

-- 15. Equipment never inspected
SELECT 
    eel_code,
    name,
    equipment_type,
    commissioning_date,
    DATEDIFF(NOW(), commissioning_date) as days_without_inspection
FROM equipments e
WHERE NOT EXISTS (
    SELECT 1 FROM inspaction i WHERE i.eel_code = e.eel_code
)
ORDER BY commissioning_date ASC;

-- ============================================
-- MAINTENANCE QUERIES
-- ============================================

-- 16. Top 10 equipment by maintenance cost
SELECT 
    e.eel_code,
    e.name,
    COUNT(mc.id) as maintenance_count,
    SUM(mc.total_cost) as total_cost,
    AVG(mc.total_cost) as avg_cost,
    MAX(mc.in_time) as last_maintenance
FROM maintenance_cost mc
LEFT JOIN equipments e ON mc.eel_code = e.eel_code
GROUP BY mc.eel_code
ORDER BY total_cost DESC
LIMIT 10;

-- 17. Monthly maintenance cost trend
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') as month,
    COUNT(*) as maintenance_count,
    SUM(total_cost) as total_cost,
    AVG(total_cost) as avg_cost,
    MIN(total_cost) as min_cost,
    MAX(total_cost) as max_cost
FROM maintenance_cost
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY month DESC
LIMIT 12;

-- 18. Most used spare parts in maintenance
SELECT 
    msp.material_id,
    msp.material_name,
    COUNT(msp.id) as usage_count,
    SUM(msp.quantity) as total_quantity,
    SUM(msp.unit_price * msp.quantity) as total_cost
FROM maintenance_spare_parts msp
GROUP BY msp.material_id
ORDER BY total_cost DESC
LIMIT 20;

-- 19. Maintenance cost by project
SELECT 
    p.project_name,
    COUNT(mc.id) as maintenance_count,
    SUM(mc.total_cost) as total_cost
FROM maintenance_cost mc
LEFT JOIN projects p ON mc.project_id = p.project_id
GROUP BY mc.project_id
ORDER BY total_cost DESC;

-- 20. Mechanic workload analysis
SELECT 
    mm.mechanic_name,
    COUNT(DISTINCT mm.m_cost_id) as jobs_assigned,
    SUM(mc.total_cost) as total_job_value
FROM maintenance_mechanic mm
LEFT JOIN maintenance_cost mc ON mm.m_cost_id = mc.m_cost_id
GROUP BY mm.mechanic_name
ORDER BY jobs_assigned DESC;

-- ============================================
-- RENTAL QUERIES
-- ============================================

-- 21. Rental revenue by client
SELECT 
    c.name as client_name,
    COUNT(r.id) as rental_count,
    SUM(r.invoiceable_amount) as total_revenue,
    SUM(r.deposit_amount) as collected,
    SUM(r.due_amount) as outstanding
FROM rents r
LEFT JOIN clients c ON r.client_name = c.client_id
GROUP BY r.client_name
ORDER BY total_revenue DESC;

-- 22. Most rented equipment
SELECT 
    e.eel_code,
    e.name,
    COUNT(rh.id) as rental_count,
    SUM(rh.amount) as total_revenue,
    MAX(rh.rent_date) as last_rented
FROM rent_history rh
LEFT JOIN equipments e ON rh.eel_code = e.eel_code
GROUP BY rh.eel_code
ORDER BY rental_count DESC
LIMIT 10;

-- 23. Rental payment collection efficiency
SELECT 
    DATE_FORMAT(created_at, '%Y-%m') as month,
    SUM(invoiceable_amount) as total_invoiced,
    SUM(deposit_amount) as total_collected,
    SUM(due_amount) as total_due,
    ROUND(SUM(deposit_amount) * 100.0 / SUM(invoiceable_amount), 2) as collection_rate
FROM rents
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY month DESC
LIMIT 12;

-- 24. Overdue rental payments (pending > 30 days)
SELECT 
    r.challan_no,
    c.name as client_name,
    r.created_at as rental_date,
    r.due_amount,
    DATEDIFF(NOW(), r.created_at) as days_overdue,
    r.bill_status
FROM rents r
LEFT JOIN clients c ON r.client_name = c.client_id
WHERE r.bill_status = 'Pending'
  AND DATEDIFF(NOW(), r.created_at) > 30
ORDER BY days_overdue DESC;

-- 25. Invoice status summary
SELECT 
    status,
    COUNT(*) as invoice_count,
    SUM(amount) as total_amount,
    SUM(deposit_amount) as collected_amount,
    SUM(due_amount) as pending_amount
FROM rent_invoice
GROUP BY status
ORDER BY invoice_count DESC;

-- ============================================
-- FINANCIAL SUMMARY QUERIES
-- ============================================

-- 26. Overall financial summary
SELECT 
    'Inventory Value' as metric,
    CONCAT('৳', FORMAT(SUM(current_balance * rate), 2)) as value
FROM inv_material
UNION ALL
SELECT 
    'Maintenance Cost (Total)',
    CONCAT('৳', FORMAT(SUM(total_cost), 2))
FROM maintenance_cost
UNION ALL
SELECT 
    'Rental Revenue (Total)',
    CONCAT('৳', FORMAT(SUM(invoiceable_amount), 2))
FROM rents
UNION ALL
SELECT 
    'Rental Collection',
    CONCAT('৳', FORMAT(SUM(deposit_amount), 2))
FROM rents
UNION ALL
SELECT 
    'Rental Outstanding',
    CONCAT('৳', FORMAT(SUM(due_amount), 2))
FROM rents
WHERE bill_status = 'Pending';

-- 27. Monthly financial trend (last 6 months)
SELECT 
    DATE_FORMAT(month_date, '%Y-%m') as month,
    SUM(maintenance_cost) as maintenance,
    SUM(rental_revenue) as rental_revenue,
    SUM(rental_collection) as rental_collection
FROM (
    SELECT created_at as month_date, total_cost as maintenance_cost, 0 as rental_revenue, 0 as rental_collection
    FROM maintenance_cost
    UNION ALL
    SELECT created_at, 0, invoiceable_amount, deposit_amount
    FROM rents
) combined
WHERE month_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY DATE_FORMAT(month_date, '%Y-%m')
ORDER BY month DESC;

-- ============================================
-- USER ACTIVITY QUERIES
-- ============================================

-- 28. Recent RLP activities
SELECT 
    rlp_no,
    request_date,
    rlp_status,
    created_by,
    created_at
FROM rlp_info
WHERE is_delete = 0
ORDER BY created_at DESC
LIMIT 20;

-- 29. Recent material transactions
SELECT 
    mb_ref_id,
    material_name,
    mbtype as transaction_type,
    mbin_qty as received,
    mbout_qty as issued,
    mb_date as transaction_date,
    project_id
FROM inv_materialbalance
ORDER BY mb_date DESC
LIMIT 50;

-- 30. Recent equipment movements
SELECT 
    ea.eel_code,
    e.name as equipment_name,
    ea.project_id,
    p.project_name,
    ea.assign_date,
    ea.refund_date,
    ea.remarks
FROM equipment_assign ea
LEFT JOIN equipments e ON ea.eel_code = e.eel_code
LEFT JOIN projects p ON ea.project_id = p.project_id
ORDER BY ea.assign_date DESC
LIMIT 20;

-- ============================================
-- DATA QUALITY CHECKS
-- ============================================

-- 31. Find orphaned records (materials without balance)
SELECT m.material_id_code, m.material_name
FROM inv_material m
LEFT JOIN inv_materialbalance mb ON m.material_id_code = mb.mb_materialid
WHERE mb.id IS NULL;

-- 32. Find equipment without assignments
SELECT e.eel_code, e.name, e.status
FROM equipments e
LEFT JOIN equipment_assign ea ON e.eel_code = ea.eel_code
WHERE ea.id IS NULL;

-- 33. Find invoices without parent rental
SELECT ri.*
FROM rent_invoice ri
LEFT JOIN rents r ON ri.rent_id = r.id
WHERE r.id IS NULL;

-- ============================================
-- PERFORMANCE OPTIMIZATION QUERIES
-- ============================================

-- 34. Check table sizes
SELECT 
    table_name,
    ROUND(((data_length + index_length) / 1024 / 1024), 2) as size_mb,
    table_rows
FROM information_schema.TABLES
WHERE table_schema = 'inventory_rlp'
ORDER BY (data_length + index_length) DESC;

-- 35. Identify slow queries (requires slow query log enabled)
-- This is a reminder to enable slow query logging in MySQL config:
-- slow_query_log = 1
-- slow_query_log_file = /path/to/slow-query.log
-- long_query_time = 2

-- ============================================
-- CLEANUP QUERIES (USE WITH CAUTION)
-- ============================================

-- 36. Delete old deleted RLPs (soft deleted > 1 year ago)
-- DELETE FROM rlp_info 
-- WHERE is_delete = 1 
--   AND updated_at < DATE_SUB(NOW(), INTERVAL 1 YEAR);

-- 37. Archive old maintenance records (> 2 years)
-- CREATE TABLE maintenance_cost_archive LIKE maintenance_cost;
-- INSERT INTO maintenance_cost_archive 
-- SELECT * FROM maintenance_cost 
-- WHERE created_at < DATE_SUB(NOW(), INTERVAL 2 YEAR);

-- ============================================
-- INDEX CREATION QUERIES (For Performance)
-- ============================================

-- 38. Create recommended indexes
-- ALTER TABLE ams_products ADD INDEX idx_status (status);
-- ALTER TABLE ams_products ADD INDEX idx_assign_status (assign_status);
-- ALTER TABLE ams_products ADD INDEX idx_category (assets_category);
-- ALTER TABLE rlp_info ADD INDEX idx_status_delete (rlp_status, is_delete);
-- ALTER TABLE equipments ADD INDEX idx_status (status);
-- ALTER TABLE equipments ADD INDEX idx_location (present_location);
-- ALTER TABLE rents ADD INDEX idx_bill_status (bill_status);
-- ALTER TABLE inv_materialbalance ADD INDEX idx_warehouse (warehouse_id);
-- ALTER TABLE inv_materialbalance ADD INDEX idx_project (project_id);
-- ALTER TABLE maintenance_cost ADD INDEX idx_date (created_at);

-- ============================================
-- END OF QUERY COLLECTION
-- ============================================

-- Notes:
-- 1. Always test queries on a backup database first
-- 2. Adjust LIMIT values based on your data volume
-- 3. Add WHERE clauses to filter by date range as needed
-- 4. Consider adding these queries as stored procedures for better performance
-- 5. Schedule regular execution of summary queries for reporting

-- For questions or issues, refer to DASHBOARD_DOCUMENTATION.md

