<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
<!--<link href="css/form-entry.css" rel="stylesheet">-->
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">User Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            User Entry
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List<a></div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="row">
                            <div class="col-sm-12">
                                <?php
                                // Retain selected filters
                                $selected_division_id = isset($_POST['division_id']) ? $_POST['division_id'] : 'all';
                                $selected_store_id = isset($_POST['store_id']) ? $_POST['store_id'] : 'all';
                                $selected_category_id = isset($_POST['category_id']) ? $_POST['category_id'] : 'all';
                                ?>

                                <form method="post" action="">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>Division</label>
                                                <select class="form-control select2" name="division_id">
                                                    <option value="all" <?= ($selected_division_id==='all')?'selected':'' ?>>All Divisions</option>
                                                    <?php
                                                    $divisions = mysqli_query($conn, "SELECT * FROM branch ORDER BY name ASC");
                                                    while($div = mysqli_fetch_assoc($divisions)){
                                                        $sel = ($selected_division_id === $div['id']) ? 'selected':'';
                                                        echo '<option value="'.$div['id'].'" '.$sel.'>'.htmlspecialchars($div['name']).'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>Store</label>
                                                <select class="form-control select2" name="store_id">
                                                    <option value="all" <?= ($selected_store_id==='all')?'selected':'' ?>>All Stores</option>
                                                    <?php
                                                    $stores = mysqli_query($conn, "SELECT * FROM store ORDER BY name ASC");
                                                    while($store = mysqli_fetch_assoc($stores)){
                                                        $sel = ($selected_store_id === $store['id']) ? 'selected':'';
                                                        echo '<option value="'.$store['id'].'" '.$sel.'>'.htmlspecialchars($store['name']).'</option>';
                                                    }
                                                    ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>Category</label>
                                                <select class="form-control select2" name="category_id">
													<option value="all" <?= ($selected_category_id==='all')?'selected':'' ?>>All Categories</option>
													<?php
													// Fetch active categories
													$categories = mysqli_query($conn, "SELECT * FROM `assets_categories` ORDER BY `assets_category` ASC");
													while ($cat = mysqli_fetch_assoc($categories)) {
														// assets_id is VARCHAR, so always compare as string
														$sel = ($selected_category_id === $cat['assets_id']) ? 'selected' : '';
														echo '<option value="'.htmlspecialchars($cat['assets_id']).'" '.$sel.'>'.htmlspecialchars($cat['assets_category']).'</option>';
													}
													?>
												</select>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <label>&nbsp;</label>
                                            <input type="submit" name="submit" class="btn btn-block btn-success" value="Search Data"/>
                                        </div>

                                        <div class="col-sm-2">
                                            <label>&nbsp;</label>
                                        </div>
                                    </div>
                                </form>
                        

<?php
if(isset($_POST['submit'])){
    $where = "WHERE p.status='active'";

    if($selected_division_id !== 'all'){
        $where .= " AND p.division_id='".mysqli_real_escape_string($conn, $selected_division_id)."'";
    }
    if($selected_store_id !== 'all'){
        $where .= " AND p.store_id='".mysqli_real_escape_string($conn, $selected_store_id)."'";
    }
    if($selected_category_id !== 'all'){
        $where .= " AND p.assets_category='".mysqli_real_escape_string($conn, $selected_category_id)."'";
    }

    $sql = "SELECT p.item_name, p.brand, p.assets_description, p.model, p.purchase_value, c.assets_category, c.assets_category, s.name
            FROM ams_products p
            LEFT JOIN store s ON p.store_id = s.id
			LEFT JOIN assets_categories c ON p.assets_category = c.assets_id
            $where
            ORDER BY p.id DESC";
    $resultSet = mysqli_query($conn, $sql);
    $count = $resultSet ? $resultSet->num_rows : 0;

    // Total price
    $sum_sql = "SELECT SUM(CAST(REPLACE(p.purchase_value, ',', '') AS DECIMAL(15,2))) AS total_price
                FROM ams_products p
                $where";
    $sum_res = mysqli_query($conn, $sum_sql);
    $sum_row = $sum_res ? mysqli_fetch_assoc($sum_res) : ['total_price'=>0];
    $total_price = (float)$sum_row['total_price'];

    // Names for selected filters
    $division_name = ($selected_division_id==='all')?'All Divisions':getDivisionNameById($selected_division_id);
    $store_name = ($selected_store_id==='all')?'All Stores':getStoreNameById($selected_store_id);
    if($selected_category_id==='all'){
        $category_name = 'All Categories';
    } else {
        $cat_res = mysqli_query($conn, "SELECT assets_category FROM assets_categories WHERE assets_id='".mysqli_real_escape_string($conn, $selected_category_id)."' LIMIT 1");
        $cat_row = mysqli_fetch_assoc($cat_res);
        $category_name = $cat_row['assets_category'];
    }

    if($resultSet && $count>0){
        echo "<div id='printableArea'>
                <center>
                    <h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1>
                    <h2>88 Innovations Engineering Ltd</h2>
                    <p>7th Floor, Khawaja Tower, 95 Bir Uttam AK Khandakar Road, Dhaka-1212, Bangladesh</p>
                    <h3>Assets List Report</h3>
                    Division: ".htmlspecialchars($division_name)." | Store: ".htmlspecialchars($store_name)." | Category: ".htmlspecialchars($category_name)." - Total Assets: {$count}
                </center>";

        echo "<table class='table table-bordered table-striped list-table-custom-style'>
                <thead>
                    <tr>
                        <th width='5%'>SL No</th>
                        <th>Item Name</th>
                        <th width='10%'>Brand</th>
                        <th>Description</th>
                        <th>Model</th>
                        <th>Store/Location</th>
                        <th style='text-align:right;'>Price</th>
                    </tr>
                </thead>
                <tbody>";
        $i=0;
        while($row = $resultSet->fetch_assoc()){
            $i++;
            $price = (float) str_replace(',', '', $row['purchase_value']);
            echo "<tr>
                    <td>{$i}</td>
                    <td>".htmlspecialchars($row['item_name'])."</td>
                    <td>".htmlspecialchars($row['brand'])."</td>
                    <td>".htmlspecialchars($row['assets_description'])."</td>
                    <td>".htmlspecialchars($row['model'])."</td>
                    <td>".htmlspecialchars($row['name'])."</td>
                    <td style='text-align:right;'>".number_format($price,2)."</td>
                 </tr>";
        }
        echo "</tbody>
              <tfoot>
                <tr>
                    <th colspan='5' style='text-align:right;'>Total Price</th>
                    <th style='text-align:right;'>".number_format($total_price,2)."</th>
                </tr>
              </tfoot>
            </table>
        </div>";
    } else {
        echo "<center>No Result</center>";
    }
}
?>

<div class="row">
    <div class="col-sm-12">
        <center>
            <a class="btn btn-default" onclick="printDiv('printableArea')" style="margin-top:5px;">
                <i class="fa fa-print"></i> Print
            </a>
        </center>
        <script>
        function printDiv(divName){
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
        </script>
		
    </div>
</div>

                    </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<script>
    $(function () {
        $("#mrr_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#challan_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#requisition_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<?php include 'footer.php' ?>