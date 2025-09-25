<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    $rlp_id         =   $_GET['rlp_id'];    
    $rlp_details    =   getRlpDetailsData($rlp_id);   
    $rlp_info       =   $rlp_details['rlp_info'];
    $rlp_details    =   $rlp_details['rlp_details'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
            <h2 class="page-header">
                <i class="fa fa-file"></i> RLP Details.
            </h2>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
        <div class="col-md-4 invoice-col">
            <b>Requested For</b>
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
        <div class="col-md-8 invoice-col">
            <div class="pull-right" style="text-align:right;">
                <b>RLP NO: &nbsp;<span class="rlpno_style"><?php echo $rlp_info->rlp_no ?></span></b><br>
                <b>Request Date:</b> <?php echo human_format_date($rlp_info->created_at) ?><br>
                <b>Priority:</b> <?php echo getPriorityNameDiv($rlp_info->priority) ?><br>
            </div>            
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <form id="rlp_product_supplier_assign_form" action="" method="post">
        <div class="row">
            <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dynamic_field">
                                <thead>
                                <th width="30%">Material Name<span class="reqfield"> *</span></th>
                                <th width="10%">Unit</th>
                                <!-- <th>Part No</th> -->
                                <th>Purpose<span class="reqfield"> *</span></th>
                                <th>Qty<span class="reqfield"> *</span></th>
                                <th>Unit Price<span class="reqfield"> *</span></th>
                                <th>Amount</th>
                                <th>Supplier</th>
                                <th></th>
                                </thead>
                                <tbody>
                                    <?php
                                    $productSerial = 0;
                                    if (isset($rlp_details) && !empty($rlp_details)) {
                                        foreach ($rlp_details as $key => $editDatas) {
                                            $productSerial++;
                                            ?>
									<tr id="row<?php echo $key; ?>">
										<td>
											<select class="form-control select2" id="material_name<?php echo $key; ?>" name="material_name[]" required onchange="getAppendItemCodeByParam('<?php echo $key; ?>', 'inv_material', 'material_id_code', 'material_id', 'unit_id');" <?php if(!is_pro($currentUserId)){ echo 'disabled'; }?>>
												<option value="">Select</option>
												<?php
												$projectsData = get_product_with_category();
												if (isset($projectsData) && !empty($projectsData)) {
													foreach ($projectsData as $data) {
														?>
														<option value="<?php echo $data['id']; ?>"<?php if (isset($editDatas->material_id) && $editDatas->material_id == $data['item_code']) {
											echo 'selected';
										} ?>><?php echo $data['material_name']; ?></option>
														<?php
													}
												}
												?>
											</select>
										</td>
										<input type="hidden" name="material_id[]" id="material_id<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->material_id) && !empty($editDatas->material_id) ? $editDatas->material_id : ''); ?>">
										<td>
											<select class="form-control" id="unit<?php echo $key; ?>" name="unit[]" required <?php if(!is_pro($currentUserId)){ echo 'disabled'; }?>>
												<option value="">Select</option>
												<?php
												$projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
												if (isset($projectsData) && !empty($projectsData)) {
													foreach ($projectsData as $data) {
														?>
														<option value="<?php echo $data['id']; ?>"<?php if (isset($editDatas->unit) && $editDatas->unit == $data['id']) {
											echo 'selected';
										} ?>><?php echo $data['unit_name']; ?></option>
		<?php
	}
}
?>
											</select>
										</td>
										<input type="hidden" name="part_no[]" id="part_no<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->part_no) && !empty($editDatas->part_no) ? $editDatas->part_no : ''); ?>">
										
										<td><input type="text" name="purpose[]" id="purpose<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->purpose) && !empty($editDatas->purpose) ? $editDatas->purpose : ''); ?>" readonly></td>
										<td><input type="text" name="quantity[]" id="quantity<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo (isset($editDatas->quantity) && !empty($editDatas->quantity) ? $editDatas->quantity : ''); ?>" readonly></td>
										<td><input type="text" name="unit_price[]" id="unit_price<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo (isset($editDatas->unit_price) && !empty($editDatas->unit_price) ? $editDatas->unit_price : ''); ?>" readonly></td>
										<td><input type="text" name="amount[]" id="sum<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->amount) && !empty($editDatas->amount) ? $editDatas->amount : ''); ?>" readonly></td>
										
										<td>
											<select class="form-control select2" id="supplier_name<?php echo $key; ?>" name="supplier_name[]" required <?php if(!is_pro($currentUserId)){ echo 'disabled'; }?>>
												<option value="">Select</option>
												<?php
												$projectsData = getTableDataByTableName('vendors');

												if (isset($projectsData) && !empty($projectsData)) {
													foreach ($projectsData as $data) {
														?>
														<option value="<?php echo $data['id']; ?>" <?php if(isset($editDatas->supplier) && $editDatas->supplier ==$data['id']){echo "selected";} ?>><?php echo $data['vendor_name']; ?></option>
														<?php
													}
												}
												?>
											</select></td>
										<!-- <td>
											<input type="hidden" name="supplier_id[]" id="supplier_id<?php //echo $key; ?>" class="form-control" readonly required>
										</td> 
										
										<?php if ($key == 0) { ?>
                                                    <td><button type="button" name="add" id="add" class="btn" style="background-color:#2e3192;color:#ffffff;">+</button></td>
                                            <?php } else { ?>
                                                    <td><button type="button" name="remove" id="<?php echo $key; ?>" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td>
                                            <?php } ?> -->
									</tr>
										<?php }}else{ ?>
									<tr>
                                        <td>
                                            <select class="form-control select2" id="material_name" name="material_name[]" required onchange="getItemCodeByParam(this.value, 'inv_material', 'material_id_code', 'material_id0', 'qty_unit', 'part_no');">
                                                <option value="">Select</option>
                                                <?php
                                                $projectsData = get_product_with_category();
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?>
                                                        <option value="<?php echo $data['id']; ?>"><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?> - <?php echo $data['item_code']; ?></option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <input type="hidden" name="material_id[]" id="material_id0" class="form-control" required readonly>
                                        <td>
                                            <select class="form-control" id="unit0" name="unit[]" required readonly>
                                                <option value="">Select</option>
                                                <?php
                                                $projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?>
                                                        <option value="<?php echo $data['id']; ?>"><?php echo $data['unit_name']; ?></option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <input type="hidden" name="part_no[]" id="part_no0" class="form-control" readonly>
                                        <td><input type="text" name="purpose[]" id="purpose0" class="form-control" required></td>
                                        <td><input type="number" name="quantity[]" id="quantity0" onkeyup="sum(0)" class="form-control" required></td>
                                        <td><input type="number" step=".01" name="unit_price[]" id="unit_price0" onkeyup="sum(0)" class="form-control" value="0" required></td>
                                        <td><input type="text" name="amount[]" id="sum0" class="form-control"></td>
                                        <td><button type="button" name="add" id="add" class="btn" style="background-color:#2e3192;color:#ffffff;">+</button></td>
                                    </tr>
										<?php } ?>
                                </tbody>
                            </table>
							
							<table class="table table-bordered">
								<tr>
									<td width="40%" style="">
									<?php if($rlp_info->is_cs == 1){ ?>
									<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
									<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
									<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

									
									<button type="button" class="btn btn-info btn-block" data-toggle="collapse" data-target="#cs" style="color:#000;font-weight:bold;">Click Here To View CS</button>
									
									<?php } ?>
									</td>
									<td width="40%" style="text-align:right;">Total Amount</td>
									<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsum" readonly /></td>
								</tr>
							</table>
							
							<input type="hidden" name="user_id" value="<?php echo $currentUserId; ?>" /> 
                        </div>
						<?php if($rlp_info->is_cs == 1){ ?>
						
						<div id="cs" class="collapse">
							<?php include 'cs_update_view.php'; ?>
						</div>
						<?php } ?>
                    </div>
	<script>
    var i = <?php echo $productSerial; ?>;
    $(document).ready(function () {
        $('#add').click(function () {
            i++;
            $('#dynamic_field').append('<tr id="row' + i + '"><td><select class="form-control select2" id="material_name' + i + '" name="material_name[]' + i + '" required onchange="getAppendItemCodeByParam(' + i + ",'inv_material'," + "'material_id_code'," + "'material_id'," + "'qty_unit'" + ')"><option value="">Select</option><?php
                                                $projectsData = get_product_with_category();
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?><option value="<?php echo $data['id']; ?>"><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?> - <?php echo $data['item_code']; ?></option><?php }
                                                }
                                                ?></select></td><input type="hidden" name="material_id[]" id="material_id' + i + '" class="form-control" required readonly><td><select class="form-control select2" id="unit' + i + '" name="unit[]' + i + '" required readonly onchange="getAppendItemCodeByParam(' + i + ",'inv_material'" + ",'material_id_code'" + ",'material_id''" + ",'qty_unit'" + ')"><option value="">Select</option><?php
                                                $projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?><option value="<?php echo $data['id']; ?>"><?php echo $data['unit_name']; ?></option><?php }
                                                }
                                                ?></select></td><input type="hidden" name="part_no[]" id="part_no' + i + '" class="form-control" readonly><td><input type="text" name="purpose[]" id="purpose' + i + '" class="form-control" required></td><td><input type="number" name="quantity[]" id="quantity' + i + '" onkeyup="sum(' + i + ')" class="form-control" required></td><td><input type="number" name="unit_price[]" step=".01" value="0" id="unit_price' + i + '" onkeyup="sum(' + i + ')" class="form-control" required></td><td><input type="text" name="amount[]" id="sum' + i + '" class="form-control"></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td></tr>');
												$(".material_select_2").select2();
												$('#quantity' + i + ', #unit_price' + i).change(function () {
                sum(i)
            });
        });

        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
            sum_total();
        });
    });


 $(document).ready(function () {
        //this calculates values automatically 
        sum(0);
    });

    function sum(i) {
        var quantity1 = document.getElementById('quantity' + i).value;
        var unit_price1 = document.getElementById('unit_price' + i).value;
        var result = parseFloat(quantity1) * parseFloat(unit_price1);
        if (!isNaN(result)) {
            document.getElementById('sum' + i).value = result;
        }
        sum_total();
    }
    function sum_total() {
        var newTot = 0;
        for (var a = 0; a <= i; a++) {
            aVal = $('#sum' + a);
            if (aVal && aVal.length) {
                newTot += aVal[0].value ? parseFloat(aVal[0].value) : 0;
            }
        }
        document.getElementById('allsum').value = newTot.toFixed(2);
    }
  
</script>



            <!-- /.col -->
            <?php //if(!is_member($currentUserId)){ ?>
            <div class="col-md-6">
                <h3>Ask For More Details Before Approval</h3>
                <div class="form-group">
                    <textarea class="form-control" rows="3" name="queries"></textarea>
                </div>
                
                <input type="hidden" name="rlp_info_id" value="<?php echo $_GET['rlp_id'] ?>" />
                <input type="hidden" name="user_id" value="<?php echo $currentUserId; ?>" /> 
                <input class="form-control btn btn-success btn-block" type="submit" name="query_submit" value="Ask For More" />
            </div>       
            <?php //} ?>

            <div class="col-md-6">
    <h4>Queries History<hr></h4>
    <div id="remarks_history_section">        
        <!-- /.box-comment -->
        <div class="box-footer box-comments">
        <?php
        $table = "rlp_queries WHERE rlp_info_id=$rlp_id";
        $order = 'DESC';
        $column = 'query_date';
        $allQueriesHistory = getTableDataByTableNameRlp($table, $order, $column);
        if (isset($allQueriesHistory) && !empty($allQueriesHistory)) {
            foreach ($allQueriesHistory as $dat) {
                ?>
                <div class="box-comment">
                  <div class="comment-text" style="margin-left: 0;">
                      <span class="username">
                        By <?php echo getUserNameByUserId($dat->user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($dat->query_date) ?></span>
                      </span><!-- /.username -->
                  <?php echo $dat->queries ?>
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
                <?php
            } // foreach
        }
            ?>
            <div class="box-comment">
                <div class="comment-text" style="margin-left: 0;">
                    <span class="username">
                        By <?php echo getUserNameByUserId($rlp_info->rlp_user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($rlp_info->created_at) ?></span>
                    </span><!-- /.username -->
                    <?php echo $rlp_info->user_remarks ?>
                </div>
                <!-- /.comment-text -->
            </div>
        </div>
    </div>
</div>

        </div>
    </form>
	<div style="display:none;">
		<table id="sample_table">
			<tr id="">
				<td><span class="sn"></span>.</td>
				<td><input type="text" class="form-control" id="" name="description[]" value="" size=""  required /></td>
				<td><input type="text" class="form-control" id="" name="purpose[]" value="" size=""  required /></td>
				<td><input type="text" class="form-control" id="" name="quantity[]" value="" size=""  required /></td>
				<td><input type="text" class="form-control" id="" name="estimatedPrice[]" value="" size=""  required /></td>
				<td><a class="btn btn-xs delete-record" data-id="0"><i class="glyphicon glyphicon-trash"></i></a></td>
			</tr>
		</table>
	</div>
    <!-- /.row -->
    <?php
    //$role       =   get_role_group_short_name();
	$role_id            =   $_SESSION['logged']['role_id'];    
    $role         =   get_role_shortcode_by_role_id($role_id);
    
    if(is_super_admin($currentUserId)){
        include 'rlp_update_view_sa.php';
    }elseif($role    ==  "sa"){
        include 'rlp_update_view_sa.php';
    }elseif($role    ==  "ak"){
        include 'rlp_update_view_dh.php';
    }elseif($role    ==  "ab"){
        include 'rlp_update_view_ab.php';
    }elseif($role    ==  "pro"){
        include 'rlp_update_view_dh.php';
    }elseif($role    ==  "mb"){
        include 'rlp_update_view_member.php';
    }else{
        include 'rlp_update_view_ab.php';
    }
    ?>
</section>
<!-- /.content -->
<div class="clearfix"></div>
<script>
    
$(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
            
        });
</script>