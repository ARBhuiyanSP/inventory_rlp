<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
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
        <li class="breadcrumb-item active"> User List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> User List
		</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                
					<div class="row">
						<div class="col-xs-12">
							<table id="dataTable" class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th> User Name</th>
										<th> Office ID</th>
										<th> Email</th>
										<th> Location / Warehouse Name</th>
										<th> Type/Role</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
								<?php
                                    $projectsData = getTableDataByTableName('users');
                                    ;
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?>
									<tr>
										<td><?php echo $data['name']; ?></td>
										<td><?php echo $data['office_id']; ?></td>
										<td><?php echo $data['email']; ?></td>
										<td><?php echo getWarehouseNameById($data['warehouse_id']) ?></td>
										<td>
											<?php 
											$dataresult =   getDataRowByTableAndId('roles', $data['role_id']);
											echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : '');
											?>
										</td>
										<td>
											<?php //if(check_permission('user-edit')){ ?>
											<a href="user_edit.php?id=<?php echo $data['id']; ?>"><i class="fas fa-edit text-success"></i></a>
										<?php //} ?>
										<?php //if(check_permission('user-delete')){ ?>
											<a href="javascript:void(0)"><i class="fa fa-trash text-danger"></i></a>
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