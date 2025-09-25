<?php include 'header.php';
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <!-- Small cardes (Stat card) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
						<i class="fas fa-table"></i> Task List
						<a href="task_assign.php" style="float:right"><i class="fas fa-plus"></i> Create New<a>
					</div>
                    <!-- /.card-header -->
                    <div class="card-body">
   <!------------ Table Content-------------->
						<div class="table-responsive">
							<table id="tasks_data" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Assign Date</th>
										<th>Task Details</th>
										<th>
											<select name="project" id="project" class="form-control">
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
										<th width="12%">Assign By</th>
										<th width="12%">Done By</th>
										<th>Status</th>
										<th>Action</th>
									</tr>
								</thead>
							</table>
						</div>


   <!------------ Table Content-------------->
					</div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<script type="text/javascript" language="javascript" >
$(document).ready(function(){
 
 load_tasks_data();

 function load_tasks_data(is_project)
 {
  var dataTable = $('#tasks_data').DataTable({
   "processing":true,
   "serverSide":true,
   "order":[],
   "ajax":{
    url:"fetch_task_table.php",
    type:"POST",
    data:{is_project:is_project}
   },
   "columnDefs":[
    {
     "targets":[2],
     "orderable":false,
    },
   ],
  });
 }

 $(document).on('change', '#project', function(){
  var project = $(this).val();
  $('#tasks_data').DataTable().destroy();
  if(project != '')
  {
   load_tasks_data(project);
  }
  else
  {
   load_tasks_data();
  }
 });
});
</script>

<?php include 'footer.php'; ?>