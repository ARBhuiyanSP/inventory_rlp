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
            Equipment List
			<a href="equipment_entry.php" style="float:right"><i class="fas fa-plus"></i> Equipment Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="equipments_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="15%">Name</th>
							<th width="10%">EEL Code</th>
							<th width="15%">
								<select name="present_location" id="present_location" class="form-control material_select_2">
									<option value="">Present Location Search</option>
									<?php 
									$query = "SELECT * FROM projects GROUP BY project_name ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["id"].'">'.$row["project_name"].'</option>';
									}
									?>
								</select>
							</th>
							<th width="10%">Location Type</th>
							<th width="10%">Brand/MakeBy</th>
							<th width="10%">Model</th>
							<th width="10%">capacity</th>
							<th width="20%">Action</th>
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
 
 load_equipments_data();

 function load_equipments_data(is_present_location)
 {
  var dataTable = $('#equipments_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_equips_table.php",
    type:"POST",
    data:{is_present_location:is_present_location}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#present_location', function(){
  var present_location = $(this).val();
  $('#equipments_data_list').DataTable().destroy();
  if(present_location != '')
  {
   load_equipments_data(present_location);
  }
  else
  {
   load_equipments_data();
  }
 });

});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>