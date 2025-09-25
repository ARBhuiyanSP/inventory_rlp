<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    // if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id']))
    if(!empty($_SESSION['logged']['branch_id'])){
?>


<form action="" method="post">
    <div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Division:</label>
				 <?php if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="branch_id" name="request_division" onchange="getDepartmentByBranch(this.value);">
					<option value="">Please select</option>
					<?php
					$table = "branch";
					$order = "ASC";
					$column = "name";
					$datas = getTableDataByTableName($table, $order, $column);
					foreach ($datas as $data) {
						?>
						<option value="<?php echo $data->id; ?>"><?php echo $data->name; ?></option>
					<?php } ?>
				</select>
				 <?php } else{?>
				 <input type="text" class="form-control" value="<?php echo getDivisionNameById($_SESSION['logged']['branch_id']); ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $_SESSION['logged']['branch_id']; ?>" />
				 <?php } ?>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Department:</label>
				<?php if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="department_id" name="request_department">
					<option value="">Please select</option>
					<?php
					$table = "department";
					$order = "ASC";
					$column = "name";
					$datas = getTableDataByTableName($table, $order, $column);
					foreach ($datas as $data) {
						?>
						<option value="<?php echo $data->id; ?>"><?php echo $data->name; ?></option>
					<?php } ?>
				</select>
				<?php } else{?>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($_SESSION['logged']['department_id']); ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $_SESSION['logged']['department_id']; ?>" />
				 <?php } ?>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Project:</label>
				<?php if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="project_id" name="request_project">
					<option value="">Please select</option>
					<?php
					$table = "projects";
					$order = "ASC";
					$column = "project_name";
					$datas = getTableDataByTableName2($table, $order, $column);
					foreach ($datas as $data) {
						?>
						<option value="<?php echo $data->id; ?>"><?php echo $data->project_name; ?></option>
					<?php } ?>
				</select>
				<?php } else{?>
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($_SESSION['logged']['project_id']); ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $_SESSION['logged']['project_id']; ?>" />
				 <?php } ?>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Warehouse:</label>
				<?php if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="project_id" name="request_warehouse">
					<option value="">Please select</option>
					<?php
					$table = "projects";
					$order = "ASC";
					$column = "inv_warehosueinfo";
					$datas = getTableDataByTableName2($table, $order, $column);
					foreach ($datas as $data) {
						?>
						<option value="<?php echo $data->id; ?>"><?php echo $data->name; ?></option>
					<?php } ?>
				</select>
				<?php } else{?>
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($_SESSION['logged']['warehouse_id']); ?>" readonly />
				 <input name="request_warehouse" type="hidden" value="<?php echo $_SESSION['logged']['warehouse_id']; ?>" />
				 <?php } ?>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="date" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" size="30" autocomplete="off" required />
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
                            <label><input type="radio" name="priority" value="<?php echo $priority->id; ?>" required>                                
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
                <?php
				
				$prefix="RLP";
				$formater_length=3;				
				$division_id    =   $_SESSION['logged']['branch_id'];
				$department_id  =   $_SESSION['logged']['department_id'];
				$office_id      =   $_SESSION['logged']['office_id'];
				$user_id        =   $_SESSION['logged']['user_id']; 
							
				$rlpNo    =   get_rlp_no($prefix,$formater_length); ?>
                <div class="rlpno_style" style="background-color:green;color:#fff;padding:2px;"><?php echo $rlpNo; ?></div>
                <input type="hidden" name="rlp_no" value="<?php echo $rlpNo; ?>">
            </div>
        </div>
    </div>
	
	            	
					<div class="row" id="div1"  style="">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dynamic_field">
                                <thead>
                                <th width="30%">Material Name<span class="reqfield"> ***required</span></th>
                                <th>Material ID</th>
                                <th width="10%">Unit</th>
                                <th>Part No</th>
                                <th>Purpose</th>
                                <th>Qty<span class="reqfield"> ***required</span></th>
                                <th>Unit Price<span class="reqfield"> ***req</span></th>
                                <th>Amount</th>
                                <th></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <select class="form-control material_select_2" id="material_name" name="material_name[]" required onchange="getItemCodeByParam(this.value, 'inv_material', 'material_id_code', 'material_id0', 'qty_unit', 'part_no');">
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
                                        <td><input type="text" name="material_id[]" id="material_id0" class="form-control" required readonly></td>
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
                                        <td><input type="text" name="part_no[]" id="part_no0" class="form-control" readonly></td>
                                        <td><input type="text" name="purpose[]" id="purpose0" class="form-control"></td>
                                        <td><input type="text" name="quantity[]" id="quantity0" onchange="sum(0)" class="form-control" required></td>
                                        <td><input type="text" name="unit_price[]" id="unit_price0" onchange="sum(0)" class="form-control" required></td>
                                        <td><input type="text" name="amount[]" id="sum0" class="form-control"></td>
                                        <td><button type="button" name="add" id="add" class="btn" style="background-color:#2e3192;color:#ffffff;">+</button></td>
                                    </tr>
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
					<script>
    var i = 0;
    $(document).ready(function () {
        $('#add').click(function () {
            i++;
            $('#dynamic_field').append('<tr id="row' + i + '"><td><select class="form-control material_select_2" id="material_name' + i + '" name="material_name[]' + i + '" required onchange="getAppendItemCodeByParam(' + i + ",'inv_material'," + "'material_id_code'," + "'material_id'," + "'qty_unit'" + ')"><option value="">Select</option><?php
                                                $projectsData = get_product_with_category();
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?><option value="<?php echo $data['id']; ?>"><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?> - <?php echo $data['item_code']; ?></option><?php }
                                                }
                                                ?></select></td><td><input type="text" name="material_id[]" id="material_id' + i + '" class="form-control" required readonly></td><td><select class="form-control select2" id="unit' + i + '" name="unit[]' + i + '" required readonly onchange="getAppendItemCodeByParam(' + i + ",'inv_material'" + ",'material_id_code'" + ",'material_id''" + ",'qty_unit'" + ')"><option value="">Select</option><?php
                                                $projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                                                if (isset($projectsData) && !empty($projectsData)) {
                                                    foreach ($projectsData as $data) {
                                                        ?><option value="<?php echo $data['id']; ?>"><?php echo $data['unit_name']; ?></option><?php }
                                                }
                                                ?></select></td><td><input type="text" name="part_no[]" id="part_no' + i + '" class="form-control" readonly></td><td><input type="text" name="purpose[]" id="purpose' + i + '" class="form-control"></td><td><input type="text" name="quantity[]" id="quantity' + i + '" onchange="sum(0)" class="form-control" required></td><td><input type="text" name="unit_price[]" id="unit_price' + i + '" onchange="sum(0)" class="form-control" required></td><td><input type="text" name="amount[]" id="sum' + i + '" class="form-control"></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td></tr>');
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
								
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="exampleId">Remarks</label>
                <textarea class="form-control" id="remarks" name="remarks"></textarea>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?php echo get_user_project_wise_rlp_chain_for_create(); ?>
            <?php //echo get_user_department_wise_rlp_chain_for_create($division_id, $department_id); ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <input type="submit" name="rlp_create" id="submit" class="btn btn-block btn-primary" value="Request" />
        </div>
    </div>
</form>
<div style="display:none;">
    <table id="sample_table">
        <tr id="">
            <td><span class="sn"></span>.</td>
            <td><textarea class="form-control" id="" name="description[]" rows="1" required></textarea></td>
            <td><input type="text" class="form-control" id="" name="purpose[]" value="" size=""  required /></td>
            <td><input type="text" class="form-control" id="" name="quantity[]" value="" size=""  required /></td>
            <td><a class="btn btn-xs delete-record" data-id="0"><i class="glyphicon glyphicon-trash"></i></a></td>
        </tr>
    </table>
</div>


<?php } else{ ?>
 <strong>Attention !</strong> Division and Department are required to create RLP .
<?php } ?>
