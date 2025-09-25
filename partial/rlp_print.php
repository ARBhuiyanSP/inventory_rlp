<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    $rlp_id         =   $_GET['rlp_id'];    
    $rlp_details    =   getRlpDetailsData($rlp_id);   
    $rlp_info       =   $rlp_details['rlp_info'];
    $rlp_details    =   $rlp_details['rlp_details'];
?>
<style>
.table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td{
	border: 1px solid #000000;
}
</style>
<!-- Main content -->
<section class="invoice" id="printableArea">
    <!-- title row
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <h2 class="page-header">
                <i class="fa fa-globe"></i> RLP Details.
                <small class="pull-right">Priority: <?php //echo getPriorityName($rlp_info->priority) ?></small>
            </h2>
        </div>
    </div> 
        .col -->
    <!-- info row -->
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-bottom:20px;">
			<center>
				<h3><?php //echo getDivisionNameById($rlp_info->request_division) ?></h3>
				<p><?php //echo getDivisionAddressById($rlp_info->request_division) ?></p>
			</center>
		</div>
		<div class="col-sm-12">	
					<center>
						<p>
							<img src="images/Saif_Engineering_Logo_165X72.png" height="50px;"/><br>
							<h2>SAIF POWERTEC LIMITED</h2>
							<h5>KAMALAPUR ICD MOTIJHEEL, DHAKA</h5>
							<p>DEPARTMENT:CTED-DHAKA(MAINTENANCE)KAMALAPUR ICD, PROJECT</p>
						</p>
					</center>
				</div>
        <div class="col-md-6 col-sm-6">
            From
            <address>
                <strong>Name:&nbsp;<?php echo $rlp_info->request_person ?></strong><br>
                <!-- Designation:&nbsp;<?php// echo getDesignationNameById($rlp_info->designation) ?><br> -->
                Division:&nbsp;<?php echo getDivisionNameById($rlp_info->request_division) ?><br>
                Department:&nbsp;<?php echo getDepartmentNameById($rlp_info->request_department) ?><br>
                Project:&nbsp;<?php echo getProjectNameById($rlp_info->request_project) ?><br>
                <!--- Contact:&nbsp;<?php //echo $rlp_info->contact_number ?><br>
                Email:&nbsp;: <?php //echo $rlp_info->email ?> -->
            </address>
        </div>
        <!-- /.col -->
        <div class="col-md-6 col-sm-6">
            <div class="pull-right" style="text-align:right">
                <b>RLP NO: &nbsp;<span style="border:1px solid;padding:2px 5px;"><?php echo $rlp_info->rlp_no ?></span></b><br>
                <b>Request Date:</b> <?php echo human_format_date($rlp_info->created_at) ?><br><br>
                <b>Current Status: &nbsp;<span style="border:1px solid;padding:2px 5px;"><?php echo get_status_name($rlp_info->rlp_status) ?></span></b><br>
            </div>            
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
        <div class="col-sm-12 table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item Name</th>
                        <th>Part No</th>
                        <th>Specification</th>
                        <th>Purpose of Purchase</th>
                        <th>Qty</th>
                        <th>Unit</th>
                        <th>Unit price</th>
                        <th>Amount</th>
                        <th>Supplier</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
						$sl =   1;
						$total = 0;
                        foreach($rlp_details as $data){
							$total += $data->amount;
                    ?>
                    <tr>
                        <td><?php echo $sl++; ?></td>
                        <td><?php echo getMaterialNameByIdAndTableandId('inv_material',$data->material_name); ?></td>
                        <td><?php echo $data->part_no; ?></td>
                        <td><?php echo getSpecById($data->material_name); ?></td>
                        <td><?php echo $data->purpose; ?></td>
                        <td><?php echo $data->quantity; ?></td>
						<td><?php 
								$dataresult =   getDataRowByTableAndId('inv_item_unit', $data->unit);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->unit_name : '');
								?></td>
                        <td><?php echo $data->unit_price; ?></td>
                        <td><?php echo $data->amount; ?></td>
                        <td><?php echo getSupplierNameByIdAndTable('vendors',$data->supplier); ?></td>
                    </tr>
                        <?php } ?>
					<tr>
                        <td colspan="8" style="text-align:right;"><b>Total</b></td>
                        <td><?php echo $total;  ?></td>
                        <td></td>
                    </tr>
					<tr>
                        <td colspan="10"><?php echo $rlp_info->user_remarks;  ?></td>
                    </tr>
                </tbody>
            </table>
			<!--<div class="row">
				<div class="col-md-6 col-sm-6"></div>
				<div class="col-md-6 col-sm-6">
					<table class="table table-striped table-bordered">
						<tr>
							<td><b>Other Cost Name</b></td>
							<td><b>Amount</b></td>
						</tr>
						<?php 
							$totalOtherCost = 0;
							$rlp_info_id = $rlp_info->id;
							$sqlother	=	"select * from `rlp_other_cost` where `rlp_info_id`='$rlp_info_id'";
							$resultother = mysqli_query($conn, $sqlother);
							while ($rowother = mysqli_fetch_array($resultother)) {
								$totalOtherCost += $rowother['oc_amount'];
								
						?>
						<tr>
							<td><?php echo $rowother['oc_name']; ?></td>
							<td><?php echo $rowother['oc_amount']; ?></td>
						</tr>
						<?php } ?>
						<tr>
							<td style="text-align:right;"><b>Total</b></td>
							<td><?php echo $totalOtherCost; ?></td>
						</tr>
					</table>
				</div>
			</div>--->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
	<div class="row">
					<div class="col-sm-3 col-xs-3" style="padding-top:100px;">
						<center><img src="images/signatures/<?php echo getSignatureByUserId($rlp_info->created_by); ?>" height="70px"/></br><?php echo getUserNameByUserId($rlp_info->created_by); ?></br>________________________</br><?php echo getDesignationByUserId($rlp_info->created_by) ?> [Requested By]</center>
					</div>
					<?php
					$table = "rlp_acknowledgement WHERE rlp_info_id=$rlp_id";
					$order = 'ASC';
					$column = 'ack_request_date';
					$allRemarksHistory = getTableDataByTableName2($table, $order, $column);
						if (isset($allRemarksHistory) && !empty($allRemarksHistory)) {
						foreach ($allRemarksHistory as $dat) {
					
					if(get_status_name($dat->ack_status)=='Approve' || get_status_name($dat->ack_status)=='Recommended'){ ?>
					<div class="col-sm-3 col-xs-3" style="padding-top:100px;">
						<center><img src="images/signatures/<?php echo getSignatureByUserId($dat->user_id); ?>" height="70px"/></br><?php echo getUserNameByUserId($dat->user_id) ?></br>________________________</br><?php echo getDesignationByUserId($dat->user_id) ?></center>
					</div>
					<?php } 
					}
				}
				?>			
			</div>
    <!-- /.row -->
	
</section>
	<div class="row">
		<div class="col-sm-12">
			<center>
				<a class="btn btn-app" onclick="printDiv('printableArea')" value="print a div!">
					<i class="fa fa-print"></i> Print 
				</a>
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
<!-- /.content -->
<div class="clearfix"></div>