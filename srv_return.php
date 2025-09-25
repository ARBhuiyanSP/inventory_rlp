<?php 
include 'header.php';
include 'includes/asset_process.php';
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
            
            <a href="service_entry.php" style="float:right"><i class="fas fa-list"></i> Service Area</a></div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="row">
                                <?php
                                    $id = $_GET['id'];
                                    $sql    =   "select * from `inv_services` where `id`='$id'";
                                    $result = mysqli_query($conn, $sql);
                                    $rowp=mysqli_fetch_array($result);
                                        $product_id=$rowp['assets_id'];
                                        $sql2   =   "select * from `ams_products` where `id`='$product_id'";
                                        $result2 = mysqli_query($conn, $sql2);
                                        $row=mysqli_fetch_array($result2);
										
										$division_id = $row['division_id'];
										$department_id = $row['department_id'];
										$proloc_id = $row['proloc_id'];
                                
                                ?>
                                <div class="col-lg-4">
                                    <table style="" class="table table-bordered">
                                        <tr>
                                            <th>Item Name:</th>
                                            <td><?php echo $row['item_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Brand:</th>
                                            <td><?php echo $row['brand'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Model:</th>
                                            <td><?php echo $row['model'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>RLP No:</th>
                                            <td><?php echo $row['rlp_no'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Country Origin:</th>
                                            <td><?php echo $row['origin'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Vendor Name:</th>
                                            <td><?php echo $row['vendor_name'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Purchase Date:</th>
                                            <td><?php echo $row['puchase_date'] ?></td>
                                        </tr>
                                        <tr>
                                            <th>Custody:</th>
                                            <td><?php echo $row['custody'] ?></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-lg-8">
                                    <h3>Scan Below Code</h3>
                                    <img src="<?php echo $row['qr_image'] ?>" height="250" />
                                </div>
                            </div>
                            <h3 style="color:#049458;">Servicing Asset Receive From vendor</h3>
                            <form action="" method="post" name="add_name" id="receive_entry_form" enctype="multipart/form-data" onsubmit="showFormIsProcessing('receive_entry_form');">
                                <div class="row">
                                    <input name="a_id" type="hidden" value="<?php echo $rowp['id']; ?>" />
                                    <input name="assets_id" type="hidden" value="<?php echo $rowp['assets_id']; ?>" />
                                    <input name="srv_ref" type="hidden" value="<?php echo $rowp['srv_no']; ?>" />
                                    <input name="assets_slno" type="hidden" value="<?php echo $rowp['assets_slno']; ?>" />
                                    <div class="col-md-2">
										<div class="form-group">
											<label>Bill No</label>
											<?php 
												$store_id	=	$_SESSION['logged']['store_id'];
												$sql	=	"SELECT * FROM store WHERE `id`='$store_id'";
												$result = mysqli_query($conn, $sql);
												$row=mysqli_fetch_array($result);
												$short_name = $row['keyword'];
												$mrrcode= $short_name.'-INV-';
											?>
											<input type="text" name="bill_no" id="sl_no" class="form-control" value="<?php echo getDefaultCategoryCodeByStore('inv_services_bill', 'bill_no', '03d', '001', $mrrcode) ?>" readonly>
										</div>
									</div>
                                    <div class="col-xs-2">
                                        <div class="form-group">
                                            <label>Date</label>
                                            <input name="bill_date" type="text" class="form-control" id="bill_date" value="" size="30" autocomplete="off" required />
                                        </div>
                                    </div>
									<div class="col-sm-2">
										<div class="form-group">
											<label for="sel1">Bill Amount:</label>
											 <input class="form-control" name="amount" type="number" value="" />
										</div>
									</div>
									<div class="col-xs-3">
                                        <div class="form-group">
                                            <?php 
                                                $product_id= $row['id'];
                                                $sql2   = "SELECT * FROM product_assign WHERE product_id=$product_id ORDER BY id DESC LIMIT 1 ;";
                                                $result2 = mysqli_query($conn, $sql2);
                                                $row2=mysqli_fetch_array($result2);
                                                ?>
                                            <label>Vendor</label>
                                            <?php 
                                                $vendor_id = $rowp['vendor'];
                                                $sqlvendor  = "select * from `vendors` where `vendor_id`='$vendor_id'";
                                                $resultvendor = mysqli_query($conn, $sqlvendor);
                                                $rowvendor=mysqli_fetch_array($resultvendor);
                                            ?>
                                            <input name="" type="text" class="form-control" id="" value="<?php echo $rowvendor['vendor_name']; ?>" readonly />
											<input name="vendor_id" type="hidden" class="form-control" id="" value="<?php echo $rowvendor['vendor_id']; ?>" readonly />
                                        </div>
                                    </div>
									<div class="col-sm-2">
										<div class="form-group">
											<label for="sel1">Division:</label>
											 <input type="text" class="form-control" value="<?php echo getDivisionNameById($division_id); ?>" readonly />
											 <input name="division_id" type="hidden" value="<?php echo $division_id; ?>" />
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
											<label for="sel1">Department:</label>
											 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($department_id); ?>" readonly />
											 <input name="department_id" type="hidden" value="<?php echo $department_id; ?>" />
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<label>Store</label>
											<?php 
												$store_id = $_SESSION['logged']['store_id'];
												$sqlstore	= "select * from `store` where `id`='$store_id'";
												$resultstore = mysqli_query($conn, $sqlstore);
												$rowstore=mysqli_fetch_array($resultstore);
											?>
											<input name="" type="text" class="form-control" id="laptop" value="<?php echo $rowstore['name']; ?>" size="30" required readonly />
											<input name="store_id" type="hidden" value="<?php echo $_SESSION['logged']['store_id']; ?>" />
										</div>
									</div>
                                    <div class="col-xs-3">
                                        <div class="form-group">
                                            <label for="id">Receive By</label>
                                            <?php 
                                                $employee_id = $_SESSION['logged']['office_id'];
                                                $sqlemployee    = "select * from `inv_employee` where `employeeid`='$employee_id'";
                                                $resultemployee = mysqli_query($conn, $sqlemployee);
                                                $rowemployee=mysqli_fetch_array($resultemployee);
                                            ?>
                                            <input type="text" class="form-control" id="" value="<?php echo $rowemployee["name"]; ?>" readonly required />
                                            <input name="created_by" type="hidden" id="receive_by" value="<?php echo $rowemployee["employeeid"]; ?>" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="form-group">
                                            <label for="ad">Remarks</label>
                                            <textarea id="remarks" name="remarks" class="form-control" placeholder=""></textarea>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="<?php echo $row2['id'] ?>" />
                                <input type="hidden" name="product_id" value="<?php echo $product_id ?>" />
                                <div class="row">
                                    <div class="col-md-10 mt-4">
                                        <div class="form-group">
                                            <button class="btn btn-danger" type="submit" name="service_update_submit" style="width:100%"> Receive This Product</i></button>
                                        </div>
                                    </div>
                                </div>
                            </form>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<script>
    $(function () {
        $("#bill_date").datepicker({
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