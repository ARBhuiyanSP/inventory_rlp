<?php 
include 'header.php';
include 'includes/assign_process.php';
?>
<?php /* if(!check_permission('user-add')){ 
        include("404.php");
        exit();
 }  */?>
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
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body" id="printableArea">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Products View</h4>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                        <?php
                        $sql = "SELECT * FROM ams_products WHERE id=$id";
                        $result = mysqli_query($conn, $sql);
                        $row = mysqli_fetch_array($result);
                        ?>

                        <div class="row">
                            <div class="col-md-4">
                                <table class="table table-bordered">
                                    <tr><th>Item Name:</th><td><?php echo $row['item_name'] ?></td></tr>
                                    <tr><th>Brand:</th><td><?php echo $row['brand'] ?></td></tr>
                                    <tr><th>Model:</th><td><?php echo $row['model'] ?></td></tr>
                                    <tr><th>RLP No:</th><td><?php echo $row['rlp_no'] ?></td></tr>
                                    <tr><th>Country Origin:</th><td><?php echo $row['origin'] ?></td></tr>
                                    <tr><th>Vendor Name:</th><td><?php echo $row['vendor_name'] ?></td></tr>
                                    <tr><th>Purchase Date:</th><td><?php echo $row['puchase_date'] ?></td></tr>
                                    <tr><th>Custody:</th><td><?php echo $row['custody'] ?></td></tr>
                                </table>
                            </div>
                            <div class="col-md-8">
                                <h3>Scan Below Code</h3>
                                <img src="<?php echo $row['qr_image'] ?>" height="250" />
                            </div>
                        </div>

                        <h3 style="color:red;">Want To Assign This Product ?</h3>
                        <form action="" method="POST" id="receive_entry_form" enctype="multipart/form-data" onsubmit="showFormIsProcessing('receive_entry_form');">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Assign To</label>
                                        <select id="employee_select" name="employee_id" class="form-control select2" required>
                                            <option value="">Select Employee</option>
                                            <?php 
                                            $sql = "SELECT * FROM inv_employee ORDER BY id ASC";
                                            $result = mysqli_query($conn, $sql);
                                            while($row = mysqli_fetch_array($result)) {
                                                echo '<option value="'.$row['employeeid'].'">'.$row['name'].' - '.$row['employeeid'].'</option>';
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Assign Date</label>
                                        <input name="assign_date" type="text" class="form-control" id="rndate" autocomplete="off"/>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="id">Assigned By</label>
                                        <?php 
                                        $employee_id = $_SESSION['logged']['office_id'];
                                        $sqlemployee = "SELECT * FROM inv_employee WHERE employeeid='$employee_id'";
                                        $resultemployee = mysqli_query($conn, $sqlemployee);
                                        $rowemployee = mysqli_fetch_array($resultemployee);
                                        ?>
                                        <input type="text" class="form-control" value="<?php echo $rowemployee["name"]; ?>" readonly />
                                        <input name="assigned_by" type="hidden" value="<?php echo $rowemployee["employeeid"]; ?>" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label for="ad">Remarks</label>
                                        <textarea id="ad" name="remarks" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" name="product_id" value="<?php echo $id ?>" />

                            <div class="row">
                                <div class="col-md-8 mt-4">
                                    <div class="form-group">
                                        <button class="btn btn-danger" type="submit" id="assign_submit" name="assign_submit" style="width:100%">
                                            Assign This Product
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div> <!-- /.box-body -->
                </div> <!-- /.box -->
            </div>
        </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<script>
    $(function () {
        $("#rndate").datepicker({
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