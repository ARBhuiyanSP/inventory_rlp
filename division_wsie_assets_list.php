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
            
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label>Division</label>
												<select class="form-control select2" id="project_id" name="division_id">
														<option value="all">All Division</option>
														<?php $results = mysqli_query($conn, "SELECT * FROM `branch`"); 
														while ($row = mysqli_fetch_array($results)) { ?>
														<option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search Data" />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label></label>
												<input type="button" name="" id="" class="btn btn-block btn-primary" value="Back To Reports Section" onclick="location.href='reports.php';"/>
											</div>
										</div>
									</div>
								</form>
							
							<?php
if(isset($_POST['submit'])){
    $division_id  = $_POST['division_id'];

    if($division_id !== 'all' && (int)$division_id > 0){
        $store = getDivisionNameById($division_id);
    }else{
        $store = 'All Division';
    }

    // Main query (filtered by division if set)
    $where = "WHERE `status` = 'active'";
    if($division_id !== 'all' && (int)$division_id > 0){
        $division_id_safe = (int)$division_id;
        $where .= " AND `division_id` = {$division_id_safe}";
    }

    $sql = "SELECT `item_name`, `brand`, `assets_description`, `model`, `purchase_value`
            FROM `ams_products` {$where}
            ORDER BY id DESC";
    $resultSet = mysqli_query($conn, $sql);

    $count = $resultSet ? $resultSet->num_rows : 0;

    // ✅ Correct Total Price (varchar → number)
    $sum_sql = "SELECT SUM(CAST(REPLACE(purchase_value, ',', '') AS DECIMAL(15,2))) AS total_price 
                FROM `ams_products` {$where}";
    $sum_res = mysqli_query($conn, $sum_sql);
    $sum_row = $sum_res ? mysqli_fetch_assoc($sum_res) : ['total_price' => 0];
    $total_price = (float)$sum_row['total_price'];

    if($resultSet && $count > 0){
        echo "<div id='printableArea'>
                <center>
                    <h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1>
                    <h2>SAIF POWERTEC LIMITED</h2>
                    <p>72, Mohakhali C/A, (8th Floor), Rupayan Center, Dhaka-1212, Bangladesh</p>
                    <h3>Assets List Report</h3>
                    Store Location : ".htmlspecialchars($store)." - Total Assets: {$count}
                </center>";

        echo "<table id='rlp_list_table' class='table table-bordered table-striped list-table-custom-style'>
                <thead>
                    <tr>
                        <th width='5%'>SL No</th>
                        <th>Item Name</th>
                        <th width='10%'>Brand</th>
                        <th>Description</th>
                        <th>Model</th>
                        <th style='text-align:right;'>Price</th>
                    </tr>
                </thead>
                <tbody>";

        $i = 0;
        while($rows = $resultSet->fetch_assoc()) {
            $i++;
            $price = (float) str_replace(',', '', $rows['purchase_value']);
            echo "<tr>
                    <td>". $i ."</td>
                    <td>". htmlspecialchars($rows['item_name']) ."</td>
                    <td>". htmlspecialchars($rows['brand']) ."</td>
                    <td>". htmlspecialchars($rows['assets_description']) ."</td>
                    <td>". htmlspecialchars($rows['model']) ."</td>
                    <td style='text-align:right;'>". number_format($price, 2) ."</td>
                 </tr>";
        }

        // ✅ Total show in footer
        echo    "</tbody>
                <tfoot>  
                    <tr>
                        <th colspan='5' style='text-align:right;'>Total Price</th>
                        <th style='text-align:right;'>". number_format($total_price, 2) ."</th>
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
			<a class="btn btn-default" onclick="printDiv('printableArea')" value="print a div!" style="margin-top:5px;">
				<i class="fa fa-print"></i> Print 
			</a>
		</center>
		<script>
		function printDiv(divName) {
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