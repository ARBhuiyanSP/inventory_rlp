<?php include 'header.php';
$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
 ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<script>
$(document).ready(function() {
    $('.js-example-basic-single').select2();
});
</script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>



<div class="container-fluid">
<!-- Breadcrumbs-->
        <!-- Icon Cards-->
		
        <div class="row" style="padding-bottom:10px;">
			<div class="col-lg-12 col-md-12"><center><h1><?= $settings['name']; ?></h1></center></div>
                            <!-- <?php 
								$sql = "select * FROM `assets_categories`";
								$result = mysqli_query($conn, $sql);
								while ($row = mysqli_fetch_array($result)) {
							?>
						
							<div class="col-lg-2 col-md-2">
								<?php
									$store_id = $_SESSION['logged']['store_id'];
									$assets_category	=	$row['assets_id'];
									$sqlpro	=	"select * FROM `ams_products` WHERE `assets_category`='$assets_category'";
									$resultpro = mysqli_query($conn, $sqlpro);
									$procount=mysqli_num_rows($resultpro);
								?>
								<div class="card mb-4" style="margin:2px;padding:5px;border:1px solid gray;border-radius:5px;">
                                    <div class="card-body"><span style="background-color:#AF4940;color:#ffffff;padding:3px;border-radius:5px;"><?php echo $row['assets_category']; ?></span>
										</br><small>Total Item <i class="fa fa-chevron-circle-right" aria-hidden="true"></i> <?php echo $procount; ?></small>
										<?php
											$store_id = $_SESSION['logged']['store_id'];
											$assets_category	=	$row['assets_id'];
											$sqlstock	=	"select * FROM `ams_products` WHERE `assets_category`='$assets_category' AND `assign_status`!='assigned'";
											$resultstock = mysqli_query($conn, $sqlstock);
											$stockcount=mysqli_num_rows($resultstock);
										?>
										</br><small> Instock <i class="fa fa-chevron-circle-right" aria-hidden="true"></i> <?php echo $stockcount; ?></small>
									</div>
                                    <div class="card-footer">
                                        <a class="btn btn-xs btn-info text-black" href="assets-list.php">View Details</a>
                                    </div>
                                </div>
                            </div>
							<?php } ?> -->
						</div>
					</div>
      <!-- /.container-fluid -->
<?php include 'footer.php' ?>