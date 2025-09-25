<div class="col-lg-3 col-xs-6">
	<!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <a href="javascript:void(0)" class="small-box-footer">
                <?php 
                    $table    =   "rlp_info";
                    $status    =   1;
                ?>
                <h3 style="color: white;"><?php echo getDataRowByTableByStatus($table,$status); ?></h3>
                <p style="color: white;">Approved RLP</p>
            </a>
        </div>
        <div class="icon">
            <a href="javascript:void(0)" class="small-box-footer">
                <i class="fa fa-thumbs-up" aria-hidden="true" style="color: white;"></i>
            </a>
        </div>
        <a href="rlp_list.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <a href="javascript:void(0)" class="small-box-footer">
                <?php 
                    $table    =   "rlp_info";
                ?>
                <h3 style="color: white;"><?php echo getDataRowByTableByPending($table); ?></h3>
                <p style="color: white;">Pending RLP</p>
            </a>
        </div>
        <div class="icon">
            <a href="javascript:void(0)" class="small-box-footer">
                <i class="fa fa-shopping-basket" aria-hidden="true" style="color: white;"></i>
            </a>
        </div>
        <a href="rlp_list.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">
	<!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <a href="javascript:void(0)" class="small-box-footer">
                <?php $table    =   "notesheets_master";  ?>
                <h3 style="color: white;"><?php echo getDataRowByTable($table); ?></h3>
                <p style="color: white;">Total Note Sheet</p>
            </a>
        </div>
        <div class="icon">
            <a href="javascript:void(0)" class="small-box-footer">
                <i class="fa fa-sticky-note-o" aria-hidden="true" style="color: white;"></i>
            </a>
        </div>
        <a href="notesheets_list.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>
<div class="col-lg-3 col-xs-6">
	<!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <a href="javascript:void(0)" class="small-box-footer">
                <?php $table    =   "workorders_master";  ?>
                <h3 style="color: white;"><?php echo getDataRowByTable($table); ?></h3>
                <p style="color: white;">Total Work Order</p>
            </a>
        </div>
        <div class="icon">
            <a href="javascript:void(0)" class="small-box-footer">
                <i class="fa fa-first-order" aria-hidden="true" style="color: white;"></i>
            </a>
        </div>
        <a href="workorders_list.php" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
    </div>
</div>


                            <?php 
								$sql = "select * FROM `assets_categories`";
								$result = mysqli_query($conn, $sql);
								while ($row = mysqli_fetch_array($result)) {
							?>
							<div class="col-xl-2 col-md-2">
								<?php
									$store_id = $_SESSION['logged']['store_id'];
									$assets_category	=	$row['assets_id'];
									$sqlpro	=	"select * FROM `ams_products` WHERE `assets_category`='$assets_category'";
									$resultpro = mysqli_query($conn, $sqlpro);
									$procount=mysqli_num_rows($resultpro);
								?>
								<div class="card text-white mb-4" style="margin:2px;padding:5px;border:1px solid gray;border-radius:5px;">
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
							<?php } ?>
                  
