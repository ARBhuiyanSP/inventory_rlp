
<!-- Main content -->
<section class="invoice" id="printableArea">
	<form action="" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-sm-2">
			<div class="form-group">
				<label>Date</label>
				<input name="task_assign_date" type="text" class="form-control" id="rlpdate" autocomplete="off" />
			</div>
		</div>
			
		<div class="col-sm-3">
            <div class="form-group">
                <label for="exampleId">Priority</label>
                <div class="radio">
                    <?php
                        $priorities     =   get_priorities();
                        if(isset($priorities) && !empty($priorities)){
                            foreach($priorities as $priority){
                    ?>
                            <label><input type="radio" name="priority" value="<?php echo $priority->id; ?>" <?php if($priority->name == 'Low'){ echo 'checked';} ?>>                        
                                <span class="label label-<?php echo $priority->color_code; ?>"><?php echo $priority->name; ?></span>
                            </label>
                    <?php
                    } 
                        }
                    ?>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group">
				<label for="sel1">Project:</label>
				<select class="form-control select2" id="project_id" name="project_id" required >
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
			</div>
        </div>
        <div class="col-xs-2">
				<div class="form-group">
					
					<label>Assign To</label>
					<select id="dv" name="assign_to" class="form-control material_select_2">
						<option>Select User</option>
						<?php
						$UserName            =   $_SESSION['logged']['user_name'];					
						$UserOfficeId        =   $_SESSION['logged']['office_id'];					
						$warehouse_id        =   $_SESSION['logged']['warehouse_id'];					
						$sqllt	= "select * from `users` WHERE warehouse_id=$warehouse_id ORDER BY id ASC";
						$resultlt = mysqli_query($conn, $sqllt);
						while($rowlt=mysqli_fetch_array($resultlt))
							{
						?>
						<option value="<?php echo $rowlt['office_id'] ?>">
						<?php echo $rowlt['name'] .'||'. $rowlt['office_id'] ?></option>
						<?php } ?>
					</select>
				</div>
			</div>
        <div class="col-sm-2">
			<div class="form-group">
				<label for="exampleId">Attachment</label>
				<input class="form-control" type="file" id="" name="sn_prt_cv">
			</div>
		</div>
    </div>
    <table class="table table-bordered table-striped" id="tbl_posts">
        <thead>
            <tr>
<td rowspan="2" width="5%">Serial</br>No</td>
<td rowspan="2">Task</br>Details</td>
<td colspan="2" width="10%">Estimated Time</td>
<td rowspan="2" width="5%">Action </td>
</tr>
<tr>
<td>Hours</td>
<td>Mins</td>
</tr>
        </thead>
        <tbody id="tbl_posts_body">
            <tr id="rec-1">
                <td><span class="sn">1</span>.</td>
                <td><input type="text" class="form-control" id="" name="task_details[]" value="" size=""  required /></td>
                <td><input type="number" class="form-control" id="" name="working_hrs[]" value="" size=""   /></td>
                <td><input type="number" class="form-control" id="" name="working_mins[]" value="" size=""   /></td>
                <td><a class="btn btn-primary add-record" data-added="0" style="background-color:#007BFF;color:#ffffff;">+</a></td>
            </tr>
        </tbody>
    </table>
	<input type="hidden" name="task_assign_by_office_id" value="<?php echo $UserOfficeId; ?>" />
	<input type="hidden" name="task_assign_by_name" value="<?php echo $UserName; ?>" />
    <div class="row">
        <div class="col-sm-12">
            <input type="submit" name="task_assign" id="submit" class="btn btn-block btn-primary" value="ASSIGN TASK" />
        </div>
    </div>
</form>


<div style="display:none;">
    <table id="sample_table">
        <tr id="">
            <td><span class="sn"></span>.</td>
            <td><input type="text" class="form-control" id="" name="task_details[]" value="" size=""  required /></td>
            <td><input type="text" class="form-control" id="" name="working_hrs[]" value="" size=""  required /></td>
            <td><input type="text" class="form-control" id="" name="working_mins[]" value="" size=""  required /></td>
			<td><a class="btn btn-xs delete-record" data-id="0" style="background-color:#f26522;color:#ffffff;">X</a></td>
        </tr>
    </table>
</div>
    <!-- /.row -->
</section>
<!-- /.content -->
<div class="clearfix"></div>