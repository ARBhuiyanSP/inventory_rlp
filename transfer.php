<?php 
include 'header.php';
include 'includes/assign_process.php';
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
        <li class="breadcrumb-item active">Assets Transfer to New user</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            User Entry
            <a href="assets-list.php" style="float:right"><i class="fas fa-list"></i> Assets List</a></div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="row">
									<div class="col-md-6">
											<?php
											$id = $_GET['id'];
											$sql	=	"select * from ams_products where id=$id";
											$result = mysqli_query($conn, $sql);
											$row=mysqli_fetch_array($result);
											?>
										<table style="" class="table table-bordered">
											<tr>
												<th></th>
												<td><img src="<?php echo $row['qr_image'] ?>" height="100" /></td>
											</tr>
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

										<button class="btn btn-info" onclick="window.location.href = 'assign-list.php'"><i class="fa fa-outdent"></i> Back To Assign List</button>
									</div>
									<div class="col-md-6">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<?php 
														$product_id= $row['id'];
														$sql2	= "SELECT * FROM product_assign WHERE product_id=$product_id ORDER BY id DESC LIMIT 1 ;";
														$result2 = mysqli_query($conn, $sql2);
														$row2=mysqli_fetch_array($result2);
														?>
													<label>Current User</label>
													<?php 
													$employee_id=$row2['employee_id'];
													$sql3	= "SELECT * FROM `inv_employee` WHERE `employeeid`='$employee_id' ;";
													$result3 = mysqli_query($conn, $sql3);
													$row3=mysqli_fetch_array($result3);
													?>
													<input name="employee_id" type="text" class="form-control" id="" value="<?php echo $row3['name'] ?>" readonly />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Using From</label>
													<input name="assign_date" type="text" class="form-control" id="" value="<?php echo $row2['assign_date'] ?>" readonly />
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label>Remarks</label>
													<input name="remarks" type="text" class="form-control" id="" value="<?php echo $row2['remarks'] ?>" readonly />
												</div>
											</div>
										</div>
										<h3 style="color:red;">Want To Transfer This Product ?</h3>
										<form action="" method="post" name="add_name" id="receive_entry_form" enctype="multipart/form-data" onsubmit="showFormIsProcessing('receive_entry_form');">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<?php 
															$product_id= $row['id'];
															$sql2	= "SELECT * FROM `product_assign` WHERE `product_id`='$product_id' ORDER BY `id` DESC LIMIT 1 ;";
															$result2 = mysqli_query($conn, $sql2);
															$row2=mysqli_fetch_array($result2);
															?>
														<label>Transfer To</label>
														<select id="dv" name="employee_id" class="form-control select2" required >
															<option value="">Select Employee</option>
															<?php 
															$sql	= "select * from inv_employee ORDER BY id ASC";
															$result = mysqli_query($conn, $sql);
															while($row=mysqli_fetch_array($result))
																{
															?>
															<option value="<?php echo $row['employeeid'] ?>">
															<?php echo $row['name'] ?>-<?php echo $row['employeeid'] ?></option>
															<?php } ?>
														</select>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label>Transfer Date</label>
														<input name="assign_date" type="text" class="form-control" id="rndate" value=""  autocomplete="off" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label for="ad">Remarks</label>
														<textarea id="ad" name="remarks" class="form-control" placeholder=""></textarea>
													</div>
												</div>
											</div>
											<input type="hidden" name="id" value="<?php echo $row2['id'] ?>" />
											<input type="hidden" name="product_id" value="<?php echo $product_id ?>" />
											<div class="row">
												<div class="col-md-12 mt-4">
													<div class="form-group">
														<button class="btn btn-danger" type="submit" id="transfer_submit" name="transfer_submit" style="width:100%"> Transfer This Product</i></button>
													</div>
												</div>
											</div>
										</form>
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