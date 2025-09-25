<?php include 'header.php' ?>
<?php if(!check_permission('material-issue-add')){ 
        include("404.php");
        exit();
 } ?>
<!-- Left Sidebar End -->

<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Order Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Order Entry Form</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post" name="add_order" id="issue_entry_form" enctype="multipart/form-data" onsubmit="showFormIsProcessing('issue_entry_form');">
					<div class="row" id="div1" style="">
                        <div class="col-md-6">
							<div class="row">
								<div class="col-md-3">
									<div class="form-group">
										<label>Order Date</label>
										<input type="text" autocomplete="off" name="order_date" id="order_date" class="form-control datepicker" value="<?php echo date('Y-m-d'); ?>">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Order No</label>
										<?php
										if ($_SESSION['logged']['user_type'] == 'whm') {
											$warehouse_id = $_SESSION['logged']['warehouse_id'];
											$sql = "SELECT * FROM inv_warehosueinfo WHERE `id`='$warehouse_id'";
											$result = mysqli_query($conn, $sql);
											$row = mysqli_fetch_array($result);
											$short_name = $row['short_name'];
											$issueCode = 'ON-' . $short_name;
										} else {
											//$issueCode = 'ON-CW-';
											$issueCode = 'ON-';
										}
										?>
										<input type="text" name="" id="" class="form-control" value="<?php echo getDefaultCategoryCode('orders', 'sl_no', '03d', '001', $issueCode) ?>" readonly>
										<input type="hidden" name="sl_no" id="sl_no" value="<?php echo getDefaultCategoryCode('orders', 'sl_no', '03d', '001', $issueCode) ?>">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Customer Name</label>
										<input type="text" name="customer_name" id="customer_name" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>Contact No</label>
										<input type="text" name="customer_contact_no" id="customer_contact_no" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Frame</label>
										<input type="text" name="frame" id="frame" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Frame No</label>
										<input type="text" name="frame_no" id="frame_no" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Colour</label>
										<input type="text" name="colour" id="colour" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Size</label>
										<input type="text" name="size" id="size" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Quality</label>
										<input type="text" name="quality" id="quality" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Lens</label>
										<input type="text" name="lens" id="lens" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Quantity</label>
										<input type="text" name="qty" id="qty" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Date</label>
										<input type="text" name="receive_date" id="receive_date" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>D.Date</label>
										<input type="text" name="delivery_date" id="delivery_date" class="form-control" value="" >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Amount</label>
										<input type="text" name="amount" id="amount" class="form-control" value="" onkeyup="calculate_amount()" required >
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Advance</label>
										<input type="text" name="advance" id="advance" class="form-control" value="0" onkeyup="calculate_amount()">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>Due</label>
										<input type="text" name="due" id="due" class="form-control" value="" readonly >
									</div>
								</div>
							</div>
						</div>
                        <div class="col-md-6">
							<h3>Reading /Distance</h3>
							<div class="row">
								<div class="col-md-12">
								<h5 style="background-color:#E9ECEF;">Right Eye</h5>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>SPH</label>
												<input type="text" name="right_sph" id="right_sph" class="form-control" value="" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>CYL</label>
												<input type="text" name="right_cyl" id="right_cyl" class="form-control" value="" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>AXIS</label>
												<input type="text" name="right_axis" id="right_axis" class="form-control" value="" >
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12">
								<h5 style="background-color:#E9ECEF;">Left Eye</h5>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>SPH</label>
												<input type="text" name="left_sph" id="left_sph" class="form-control" value="" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>CYL</label>
												<input type="text" name="left_cyl" id="left_cyl" class="form-control" value="" >
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>AXIS</label>
												<input type="text" name="left_axis" id="left_axis" class="form-control" value="" >
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
                    </div>
                    <div class="row" style="">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Remarks</label>
                                <textarea id="remarks" name="remarks" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="modal-footer">
                                    <input type="submit" name="order_submit" id="order_submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />
                                </div>    
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <!--here your code will go-->
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<script>
	function  calculate_amount(){
		let amount = parseFloat($('#amount').val());
		let advance = parseFloat($('#advance').val());
		
		let myResult = parseFloat(amount - advance).toFixed(2);

		$('#due').val(myResult);
		
	}
</script>

<script>
    $(function () {
        $("#order_date").datepicker({
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
        $("#receive_date").datepicker({
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
        $("#delivery_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<?php include 'footer.php' ?>