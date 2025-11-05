# Dashboard Quick Reference Guide

## Dashboard Sections Overview

### 📊 Section 1: AT A GLANCE - Fixed Assets & Service
**Purpose**: Quick view of all fixed assets and service status

**Key Metrics**:
- Assets by Category (with assigned/available breakdown)
- Total Services
- Services at Servicing
- Completed Services

**Quick Actions**:
- View asset details by category
- View all services

---

### 🛒 Section 2: PROCUREMENT AREA
**Purpose**: Monitor RLP, Notesheet, and Work Order status

**Key Metrics**:
- RLP: Total, Approved, Pending, Approval Rate
- Notesheets: Total, Approved, Pending
- Work Orders: Total, Approved, Pending

**Quick Actions**:
- View RLP list
- View Notesheet list
- View Work Order list

---

### 📦 Section 3: INVENTORY MANAGEMENT
**Purpose**: Track material movement and stock levels

**Key Metrics**:
- Material Receive count
- Material Issue count
- Total Stock Value
- Unique Materials count

**Charts**:
- Stock by Warehouse (Pie Chart)
- Stock by Project (Column Chart)

**Quick Actions**:
- View receive list
- View issue list
- View stock report
- View materials

---

### 🔧 Section 4: EQUIPMENT MANAGEMENT
**Purpose**: Monitor equipment status and inspections

**Key Metrics**:
- Total Equipment
- Running Equipment
- Idle Equipment
- Rented Equipment
- Total Inspections

**Charts**:
- Equipment Status Distribution (Pie Chart)

**Quick Actions**:
- View equipment list
- View inspection history

---

### 🔨 Section 5: MAINTENANCE MANAGEMENT
**Purpose**: Track maintenance costs and trends

**Key Metrics**:
- Total Maintenance count
- Total Cost (lifetime)
- This Month Cost
- Average Cost per Maintenance

**Charts**:
- Top 10 Cost Equipment (Bar Chart)
- Monthly Maintenance Cost Trend (Line Chart)

**Quick Actions**:
- View maintenance list

---

### 🤝 Section 6: RENTAL MANAGEMENT
**Purpose**: Monitor rental revenue and collections

**Key Metrics**:
- Total Rentals
- Total Revenue
- Total Invoices
- Collections
- Pending Bills
- Due Amount

**Charts**:
- Payment Status (Pie Chart)
- Rental Revenue & Collection Trend (Area Chart)

**Quick Actions**:
- View rental list
- View invoice list

---

## Color Coding System

| Color | Purpose | Example |
|-------|---------|---------|
| 🔵 Blue | General Information | Total counts |
| 🟢 Green | Positive/Completed | Approved items, Collections |
| 🟠 Orange | Pending/Warning | Pending approvals, At servicing |
| 🔴 Red | Critical/Due | Due amounts, High costs |
| 🟣 Purple | Special Categories | Specific groupings |
| 🟦 Teal | Alternative Positive | Completed services |

---

## Database Tables Reference

### Asset Management
- `assets_categories` - Asset category master
- `ams_products` - Asset/product master
- `inv_services` - Service records

### Procurement
- `rlp_info` - RLP master
- `notesheets_master` - Notesheet master
- `workorders_master` - Work order master

### Inventory
- `inv_receive` - Receive master
- `inv_issue` - Issue master
- `inv_material` - Material master
- `inv_materialbalance` - Stock balance

### Equipment
- `equipments` - Equipment master
- `inspaction` - Inspection records

### Maintenance
- `maintenance_cost` - Maintenance cost master
- `maintenance_spare_parts` - Spare parts used
- `maintenance_mechanic` - Mechanic assignments

### Rental
- `rents` - Rental master
- `rent_invoice` - Invoice master
- `client_balance` - Payment tracking

---

## Common Status Values

### RLP Status (`rlp_info.rlp_status`)
- `0` = Pending
- `1` = Approved

### Notesheet Status (`notesheets_master.notesheet_status`)
- `0` = Pending
- `1` = Approved

### Work Order Status (`workorders_master.status`)
- `0` = Pending
- `1` = Approved

### Equipment Status (`equipments.status`)
- `Running` = Currently operational
- `Idle` = Not in use
- `Rented` = Rented out

### Service Status (`inv_services.status`)
- `at_servicing` = Currently being serviced
- `completed` = Service completed

### Bill Status (`rents.bill_status`)
- `Pending` = Payment pending
- `Paid` = Fully paid

---

## Quick SQL Queries

### Check Total Assets
```sql
SELECT COUNT(*) as total FROM ams_products WHERE status='active';
```

### Check Pending RLPs
```sql
SELECT COUNT(*) as pending FROM rlp_info WHERE is_delete=0 AND rlp_status!=1;
```

### Check Stock Value
```sql
SELECT SUM(current_balance * rate) as stock_value FROM inv_material;
```

### Check Equipment Status
```sql
SELECT status, COUNT(*) as count FROM equipments GROUP BY status;
```

### Check Maintenance Costs (This Month)
```sql
SELECT SUM(total_cost) as cost FROM maintenance_cost 
WHERE DATE_FORMAT(created_at, '%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m');
```

### Check Rental Due Amount
```sql
SELECT SUM(due_amount) as due FROM rents WHERE bill_status='Pending';
```

---

## Performance Tips

### For Fast Loading
1. Ensure these fields are indexed:
   - `ams_products.status`
   - `rlp_info.rlp_status`
   - `equipments.status`
   - `rents.bill_status`

2. Clear browser cache if charts don't load

3. Check PHP memory limit (recommended: 256M)

### For Accurate Data
1. Ensure all transactions are properly recorded
2. Run regular database maintenance
3. Archive old records periodically

---

## Customization Quick Guide

### Change Chart Colors
Edit the chart configurations in dashboard.php:
```javascript
color: '#your-hex-color'
```

### Change Trend Period
Find this line in PHP section:
```php
for($i = 5; $i >= 0; $i--) // 6 months
```
Change `5` to desired months - 1

### Add New Stat Card
Use this template:
```html
<div class="col-lg-3 col-md-6">
    <div class="stat-card blue">
        <div class="stat-label">Your Label</div>
        <div class="stat-number"><?php echo $your_count; ?></div>
        <small>Your description</small>
    </div>
</div>
```

### Available Card Colors
- `stat-card blue`
- `stat-card green`
- `stat-card orange`
- `stat-card red`
- `stat-card purple`
- `stat-card teal`

---

## Troubleshooting Checklist

### Dashboard Not Loading
- [ ] Check database connection
- [ ] Verify `header.php` includes properly
- [ ] Check for PHP errors (enable error reporting)
- [ ] Verify table names exist

### Charts Not Showing
- [ ] Highcharts library loaded?
- [ ] Data queries returning results?
- [ ] Check browser console for JS errors
- [ ] Verify chart container IDs match

### Wrong Data Displayed
- [ ] Check date filters
- [ ] Verify JOIN conditions
- [ ] Test SQL queries directly
- [ ] Check for null values

### Slow Performance
- [ ] Add database indexes
- [ ] Optimize queries
- [ ] Enable query caching
- [ ] Reduce chart data points

---

## File Structure

```
inventory_rlp/
├── dashboard.php (Main dashboard file)
├── header.php (Header includes)
├── footer.php (Footer includes)
├── connection/
│   └── connect.php (Database connection)
├── css/
│   ├── sb-admin.css (Admin styles)
│   └── site_style.css (Custom styles)
├── js/
│   └── (JavaScript files)
└── DASHBOARD_DOCUMENTATION.md (Full documentation)
```

---

## Keyboard Shortcuts (If Implemented)

- `Ctrl + D` - Refresh dashboard
- `Ctrl + P` - Print dashboard
- `Esc` - Close modals

---

## Mobile Responsive Features

- All cards stack vertically on mobile
- Charts resize automatically
- Touch-friendly buttons
- Swipe to scroll tables

---

## API Endpoints (For Future AJAX Updates)

```
/api/dashboard/assets.php - Get asset counts
/api/dashboard/procurement.php - Get procurement stats
/api/dashboard/inventory.php - Get inventory stats
/api/dashboard/equipment.php - Get equipment stats
/api/dashboard/maintenance.php - Get maintenance stats
/api/dashboard/rental.php - Get rental stats
```

---

## Report Export Options

### Current Features
- Chart export (PNG, JPG, PDF, SVG)
- Print dashboard (Browser print)

### Planned Features
- Export to Excel
- PDF Report generation
- Email scheduled reports

---

## User Permissions

Ensure users have proper permissions:
- `dashboard-view` - View dashboard
- `assets-view` - View assets section
- `procurement-view` - View procurement section
- `inventory-view` - View inventory section
- `equipment-view` - View equipment section
- `maintenance-view` - View maintenance section
- `rental-view` - View rental section

---

## Support Contacts

- **Technical Issues**: development@company.com
- **Data Issues**: data@company.com
- **Feature Requests**: support@company.com

---

## Update Log

### Recent Updates
- ✅ All sections implemented
- ✅ 11 interactive charts added
- ✅ Responsive design complete
- ✅ Performance optimized

### Upcoming Updates
- 🔄 Real-time data updates
- 🔄 Custom date range filters
- 🔄 PDF export functionality
- 🔄 Alert notifications

---

**Quick Tip**: Bookmark this page for easy reference!
**Last Updated**: November 5, 2025

