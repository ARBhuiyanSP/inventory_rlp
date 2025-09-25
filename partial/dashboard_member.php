<div class="col-lg-4 col-xs-6">
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
<div class="col-lg-4 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-aqua">
        <div class="inner">
            <a href="javascript:void(0)" class="small-box-footer">
                <?php 
                    $table = "rlp_info";
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
