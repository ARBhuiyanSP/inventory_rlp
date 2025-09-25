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
				<table id="rent_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Invoice No</th>
							<th> Date</th>
							<th>
								<select name="client_id" id="client_id" class="form-control select2">
									<option value="">Client name</option>
									<?php 
									$query = "SELECT * FROM clients ORDER BY name ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["id"].'">'.$row["name"].'</option>';
									}
									?>
								</select>
							</th>
							<th> Total Amount</th>
							<th> Due Amount</th>
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
 
 load_rent_data();

 function load_rent_data(is_client_id)
 {
  var dataTable = $('#rent_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_rent_table.php",
    type:"POST",
    data:{is_client_id:is_client_id}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#client_id', function(){
  var client_id = $(this).val();
  $('#rent_data_list').DataTable().destroy();
  if(client_id != '')
  {
   load_rent_data(client_id);
  }
  else
  {
   load_rent_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>