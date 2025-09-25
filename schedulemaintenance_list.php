<?php include 'header.php' ?>
<?php if(!check_permission('material-receive-list')){ 
        include("404.php");
        exit();
 } ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Equipment Schedule Maintenace List
			<a href="schedulemaintenance.php" style="float:right"><i class="fas fa-plus"></i> New Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="schedule_main_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>EEL Code</th>
							<th>
								<select name="towarehouse" id="towarehouse" class="form-control select2">
									<option value="">Location</option>
									<?php 
									$query = "SELECT * FROM inv_warehosueinfo ORDER BY name ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["id"].'">'.$row["name"].'</option>';
									}
									?>
								</select>
							</th>
							<th>Last Service Date</th>
							<th>Last Service HR/KM</th>
							<th>Scheduled Service HR/KM</th>
							<th>Next Service Date</th>
							<th>Action</th>
						</tr>
					</thead>
				</table>
			</div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script type="text/javascript" language="javascript" >
$(document).ready(function(){
 
 load_schedule_main_data();

 function load_schedule_main_data(is_towarehouse)
 {
  var dataTable = $('#schedule_main_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_schedule_main_table.php",
    type:"POST",
    data:{is_towarehouse:is_towarehouse}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#towarehouse', function(){
  var towarehouse = $(this).val();
  $('#schedule_main_data_list').DataTable().destroy();
  if(towarehouse != '')
  {
   load_schedule_main_data(towarehouse);
  }
  else
  {
   load_schedule_main_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>