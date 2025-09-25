<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id'])){
?>
<style>
.reqfield{
	color:red;
	font-size:10px;
}
</style>
<form action="" method="post">
    <div class="row">
		
		
		
		<form action="" method="post">
			<div class="" id="printableArea" style="display:block;">
				<div class="col-xs-1">
					<div class="form-group">
						<label>Date</label>
						<input type="text" autocomplete="off" name="date" id="issue_date" class="form-control datepicker" value="<?php echo date('Y-m-d'); ?>">
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label for="id">Client name</label>
						<select name="client_name" id="client" class="form-control material_select_2">
							<option>Select Client</option>
							<?php 
							$sql	= "select * from `clients` ORDER BY `id` ASC";
							$result = mysqli_query($conn, $sql);
							while($row=mysqli_fetch_array($result))
								{
							?>
							<option value="<?php echo $row['id'] ?>"><?php echo $row['name'] ?></option>
							<?php } ?>
						</select>
					</div>
				</div>
				
				
				<div class="col-xs-2">
					<div class="form-group">
						<label for="id">Project name</label>
						<select class="form-control material_select_2" name="project_name" id="project">
							<option value="">select project</option>

						</select>
					</div>
				</div>
				
				<div class="col-xs-2">
					<div class="form-group">
						<label for="id">Ref. Name</label>
						<input name="ref_name" type="text" class="form-control" id="" value="" size="30" autocomplete="off" />
					</div>
				</div>
				<div class="col-xs-2">
					<div class="form-group">
						<label>Challan No</label>
						<?php
						if ($_SESSION['logged']['user_type'] == 'whm') {
							$warehouse_id = $_SESSION['logged']['warehouse_id'];
							$sql = "SELECT * FROM inv_warehosueinfo WHERE `id`='$warehouse_id'";
							$result = mysqli_query($conn, $sql);
							$row = mysqli_fetch_array($result);
							$short_name = $row['short_name'];
							$rentCode = 'RCH-' . $short_name;
						} else {
							$rentCode = 'RCH-CW-';
						}
						?>
						<input type="text" name="challan_no" id="issue_id" class="form-control" value="<?php echo getDefaultCategoryCodeByWarehouseT('rents', 'challan_no', '03d', '001', $rentCode) ?>" readonly>
						<input type="hidden" name="issue_no" id="issue_no" value="<?php echo getDefaultCategoryCodeByWarehouseT('rents', 'challan_no', '03d', '001', $rentCode) ?>">
					</div>
				</div>
				<div class="col-sm-1">
					<div class="form-group">
						<label for="exampleId">Rent Date</label>
						<input name="rent_date" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" size="30" autocomplete="off" required />
					</div>
				</div>
				<div class="col-sm-1">
					<div class="form-group">
						<label for="exampleId">Return date</label>
						<input name="return_date" type="text" class="form-control" id="date"  onchange="showdays()" value="" size="30" autocomplete="off" required />
					</div>
				</div>
				<div class="col-xs-1">
							<div class="form-group">
								<label>Total Days</label>
								<input type="text" name="totaldays" class="form-control" maxlength="100" id="result" readonly />	
							</div>
				</div>
			
					<div class="col-sm-12">
						<?php include('partial/rent_items_table.php'); ?>
					</div>
				
				<div class="col-md-12">
					<div class="form-group">
						<label for="exampleId">Remarks:</label>
						<textarea class="form-control" id="" name="remarks" rows="1"></textarea>
					</div>
				</div>
				
	
	
				<div class="col-sm-12">
					<input type="submit" name="rent_entry" id="submit" class="btn btn-block btn-primary" value="Save Data" />
				</div>
			</div>
		</form>

	<?php } ?>
	
	
	<script language="JavaScript" type="text/javascript">
			// To calulate difference b/w two dates
			function showdays() {
			 var d1 = $('#rlpdate').datepicker('getDate');
				  var d2 = $('#date').datepicker('getDate');
				  var diff = 0;
				  if (d1 && d2) {
						diff = Math.floor((d2.getTime() - d1.getTime()) / 86400000); // ms per day
				  }
				  $('#result').val(diff);
			}
			
			
			
			
			$(document).ready(function() {
			$("#client").on('change', function() {
				var clientid = $(this).val();

				$.ajax({
					method: "POST",
					url: "response.php",
					data: {
						id: clientid
					},
					datatype: "html",
					success: function(data) {
						$("#project").html(data);
					}
				});
			});
		});
		 
		</script>