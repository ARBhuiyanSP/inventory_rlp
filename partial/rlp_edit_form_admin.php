
<form action="" method="post">
    <div class="row" style="background-color:#CDEFF7;">
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Division:</label>
				<input type="text" class="form-control" value="<?php echo getDivisionNameById($rlp_info->request_division) ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $rlp_info->request_division; ?>" />
				
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Department:</label>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($rlp_info->request_department) ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $rlp_info->request_department; ?>" />
				
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Project:</label>
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($rlp_info->request_project) ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $rlp_info->request_project; ?>" />
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Warehouse:</label>
				 <input type="text" class="form-control" value="<?php echo getWarehouseNameById($rlp_info->request_warehouse) ?>" readonly />
				 <input name="request_warehouse" type="hidden" value="<?php echo $rlp_info->request_warehouse; ?>" />
				 
			</div>
		</div>
		<div class="col-sm-2">
            <div class="form-group">
                <label for="exampleId">RLP Type</label>
                
				<input type="text" class="form-control" name=""  value="<?php 
								if($rlp_info->rlp_type=='1')
								{
									echo "General RLP";
								}else if($rlp_info->rlp_type=='2'){
									echo "Stationary RLP";
								}else if($rlp_info->rlp_type=='4'){ 
									echo "Battery Stationary RLP";
								}else if($rlp_info->rlp_type=='3'){
									echo "EHS RLP";
								} else {
									echo "---";
								}
							?>" readonly>
				
                <input type="hidden" class="form-control" name="rlp_type"  value="<?php echo $rlp_info->rlp_type; ?>" readonly>
				
            </div>
		</div>
	
		<div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="date" type="text" class="form-control" id="rlpdate" value="<?php echo $rlp_info->request_date; ?>" size="30" autocomplete="off" required />
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Priority</label>
                <div class="radio">
                    <?php
                        $priorities     =   get_priorities();
                        if(isset($priorities) && !empty($priorities)){
                            foreach($priorities as $priority){
                    ?>
                            <label><input type="radio" name="priority" value="<?php echo $priority->id; ?>" required <?php if($priority->id == $rlp_info->priority){echo 'checked';} ?>>                                
                                <span class="label btn-sm btn-<?php echo $priority->color_code; ?>"><?php echo $priority->name; ?></span>
                            </label>
                    <?php
                    } 
                        }
                    ?>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">RLP No</label>
                <div class="rlpno_style" style="background-color:green;color:#fff;padding:2px;"><?php echo $rlp_info->rlp_no; ?></div>
                <input type="hidden" name="rlp_no" value="<?php echo $rlp_info->rlp_no; ?>">
                <input type="hidden" name="id" value="<?php echo $rlp_info->id; ?>">
            </div>
        </div>
    </div>
	
	            	
					<div class="row" id="div1"  style="">
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
											<select class="form-control select2" id="material_name<?php echo $key; ?>" name="material_name[]" required onchange="getAppendItemCodeByParam('<?php echo $key; ?>', 'inv_material', 'material_id_code', 'material_id', 'unit_id');">
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
											<select class="form-control" id="unit<?php echo $key; ?>" name="unit[]" required>
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
										
										<td><input type="text" name="purpose[]" id="purpose<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->purpose) && !empty($editDatas->purpose) ? $editDatas->purpose : ''); ?>"></td>
										<td><input type="text" name="quantity[]" id="quantity<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo (isset($editDatas->quantity) && !empty($editDatas->quantity) ? $editDatas->quantity : ''); ?>"></td>
										<td><input type="text" name="unit_price[]" id="unit_price<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo (isset($editDatas->unit_price) && !empty($editDatas->unit_price) ? $editDatas->unit_price : ''); ?>"></td>
										<td><input type="text" name="amount[]" id="sum<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->amount) && !empty($editDatas->amount) ? $editDatas->amount : ''); ?>"></td>
										<?php if ($key == 0) { ?>
                                                    <td><button type="button" name="add" id="add" class="btn" style="background-color:#2e3192;color:#ffffff;">+</button></td>
                                            <?php } else { ?>
                                                    <td><button type="button" name="remove" id="<?php echo $key; ?>" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td>
                                            <?php } ?>
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
									<td width="80%" style="text-align:right;">Total Amount</td>
									<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsum" readonly /></td>
								</tr>
							</table>
                        </div>
                    </div>
					<!-- <div class="col-md-4">
						<?php //include('partial/other_cost.php'); ?>
                    </div> -->
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
								
    <div class="row" style="background-color:#CDEFF7;">
        <div class="col-md-12">
            <div class="form-group">
                <label for="exampleId">Remarks</label>
                <textarea class="form-control" id="remarks" name="remarks"><?php echo $rlp_info->user_remarks; ?></textarea>
            </div>
        </div>
    
        <div class="col-md-12">
            <?php //echo get_user_project_wise_rlp_chain_for_create(); 
			
			$division_id 	= $rlp_info->request_division;
			$department_id 	= $rlp_info->request_department;
			$type 			= $rlp_info->rlp_type;
			echo get_type_wise_rlp_chain_for_create($division_id, $department_id,$type); 
			
			?>
        </div>
   
        <div class="col-sm-12">
            <input type="submit" name="rlp_update" id="submit" class="btn btn-block btn-primary" value="UPDATE" />
        </div>
    </div>
</form>


