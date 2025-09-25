<?php include 'header.php' ?>
<?php /* if(!check_permission('material-receive-list')){ 
        include("404.php");
        exit();
 } */ ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Material OP List
			<a href="op_entry.php" style="float:right"><i class="fas fa-plus"></i> OP Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="op_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Voucher No</th>
							<th>Voucher Date</th>
							<th>
								<select name="warehouse" id="warehouse" class="form-control">
									<option value="">Warehouse Search</option>
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
							<th>Total Qty</th>
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
 
 load_op_data();

 function load_op_data(is_warehouse)
 {
  var dataTable = $('#op_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_op_table.php",
    type:"POST",
    data:{is_warehouse:is_warehouse}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#warehouse', function(){
  var warehouse = $(this).val();
  $('#op_data_list').DataTable().destroy();
  if(warehouse != '')
  {
   load_op_data(warehouse);
  }
  else
  {
   load_op_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>