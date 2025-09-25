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
            <a href="user-list.php" style="float:right"><i class="fas fa-list"></i> User List</a></div>
        <div class="card-body">
            <!--here your code will go-->
            <!-- Employee Filter Form -->
                        <form method="post" class="form-inline">
                            <div class="form-group">
                                <select name="employee_id" id="employee_id" class="form-control select2" required>
                                    <option value="">Select Employee</option>
                                    <?php
                                    $sql_emp = "SELECT * FROM `inv_employee` ORDER BY `name` ASC";
                                    $res_emp = mysqli_query($conn, $sql_emp);
                                    while ($emp = mysqli_fetch_assoc($res_emp)) {
                                        $selected = (isset($_POST['employee_id']) && $_POST['employee_id'] == $emp['employeeid']) ? 'selected' : '';
                                        echo "<option value='{$emp['employeeid']}' {$selected}>{$emp['name']} || {$emp['employeeid']}</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <button type="submit" name="submit" class="btn btn-success btn-sm">Search</button>
                        </form>

                        <!-- Report Section -->
                        <?php
                        if (isset($_POST['submit'])):
                            $employee_id = $_POST['employee_id'];

                            // Get Employee Info
                            $sql_employee = "SELECT * FROM `inv_employee` WHERE `employeeid`='$employee_id'";
                            $res_employee = mysqli_query($conn, $sql_employee);
                            $employee = mysqli_fetch_assoc($res_employee);

                            // Get Assigned Products
                            $sql_products = "SELECT pa.*, ap.id, ap.item_name, ap.assets_description, ap.brand, ap.model 
                                             FROM `product_assign` pa
                                             JOIN `ams_products` ap ON pa.product_id = ap.id
                                             WHERE pa.employee_id='$employee_id'";
                            $res_products = mysqli_query($conn, $sql_products);
                        ?>
                        <div class="report-section" style="margin-top:30px;" id="printableArea">
                            <div class="text-center">
                                <h2>SAIF POWER GROUP</h2>
                                <p>72, Mohakhali C/A, (8th Floor), Rupayan Center, Dhaka-1212, Bangladesh</p>
                                <h3>Employee Assets History Report</h3>
                                <hr>
                            </div>

                            <!-- Employee Info -->
                            <table class="table table-bordered" style="width:50%; margin:0 auto;">
                                <tr>
                                    <td>Name</td>
                                    <td><?= $employee['name']; ?></td>
                                </tr>
                                <tr>
                                    <td>Employee ID</td>
                                    <td><?= $employee['employeeid']; ?></td>
                                </tr>
                                <tr>
                                    <td>Division</td>
                                    <td><?= $employee['division']; ?></td>
                                </tr>
                                <tr>
                                    <td>Department</td>
                                    <td><?= $employee['department']; ?></td>
                                </tr>
                                <tr>
                                    <td>Designation</td>
                                    <td><?= $employee['designation']; ?></td>
                                </tr>
                            </table>

                            <!-- Assigned Products Table -->
                            <table class="table table-striped table-bordered" style="width:90%; margin:20px auto;">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Description</th>
                                        <th>Brand</th>
                                        <th>Model</th>
                                        <th>Assign Date</th>
                                        <th>Refund Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($prod = mysqli_fetch_assoc($res_products)): ?>
                                    <tr>
                                        <td><?= $prod['item_name']; ?></td>
                                        <td><?= $prod['assets_description']; ?></td>
                                        <td><?= $prod['brand']; ?></td>
                                        <td><?= $prod['model']; ?></td>
                                        <td><?= $prod['assign_date'] ? date("jS M Y", strtotime($prod['assign_date'])) : '---'; ?></td>
                                        <td><?= $prod['refund_date'] ? date("jS M Y", strtotime($prod['refund_date'])) : '---'; ?></td>
                                    </tr>
                                    <?php endwhile; ?>
                                </tbody>
                            </table>

                            <div class="row text-center" style="margin-top:20px;">
                                <div class="col-xs-6">--------------------<br>Receiver Signature</div>
                                <div class="col-xs-6">--------------------<br>Authorised Signature</div>
                            </div>

                            <div class="alert alert-warning text-center" style="margin-top:20px;">
                                <strong>Notice:</strong> Please Check Everything Before Signature
                            </div>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-default" onclick="printDiv('printableArea')">
                                <i class="fa fa-print"></i> Print
                            </button>
                        </div>
                        <?php endif; ?>
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

<script>
function printDiv(divId) {
    var content = document.getElementById(divId).innerHTML;
    var myWindow = window.open('', '', 'width=800,height=600');
    myWindow.document.write('<html><head><title>Print</title>');
    myWindow.document.write('<link rel="stylesheet" href="assets/css/bootstrap.min.css">');
    myWindow.document.write('</head><body>');
    myWindow.document.write(content);
    myWindow.document.write('</body></html>');
    myWindow.document.close();
    myWindow.print();
}
</script>


<?php include 'footer.php' ?>