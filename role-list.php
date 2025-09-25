<?php 
include 'header.php';
?>

<?php/*  if(!check_permission('role-list')){ 
		include("404.php");
		exit();
 } */ ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Role List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Role List
			<a href="role-add.php" style="float:right"><i class="fas fa-list"></i> Role Add<a>
		</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                
					<div class="row">
						<div class="col-xs-12">
							<?php 
								$delUrl =   "includes/role_process.php?process_type=role_delete";
							?>
							<table id="dataTable" class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th>Role Name</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
								<?php
                                    $projectsData = getTableDataByTableName('roles');
                                    ;
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?>
									<tr>
										<td><?php echo $data['name']; ?></td>
										<td>
											<?php //if(check_permission('role-edit')){ ?>
											<a href="role-edit.php?id=<?php echo $data['id']; ?>"><i class="fas fa-edit text-success"></i></a>
										<?php //} ?>
										<?php //if(check_permission('role-delete')){ ?>
											<a href="javascript:void(0)"  onclick="commonDeleteOperation('<?php echo $delUrl ?>', '<?php echo $data['id']; ?>');"><i class="fa fa-trash text-danger"></i></a>
											<?php //} ?>
										</td>
									</tr>
									<?php
                                        }
                                    }
                                    ?>
								</tbody>
							</table>
						</div>
					</div>
            </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>