<?php 
include 'header.php';
?>
<?php/*  if(!check_permission('user-add')){ 
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
            <!-- Filter Form -->
                        <form class="" method="GET">
							<div class="form-group">
                                <label>Select Asset:</label>
                                <select name="id" class="form-control material_select_2" required>
                                    <option value="">Select Product</option>
                                    <?php
                                    $sqlvs = "SELECT * FROM ams_products";
                                    $resultvs = mysqli_query($conn, $sqlvs);
                                    while($rowvs = mysqli_fetch_array($resultvs)) {
                                        $selected = (isset($_GET['id']) && $_GET['id'] == $rowvs['id']) ? 'selected' : '';
                                        echo "<option value='{$rowvs['id']}' {$selected}>{$rowvs['sl_no']} || {$rowvs['item_name']} || {$rowvs['model']} || {$rowvs['assets_description']}</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <button type="submit" name="submit" class="btn btn-primary">Search</button>
                        </form>
                        <hr>

                        <?php
                        if(isset($_GET['submit']) && !empty($_GET['id'])){
                            $id = $_GET['id'];
                            // Fetch product info
                            $sql = "SELECT * FROM ams_products WHERE id='$id'";
                            $result = mysqli_query($conn, $sql);
                            $product = mysqli_fetch_array($result);

                            // Fetch assignment history with JOIN
                            $sqlHistory = "SELECT pa.*, e.name AS employee_name 
                                           FROM product_assign pa
                                           LEFT JOIN inv_employee e ON pa.employee_id = e.employeeid
                                           WHERE pa.product_id='$id' 
                                           ORDER BY pa.assign_date DESC";
                            $historyResult = mysqli_query($conn, $sqlHistory);
                        ?>

                        <!-- Printable Area -->
                        <div id="printableArea">
                            <div class="text-center">
                                <h1><img src="images/spl.png" height="50"></h1>
                                <h2>SAIF POWER GROUP</h2>
                                <p>72, Mohakhali C/A, (8th Floor), Rupayan Center, Dhaka-1212, Bangladesh</p>
                                <h3>Assets History Report</h3>
                            </div>

                            <table class="table table-bordered" style="width:80%; margin:auto;">
                                <tr>
                                    <th>Name</th>
                                    <td><?= $product['item_name'] ?></td>
                                    <th>INV SL No</th>
                                    <td><?= $product['manu_sl'] ?></td>
                                    <th>Brand</th>
                                    <td><?= $product['brand'] ?></td>
                                    <td rowspan="2"><img src="<?= $product['qr_image'] ?>" height="100"></td>
                                </tr>
                                <tr>
                                    <th>Model</th>
                                    <td><?= $product['model'] ?></td>
                                    <th>Origin</th>
                                    <td><?= $product['origin'] ?></td>
                                    <th>Purchase Date</th>
                                    <td><?= date("jS M Y", strtotime($product['puchase_date'])) ?></td>
                                </tr>
                            </table>

                            <table class="table table-striped table-bordered" style="width:90%; margin:auto; margin-top:20px;">
                                <thead>
                                    <tr>
                                        <th>Employee ID</th>
                                        <th>Employee Name</th>
                                        <th>From Date</th>
                                        <th>To Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while($row = mysqli_fetch_array($historyResult)) { ?>
                                    <tr>
                                        <td><?= $row['employee_id'] ?></td>
                                        <td><?= $row['employee_name'] ?></td>
                                        <td><?= $row['assign_date'] ? date("jS M Y", strtotime($row['assign_date'])) : '---' ?></td>
                                        <td><?= $row['refund_date'] ? date("jS M Y", strtotime($row['refund_date'])) : '---' ?></td>
                                    </tr>
                                    <?php } ?>
                                </tbody>
                            </table>

                            <!-- Signatures -->
                            <div class="row text-center" style="margin-top:30px;">
                                <div class="col-xs-6">--------------------<br>Receiver Signature</div>
                                <div class="col-xs-6">--------------------<br>Authorised Signature</div>
                            </div>

                            <!-- Notice -->
                            <div class="row" style="margin-top:20px;">
                                <div class="col-sm-12" style="border:1px solid gray; border-radius:5px; padding:10px; color:#f26522;">
                                    <h5 class="text-center">Notice***<br><span style="font-size:14px; color:#000;">Please Check Everything Before Signature</span></h5>
                                </div>
                            </div>
                        </div>

                        <div class="text-center" style="margin-top:20px;">
                            <button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print"></i> Print</button>
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

                        <?php } ?>
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