<?php include 'header.php' ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Material Issue List
			<a href="issue_entry.php" style="float:right"><i class="fas fa-plus"></i> Issue Entry<a>
		</div>
        <div class="card-body">
			<div class="table-responsive data-table-wrapper">
				<table id="issue_data_list" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Issue No</th>
							<th>Issue Date</th>
							<th>
								<span>Use In</span><select name="equipments" id="equipments" class="form-control">
									<option value="">Use In Search</option>
									<?php 
									$query = "SELECT * FROM inv_issue GROUP BY use_in ORDER BY use_in ASC";
									$result = mysqli_query($conn, $query);
									while($row = mysqli_fetch_array($result))
									{
										echo '<option value="'.$row["use_in"].'">'.$row["use_in"].'</option>';
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
 
 load_issue_data();

 function load_issue_data(is_equipments)
 {
  var dataTable = $('#issue_data_list').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch/fetch_issue_table.php",
    type:"POST",
    data:{is_equipments:is_equipments}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#equipments', function(){
  var equipments = $(this).val();
  $('#issue_data_list').DataTable().destroy();
  if(equipments != '')
  {
   load_issue_data(equipments);
  }
  else
  {
   load_issue_data();
  }
 });
});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>