<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
		$task_id         =   $_GET['id'];
		$task_details    =   getTaskDetailsData($task_id);   
		$task_info       =   $task_details['task_info'];
		$task_details    =   $task_details['task_details'];
	$UserOfficeId  =   $_SESSION['logged']['office_id'];
    if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id'])){
?>
<form action="" method="post">
    <div class="row">
        <div class="col-sm-2">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="task_assign_date" type="text" class="form-control" id="" value="<?php echo $task_info->task_assign_date; ?>" size="30" autocomplete="off" readonly />
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
								if($task_info->priority == $priority->id){
									$checked	= 'checked';
									}else{
									$checked	= 'disabled';
									}
                    ?>
					<label>
						<input type="radio" name="priority" value="<?php echo $priority->id; ?>" <?php echo $checked; ?>>
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
				<select class="form-control material_select_2" id="project_id" name="project_id">
					<option value="">Please select</option>
					<?php
					$table = "projects";
					$order = "ASC";
					$column = "project_name";
					$datas = getTableDataByTableName2($table, $order, $column);
					foreach ($datas as $data) {
						if($task_info->project_id == $data->id){
							$selected	= 'selected';
							}else{
							$selected	= '';
							}
						?>
						<option value="<?php echo $data->id; ?>" <?php echo $selected; ?> disabled ><?php echo $data->project_name; ?></option>
					<?php } ?>
				</select>
			</div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
				<label for="sel1">Assign To:</label>
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
							if($task_info->task_done_by_office_id == $rowlt['office_id']){
							$selected	= 'selected';
							}else{
							$selected	= '';
							}
						?>
						<option value="<?php echo $rowlt['office_id'] ?>" <?php echo $selected; ?>>
						<?php echo $rowlt['name'] .'||'. $rowlt['office_id'] ?></option>
						<?php } ?>
					</select>
			</div>
        </div>
    </div>
    <table class="table table-bordered" id="tbl_posts">
        <thead>
            <tr>
                <th>Task Details</th>
                <th width="20%">Estimated Time</th>
            </tr>
        </thead>
        <tbody id="tbl_posts_body">
            
			
			<tr id="rec-1">
                <td><?php echo $task_info->task_details; ?></td>
                <td><?php echo $task_info->working_hrs; ?> Hour <?php echo $task_info->working_mins; ?> Minutes</td>
            </tr>
			<input type="hidden" name="task_details" value="<?php echo $task_info->task_details; ?>" />
			<input type="hidden" name="working_hrs" value="<?php echo $task_info->working_hrs; ?>" />
			<input type="hidden" name="working_mins" value="<?php echo $task_info->working_mins; ?>" />
			
			
        </tbody>
    </table>
	<!---- Attachment View----->
			<?php if($task_info->file){?>
<a class="btn btn-success btn-sm" target="blank" href="uploads/files/<?php echo trim($task_info->file) ?>">View Attached File</a>
<?php } ?>
			<!---- Attachment View----->
    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
				<label for="sel1">Challenges/Obstacles:</label>
				<textarea class="form-control" id="remarks" name="remarks"><?php echo $task_info->remarks; ?></textarea>
			</div>
        </div>
		<?php 
		if($task_info->status=='Pending'){ ?>
		<div class="col-sm-6">
			<input type="hidden" name="edit_id" value="<?php echo $task_info->id; ?>" />
			<input type="submit" name="task_update" id="submit" class="btn btn-block btn-primary" value="Update Task" />
        </div>
		<div class="col-sm-6">
			<input type="hidden" name="status" value="Completed" />
			<input type="submit" name="task_complete" id="submit" class="btn btn-block btn-success" value="Complete Task" />
        </div>
		<?php } else{ ?>
		<div class="alert">
			<strong>This Task !</strong> Has Been Completed .
		</div>
		<?php } ?>
    </div>
</form>
    <?php }else{ ?>
    <div class="alert alert-warning">
      <strong>Warning!</strong> Access Limit .
    </div>
    <?php } ?>