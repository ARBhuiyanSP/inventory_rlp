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
        <div class="card-body" id="printableArea">
                       <?php
								$sql	=	"select * from ams_products where id=$id";
								$result = mysqli_query($conn, $sql);
								$row=mysqli_fetch_array($result);
								?>
                                <table width='100%'>				
									<tr>
										<td style="text-align:center">
											<div class="headbody">
												<h1 align="center"><img src="images/spl.png" width="162" height=""></h1>
												<h2 align="center">SAIF POWER GROUP</h2>
												<p align="center">Rupayan Centre(8th Floor),72, Mohakhali C/A,Dhaka-1212,Bangladesh</p>
												<h3 align="center">Assets Details</h3>
												<h1 align="center"><img src="<?php echo $row['qr_image'] ?>" height="200" /></h1>
											</div>
										</td>
									</tr>
								</table>
								<table class="table table-bordered">
									<tr>
										<th>Product Photo:</th>
										<td><img src="products_photo/<?php if($row['pro_photo']==''){echo "blank.png";}else{echo $row['pro_photo'];} ?>" height="100" /></td>
									</tr>
									<tr>
										<th>Item Name:</th>
										<td><?php echo $row['item_name'] ?></td>
									</tr>
									<tr>
										<th>Item Description:</th>
										<td><?php echo $row['assets_description'] ?></td>
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
										<th>Manufacturing SL No:</th>
										<td><?php echo $row['manu_sl'] ?></td>
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
											<?php 
												$vendor_id = $row['vendor_name'];
												$sqlvendor	= "select * from `vendors` where `vendor_id`='$vendor_id'";
												$resultvendor = mysqli_query($conn, $sqlvendor);
												$rowvendor=mysqli_fetch_array($resultvendor);
											?>
										<td><?php echo $rowvendor['vendor_name']; ?></td>
									</tr>
									<tr>
										<th>Purchase Date:</th>
										<td><?php echo $row['puchase_date']; ?></td>
									</tr>

									<tr>
										<th>Item Received in:</th>
										<td><?php
													$store_id = $row['store_id'];
													$sqlstore	= "select * from `store` where `id`='$store_id'";
													$resultstore = mysqli_query($conn, $sqlstore);
													$rowstore=mysqli_fetch_array($resultstore);
												echo $rowstore['name']; 
											?> </td>
									</tr>
									<tr>
										<th>Transferred in / Current Location:</th>
										<td>
											<?php
													$store_id = $row['current_store'];
													$sqlstore	= "select * from `store` where `id`='$store_id'";
													$resultstore = mysqli_query($conn, $sqlstore);
													$rowstore=mysqli_fetch_array($resultstore);
												echo $rowstore['name']; 
											?> 
										</td>
									</tr>
									<tr>
										<th>Custody:</th>
										<td><?php echo $row['custody']; ?></td>
									</tr>
									<tr>
										<th>User:</th>
											<?php if($row['assign_status']=='assigned'){ 
											$products_id	=	$row['id'];
												$sqlassign	= "select * FROM `product_assign` WHERE `product_id`='$products_id' ORDER BY `id` DESC LIMIT 1 ";
												$resultassign = mysqli_query($conn, $sqlassign);
												$rowassign=mysqli_fetch_array($resultassign);
												
													$employee_id = $rowassign['employee_id'];
													$sqlemployee	= "select * from `inv_employee` where `employeeid`='$employee_id'";
													$resultemployee = mysqli_query($conn, $sqlemployee);
													$rowemployee=mysqli_fetch_array($resultemployee);
											?>
										<td><?php echo $rowemployee['employeeid']; ?> || <?php echo $rowemployee["name"]; ?> || <?php echo $rowemployee["division"]; ?>-<?php echo $rowemployee["department"]; ?></td>
											<?php }else{ ?>
										<td>---</td>
										<?php } ?>
									</tr>
								</table>
						
                <!-- /.row -->
					
                    <!-- /.box-body -->
					<center>
						<button class="btn btn-primary" onclick="printDiv('printableArea')"><i class="fa fa-print"></i> Print</button>
						<button class="btn btn-primary mx-2 px-3" onclick="window.location.href = 'assets-list.php'" role="button"><i class="fa fa-outdent"></i> Back To Products Lis</button>
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