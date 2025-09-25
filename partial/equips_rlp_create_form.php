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
				<!--  <?php //if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="branch_id" name="request_division" onchange="getDepartmentByBranch(this.value);">
					<option value="">Please select</option>
					<?php
					/* $table = "branch";
					$order = "ASC";
					$column = "name";
					$datas = getTableDataByTableName($table, $order, $column);
					foreach ($datas as $data) { */
						?>
						<option value="<?php// echo $data->id; ?>"><?php //echo $data->name; ?></option>
					<?php //} ?>
				</select> -->
				 <?php //} else{?>
				 <input type="text" class="form-control" value="<?php echo getDivisionNameById($_SESSION['logged']['branch_id']); ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $_SESSION['logged']['branch_id']; ?>" />
				 <?php //} ?>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Department:</label>
				<?php// if (is_super_admin($currentUserId)) { ?>
				<!-- <select class="form-control" id="department_id" name="request_department">
					<option value="">Please select</option>
					<?php
					/* $table = "department";
					$order = "ASC";
					$column = "name";
					$datas = getTableDataByTableName($table, $order, $column);
					foreach ($datas as $data) { */
						?>
						<option value="<?php //echo $data->id; ?>"><?php //echo $data->name; ?></option>
					<?php //} ?>
				</select> -->
				<?php //} else{?>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($_SESSION['logged']['department_id']); ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $_SESSION['logged']['department_id']; ?>" />
				 <?php //} ?>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Project:</label>
				<!-- <?php //if (is_super_admin($currentUserId)) { ?>
				<select class="form-control" id="project_id" name="request_project">
					<option value="">Please select</option>
					<?php
					/* $table = "projects";
					$order = "ASC";
					$column = "project_name";
					$datas = getTableDataByTableName2($table, $order, $column);
					foreach ($datas as $data) { */
						?>
						<option value="<?php //echo $data->id; ?>"><?php //echo $data->project_name; ?></option>
					<?php //} ?>
				</select>
				<?php //} else{?> -->
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($_SESSION['logged']['project_id']); ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $_SESSION['logged']['project_id']; ?>" />
				 <?php //} ?>
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Warehouse:</label>
				<?php //if (is_super_admin($currentUserId)) { ?>
				<!-- <select class="form-control" id="project_id" name="request_warehouse">
					<option value="">Please select</option>
					<?php
					/* $table = "projects";
					$order = "ASC";
					$column = "inv_warehosueinfo";
					$datas = getTableDataByTableName2($table, $order, $column);
					foreach ($datas as $data) { */
						?>
						<option value="<?php //echo $data->id; ?>"><?php //echo $data->name; ?></option>
					<?php //} ?>
				</select> -->
				<?php //} else{?>
				 <input type="text" class="form-control" value="<?php echo getWarehouseNameById($_SESSION['logged']['warehouse_id']); ?>" readonly />
				 <input name="request_warehouse" type="hidden" value="<?php echo $_SESSION['logged']['warehouse_id']; ?>" />
				 <?php //} ?>
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
				
				$prefix="E-RLP";
				$formater_length=3;				
				$division_id    =   $_SESSION['logged']['branch_id'];
				$department_id  =   $_SESSION['logged']['department_id'];
				$office_id      =   $_SESSION['logged']['office_id'];
				$user_id        =   $_SESSION['logged']['user_id']; 
							
				$rlpNo    =   get_equips_rlp_no($prefix,$formater_length); ?>
                <div class="rlpno_style" style="background-color:green;color:#fff;padding:2px;"><?php echo $rlpNo; ?></div>
                <input type="hidden" name="equips_rlp_no" value="<?php echo $rlpNo; ?>">
            </div>
        </div>
    </div>
	
	            	
					<div class="row" id="div1"  style="">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dynamic_field">
                                <thead>
                                <th>Equipment Name<span class="reqfield"> ***</span></th>
                                <th>Purpose</th>
                                <th width="10%">Qty<span class="reqfield"> ***</span></th>
                                <th width="10%"></th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="text" name="equipments_name[]" id="equipments_name0" class="form-control" required></td>
                                        <td><input type="text" name="purpose[]" id="purpose0" class="form-control"></td>
                                        <td><input type="text" name="quantity[]" id="quantity0" onchange="sum(0)" class="form-control" required></td>
                                        <td><button type="button" name="add" id="add" class="btn" style="background-color:#2e3192;color:#ffffff;">+</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
<script>
    var i = 0;
    $(document).ready(function () {
        $('#add').click(function () {
            i++;
            $('#dynamic_field').append('<tr id="row' + i + '"><td><input type="text" name="equipments_name[]" id="equipments_name' + i + '" class="form-control" required></td><td><input type="text" name="purpose[]" id="purpose' + i + '" class="form-control"></td><td><input type="text" name="quantity[]" id="quantity' + i + '" onchange="sum(0)" class="form-control" required></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td></tr>');
			$(".material_select_2").select2();
        });
        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
        });
    });
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
            <?php echo get_user_project_wise_equips_rlp_chain_for_create(); ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <input type="submit" name="equips_rlp_create" id="submit" class="btn btn-block btn-primary" value="Request" />
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
