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
            Equipment Logsheet List
			<a href="logsheet.php" style="float:right"><i class="fas fa-plus"></i> New Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="logsheet_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>EEL Code</th>
							<th> Date</th>
							<th>
								<select name="project_id" id="project_id" class="form-control select2">
									<option value="">Project name</option>
									<?php 
									$query = "SELECT * FROM projects ORDER BY project_name ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["id"].'">'.$row["project_name"].'</option>';
									}
									?>
								</select>
							</th>
							<th> Work Detail</th>
							<th>Stand By</th>
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
 
 load_logsheet_data();

 function load_logsheet_data(is_project_id)
 {
  var dataTable = $('#logsheet_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_logsheet_table.php",
    type:"POST",
    data:{is_project_id:is_project_id}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#project_id', function(){
  var project_id = $(this).val();
  $('#logsheet_data_list').DataTable().destroy();
  if(project_id != '')
  {
   load_logsheet_data(project_id);
  }
  else
  {
   load_logsheet_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>