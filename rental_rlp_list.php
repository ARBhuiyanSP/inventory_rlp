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
            Rental Project RLP List
			<a href="rental_rlp_create.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="rental_rlp_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>RLP No</th>
							<th>RLP Date</th>
							<th>
								<select name="projects" id="projects" class="form-control">
									<option value="">Project Search</option>
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
							<th>Total Amount</th>
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
 
 load_rental_rlp_data();

 function load_rental_rlp_data(is_projects)
 {
  var dataTable = $('#rental_rlp_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_rental_rlp_table.php",
    type:"POST",
    data:{is_projects:is_projects}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#projects', function(){
  var projects = $(this).val();
  $('#rental_rlp_list').DataTable().destroy();
  if(projects != '')
  {
   load_rental_rlp_data(projects);
  }
  else
  {
   load_rental_rlp_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>