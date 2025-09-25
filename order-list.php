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
            Order List
			<a href="order_entry.php" style="float:right"><i class="fas fa-plus"></i> Order Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="order_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Order No</th>
							<th>Order Date</th>
							<th>
								<select name="delivery_date" id="delivery_date" class="form-control select2">
									<option value="">Delivery Date Search</option>
									<?php 
									$query = "SELECT delivery_date FROM orders ORDER BY delivery_date ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["delivery_date"].'">'.$row["delivery_date"].'</option>';
									}
									?>
								</select>
							</th>
							<th>Amount</th>
							<th>Paid Amount</th>
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
 
 load_order_data();

 function load_order_data(is_delivery_date)
 {
  var dataTable = $('#order_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_order_table.php",
    type:"POST",
    data:{is_delivery_date:is_delivery_date}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#delivery_date', function(){
  var delivery_date = $(this).val();
  $('#order_data_list').DataTable().destroy();
  if(delivery_date != '')
  {
   load_order_data(delivery_date);
  }
  else
  {
   load_order_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>