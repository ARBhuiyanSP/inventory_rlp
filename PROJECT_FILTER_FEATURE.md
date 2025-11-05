# Project Filter Feature Documentation

## ✨ New Feature: Stock by Project - Dynamic Filtering

Dashboard এ "Stock by Project" chart এ এখন **dropdown filter** যোগ করা হয়েছে, ঠিক warehouse এর মতো।

---

## 🎯 Features

### 1. **Dropdown Filter**
- সব projects এর list দেখাবে
- Default: "All Projects" selected থাকবে
- যেকোনো project select করা যাবে

### 2. **Dynamic Info Display**
প্রতি project এর জন্য দেখাবে:
- **Total Items**: কতগুলো unique materials আছে
- **Stock Value**: মোট stock এর value (৳)

### 3. **Interactive Column Chart**
- Dropdown থেকে project select করলে chart update হবে
- Chart এ stock value দেখাবে
- Column chart format এ visual representation

---

## 📊 How It Works

### Default View (All Projects)
```
┌───────────────────────────────────────┐
│ Stock by Project    [All Projects ▼] │
├───────────────────────────────────────┤
│ Total Items: 60    Stock Value: ৳800,000│
├───────────────────────────────────────┤
│         [Column Chart - Top 10]       │
│  ┃ Project A    ┃ Project B    ┃     │
│  ┃ ৳300,000     ┃ ৳250,000     ┃     │
└───────────────────────────────────────┘
```

### Filtered View (Single Project)
```
┌───────────────────────────────────────┐
│ Stock by Project    [Project Alpha ▼]│
├───────────────────────────────────────┤
│ Total Items: 35    Stock Value: ৳300,000│
├───────────────────────────────────────┤
│         [Column Chart showing 1]      │
│           ┃ Project Alpha             │
│           ┃ ৳300,000                  │
└───────────────────────────────────────┘
```

---

## 🔧 Technical Implementation

### Database Query
```sql
SELECT 
    COALESCE(mb.project_id, 0) as project_id,
    COALESCE(p.project_name, 'Not Assigned') as project_name,
    COUNT(DISTINCT mb.mb_materialid) as item_count,
    SUM(mb.mbin_val - mb.mbout_val) as stock_value 
FROM inv_materialbalance mb 
LEFT JOIN projects p ON mb.project_id = p.project_id 
GROUP BY mb.project_id
HAVING SUM(mb.mbin_val - mb.mbout_val) > 0
ORDER BY stock_value DESC
LIMIT 10
```

### Data Structure
```php
$project_details = [
    '1' => [
        'name' => 'Project Alpha',
        'item_count' => 35,
        'stock_value' => 300000.00
    ],
    '2' => [
        'name' => 'Project Beta',
        'item_count' => 25,
        'stock_value' => 250000.00
    ]
];
```

### JavaScript Functionality
```javascript
// Dropdown change event
document.getElementById('projectFilter').addEventListener('change', function() {
    updateProjectInfo(this.value);
});

// Update function
function updateProjectInfo(projectId) {
    if(projectId === 'all') {
        // Show all projects (top 10)
        // Calculate totals
        // Update chart with all data
    } else {
        // Show selected project
        // Display specific data
        // Update chart with single project
    }
}
```

---

## 📱 User Interface

### Components Added

#### 1. Dropdown Select Box
```html
<select id="projectFilter" class="form-control" style="width: 250px;">
    <option value="all">All Projects</option>
    <option value="1">Project Alpha</option>
    <option value="2">Project Beta</option>
    <option value="3">Project Gamma</option>
</select>
```

#### 2. Info Display Box
```html
<div id="projectStockInfo">
    <div class="row">
        <div class="col-6">
            <strong>Total Items:</strong> <span id="projectItemCount">60</span>
        </div>
        <div class="col-6">
            <strong>Stock Value:</strong> ৳<span id="projectStockValue">800,000.00</span>
        </div>
    </div>
</div>
```

#### 3. Chart Container (Column Chart)
- Highcharts Column Chart
- Dynamic data updates
- Formatted values with ৳ symbol
- X-axis: Project names
- Y-axis: Stock values

---

## 🎨 Design Features

### Layout
```
┌─────────────────────────────────────────────────┐
│  📊 Stock by Project      [Dropdown ▼]         │
├─────────────────────────────────────────────────┤
│  ┌───────────────────────────────────────────┐ │
│  │ Total Items: XX    Stock Value: ৳XX,XXX  │ │
│  └───────────────────────────────────────────┘ │
│  ┌───────────────────────────────────────────┐ │
│  │                                           │ │
│  │      [Interactive Column Chart]          │ │
│  │  ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃                    │ │
│  │                                           │ │
│  └───────────────────────────────────────────┘ │
└─────────────────────────────────────────────────┘
```

### Chart Type Difference
- **Warehouse**: Pie Chart (shows distribution %)
- **Project**: Column Chart (shows comparative values)

---

## 💡 Usage Examples

### Example 1: View All Projects
1. Keep dropdown on "All Projects"
2. See total items and value across top 10 projects
3. Column chart shows comparative heights

### Example 2: View Specific Project
1. Select "Project Alpha" from dropdown
2. See items and value for Project Alpha only
3. Chart shows single column for selected project

### Example 3: Compare Projects
1. Select first project, note the values
2. Select second project, compare values
3. Switch back to "All Projects" for overview

---

## 🔍 Data Calculations

### Same as Warehouse Filter

#### Item Count
```javascript
COUNT(DISTINCT mb.mb_materialid)
```

#### Stock Value
```javascript
SUM(mb.mbin_val - mb.mbout_val)
```

#### Top 10 Limit
```sql
ORDER BY stock_value DESC LIMIT 10
```

---

## 📋 Comparison: Warehouse vs Project

| Feature | Warehouse Filter | Project Filter |
|---------|-----------------|----------------|
| Chart Type | Pie Chart | Column Chart |
| Visual Style | Percentage | Comparative Bars |
| Default View | All Warehouses | All Projects (Top 10) |
| Data Limit | No limit | Top 10 |
| Info Display | Items + Value | Items + Value |
| Filter Type | Dropdown | Dropdown |
| Update Speed | Instant | Instant |

---

## 🧪 Testing

### Test Case 1: Default Load
**Steps:**
1. Open dashboard
2. Scroll to "Stock by Project"

**Expected:**
- Dropdown shows "All Projects"
- Info box shows total items and value (top 10 combined)
- Column chart shows top 10 projects

### Test Case 2: Filter by Project
**Steps:**
1. Click dropdown
2. Select specific project

**Expected:**
- Info box updates to show project-specific data
- Chart updates to show single column
- Values display correctly

### Test Case 3: Switch Back to All
**Steps:**
1. Select specific project
2. Select "All Projects" again

**Expected:**
- Info box shows totals for top 10
- Chart shows all 10 columns again
- No data loss

---

## 🐛 Troubleshooting

### Issue 1: Dropdown is Empty
**Cause**: No projects in `projects` table
**Solution**: 
```sql
SELECT * FROM projects;
-- Check if projects exist
```

### Issue 2: Chart shows wrong project
**Cause**: JOIN field mismatch
**Solution**: 
- Verify JOIN: `mb.project_id = p.project_id`
- Check if `project_id` field exists in both tables

### Issue 3: Values don't match
**Cause**: Data calculation issue
**Solution**:
```sql
SELECT 
    p.project_name,
    COUNT(DISTINCT mb.mb_materialid) as items,
    SUM(mb.mbin_val - mb.mbout_val) as value
FROM inv_materialbalance mb
LEFT JOIN projects p ON mb.project_id = p.project_id
GROUP BY mb.project_id;
```

---

## 🎓 Key Features Summary

### Both Filters Now Have:
1. ✅ **Dropdown Selection**
   - All items (default)
   - Individual items
   
2. ✅ **Info Display**
   - Total items count
   - Stock value in ৳
   
3. ✅ **Dynamic Charts**
   - Updates on selection
   - No page reload
   - Smooth animations
   
4. ✅ **Consistent Design**
   - Same layout style
   - Same info box design
   - Professional appearance

---

## 🚀 Complete Feature Set

### Dashboard Now Has:

#### Warehouse Filter
- ✅ Pie chart visualization
- ✅ Percentage-based view
- ✅ All warehouses data
- ✅ Individual warehouse details

#### Project Filter  
- ✅ Column chart visualization
- ✅ Value-based comparison
- ✅ Top 10 projects data
- ✅ Individual project details

#### Common Features
- ✅ Instant filtering
- ✅ Item count display
- ✅ Stock value display
- ✅ No page reload needed
- ✅ Professional UI/UX
- ✅ Mobile responsive

---

## 📊 Visual Comparison

### When to Use Which Filter?

#### Use Warehouse Filter When:
- You want to see **distribution** across warehouses
- You need to know **percentage share** of each warehouse
- You want to compare **proportions**

#### Use Project Filter When:
- You want to see **actual values** for comparison
- You need to identify **highest/lowest** stock projects
- You want to compare **absolute numbers**

---

## 💻 Code Structure

### PHP Backend (Both Filters)
```php
// 1. Query with item count
// 2. Store in details array
// 3. Generate dropdown options
// 4. Pass data to JavaScript
```

### JavaScript Frontend (Both Filters)
```javascript
// 1. Store data
// 2. Initialize chart
// 3. Create update function
// 4. Attach event listener
// 5. Initialize default view
```

### HTML Structure (Both Filters)
```html
<div class="chart-container">
  <div class="header-with-dropdown">
    <h5>Title</h5>
    <select>Options</select>
  </div>
  <div class="info-display">
    <span>Items</span>
    <span>Value</span>
  </div>
  <div class="chart"></div>
</div>
```

---

## ✅ Implementation Complete

### What Was Added:
- ✅ Project dropdown filter
- ✅ Project info display box
- ✅ Dynamic chart updates
- ✅ "All Projects" default view
- ✅ Specific project detailed view

### Matches Warehouse Filter:
- ✅ Same design pattern
- ✅ Same info display
- ✅ Same filter behavior
- ✅ Same user experience

### Benefits:
- 📊 Consistent user interface
- 🎯 Easy project comparison
- 📱 User-friendly operation
- ⚡ Fast filtering
- 📈 Better insights

---

## 📝 Usage Instructions

### For End Users:

#### To View All Projects:
1. Look at "Stock by Project" section
2. Dropdown will show "All Projects"
3. See combined data for top 10 projects
4. Column chart shows comparative view

#### To View Specific Project:
1. Click the dropdown
2. Select desired project
3. See that project's specific data
4. Chart updates to single column

#### To Compare Projects:
1. Note values for first project
2. Switch to second project
3. Compare items and values
4. Use "All Projects" for overview

---

## 🎉 Summary

Both **Stock by Warehouse** and **Stock by Project** charts now have:
- ✅ Dynamic dropdown filters
- ✅ Real-time info display
- ✅ Interactive chart updates
- ✅ Professional user interface
- ✅ Instant filtering capability

**Perfect for:**
- Quick data analysis
- Comparing warehouses/projects
- Tracking stock distribution
- Making informed decisions

---

**Feature Version**: 1.0  
**Date Added**: November 5, 2025  
**Status**: ✅ PRODUCTION READY  
**Tested**: ✅ Verified Working  
**Matches**: Warehouse Filter Design

