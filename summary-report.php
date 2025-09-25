<?php 
include 'header.php';
// initialize variables so form can remember last selection
$division_id = isset($_POST['division_id']) ? $_POST['division_id'] : 'all';
$from_date   = isset($_POST['from_date']) ? $_POST['from_date'] : '';
$to_date     = isset($_POST['to_date']) ? $_POST['to_date'] : '';
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">Division Wise Summary Report</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Division Wise Summary Report
        </div>
        <div class="card-body">

            <!-- Filter Form -->
			<form action="" method="post">
				<div class="row">
					<div class="col-sm-3">
						<label>Division</label>
						<select class="form-control select2" name="division_id">
							<option value="all" <?php if(isset($division_id) && $division_id=='all') echo 'selected'; ?>>All Division</option>
							<?php 
							$results = mysqli_query($conn, "SELECT * FROM `branch`"); 
							while ($row = mysqli_fetch_array($results)) { 
								$selected = (isset($division_id) && $division_id == $row['id']) ? 'selected' : '';
								echo "<option value='{$row['id']}' {$selected}>{$row['name']}</option>";
							} ?>
						</select>
					</div>
					<div class="col-sm-3">
						<label>From Date</label>
						<input type="date" class="form-control" name="from_date" 
							   value="<?php if(isset($from_date)) echo $from_date; ?>" required>
					</div>
					<div class="col-sm-3">
						<label>To Date</label>
						<input type="date" class="form-control" name="to_date" 
							   value="<?php if(isset($to_date)) echo $to_date; ?>" required>
					</div>
					<div class="col-sm-3">
						<label>&nbsp;</label>
						<input type="submit" name="submit" class="btn btn-success btn-block" value="Search Data">
					</div>
				</div>
			</form>

            <br>

            <?php
            if(isset($_POST['submit'])){
                $division_id = $_POST['division_id'];
                $from_date   = $_POST['from_date'];
                $to_date     = $_POST['to_date'];

                $where_div = "";
                if($division_id !== 'all' && (int)$division_id > 0){
                    $division_id_safe = (int)$division_id;
                    $where_div = " AND division_id = {$division_id_safe}";
                }

                // Get Division Name
$division_name = "All Division";
if ($division_id !== 'all' && (int)$division_id > 0) {
    $query_div = mysqli_query($conn, "SELECT name FROM branch WHERE id={$division_id_safe}");
    if ($query_div && mysqli_num_rows($query_div) > 0) {
        $division_row = mysqli_fetch_assoc($query_div);
        $division_name = $division_row['name'];
    }
}

echo "<div id='printableArea'>
        <center>
            <h2>Division Wise Summary Report</h2>
            <p>Date Range: {$from_date} to {$to_date}</p>
            <p>Division: {$division_name}</p>
        </center>";

                /* ================== ASSETS PURCHASE ================== */
                $sql_assets = "SELECT id, sl_no, item_name, brand, model, puchase_date, purchase_value, vendor_name
                               FROM ams_products 
                               WHERE puchase_date BETWEEN '{$from_date}' AND '{$to_date}' {$where_div}";
                $res_assets = mysqli_query($conn, $sql_assets);

                $total_assets = 0;
                echo "<h4>Assets Purchase</h4>
                      <table class='table table-bordered table-striped'>
                        <thead>
                          <tr>
                            <th>SL</th>
                            <th>SL No</th>
                            <th>Item Name</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Date</th>
                            <th style='text-align:right;'>Value</th>
                          </tr>
                        </thead>
                        <tbody>";
                $i=0;
                while($row = mysqli_fetch_assoc($res_assets)){
                    $i++;
                    $val = (float)str_replace(",","",$row['purchase_value']);
                    $total_assets += $val;
                    echo "<tr>
                            <td>{$i}</td>
                            <td>{$row['sl_no']}</td>
                            <td>{$row['item_name']}</td>
                            <td>{$row['brand']}</td>
                            <td>{$row['model']}</td>
                            <td>{$row['puchase_date']}</td>
                            <td style='text-align:right;'>".number_format($val,2)."</td>
                          </tr>";
                }
                echo "</tbody>
                      <tfoot>
                        <tr>
                          <th colspan='6' style='text-align:right;'>Subtotal</th>
                          <th style='text-align:right;'>".number_format($total_assets,2)."</th>
                        </tr>
                      </tfoot>
                      </table>";

                /* ================== SERVICE BILL ================== */
                $sql_service = "SELECT id, bill_no, bill_date, amount, srv_ref, vendor_id, assets_slno
                                FROM inv_services_bill 
                                WHERE bill_date BETWEEN '{$from_date}' AND '{$to_date}' {$where_div}";
                $res_service = mysqli_query($conn, $sql_service);

                $total_service = 0;
                echo "<h4>Service Bills</h4>
                      <table class='table table-bordered table-striped'>
                        <thead>
                          <tr>
                            <th>SL</th>
                            <th>Bill No</th>
                            <th>Bill Ref No</th>
                            <th>Asset ID</th>
                            <th>Bill Date</th>
                            <th style='text-align:right;'>Amount</th>
                          </tr>
                        </thead>
                        <tbody>";
                $j=0;
                while($row = mysqli_fetch_assoc($res_service)){
                    $j++;
                    $val = (float)$row['amount'];
                    $total_service += $val;
                    echo "<tr>
                            <td>{$j}</td>
                            <td>{$row['bill_no']}</td>
                            <td>{$row['srv_ref']}</td>
                            <td>{$row['assets_slno']}</td>
                            <td>{$row['bill_date']}</td>
                            <td style='text-align:right;'>".number_format($val,2)."</td>
                          </tr>";
                }
                echo "</tbody>
                      <tfoot>
                        <tr>
                          <th colspan='5' style='text-align:right;'>Subtotal</th>
                          <th style='text-align:right;'>".number_format($total_service,2)."</th>
                        </tr>
                      </tfoot>
                      </table>";

                /* ================== CONSUMPTION / ISSUE ================== */
                $sql_issue = "SELECT id, issue_id, issue_date, use_in, received_by, total_amount 
                              FROM inv_issue 
                              WHERE issue_date BETWEEN '{$from_date}' AND '{$to_date}' {$where_div}";
                $res_issue = mysqli_query($conn, $sql_issue);

                $total_issue = 0;
                echo "<h4>Consumption / Issue</h4>
                      <table class='table table-bordered table-striped'>
                        <thead>
                          <tr>
                            <th>SL</th>
                            <th>Issue ID</th>
                            <th>Employee ID</th>
                            <th>Date</th>
                            <th style='text-align:right;'>Total Amount</th>
                          </tr>
                        </thead>
                        <tbody>";
                $k=0;
                while($row = mysqli_fetch_assoc($res_issue)){
                    $k++;
                    $val = (float)$row['total_amount'];
                    $total_issue += $val;
                    echo "<tr>
                            <td>{$k}</td>
                            <td>{$row['issue_id']}</td>
                            <td>{$row['use_in']}</td>
                            <td>{$row['issue_date']}</td>
                            <td style='text-align:right;'>".number_format($val,2)."</td>
                          </tr>";
                }
                echo "</tbody>
                      <tfoot>
                        <tr>
                          <th colspan='4' style='text-align:right;'>Subtotal</th>
                          <th style='text-align:right;'>".number_format($total_issue,2)."</th>
                        </tr>
                      </tfoot>
                      </table>";

                /* ================== GRAND TOTAL ================== */
                $grand_total = $total_assets + $total_service + $total_issue;
                echo "<h3 style='text-align:right;'>Grand Total: ".number_format($grand_total,2)." BDT</h3>";

                echo "</div>";

                echo '<center><a class="btn btn-default" onclick="printDiv(\'printableArea\')" style="margin-top:5px;">
                        <i class="fa fa-print"></i> Print 
                      </a></center>';
            }
            ?>

        </div>
    </div>
</div>

<script>
function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;
     document.body.innerHTML = printContents;
     window.print();
     document.body.innerHTML = originalContents;
}
</script>

<?php include 'footer.php'; ?>
