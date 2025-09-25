<?php 
include 'header.php';

/*  if(!check_permission('project-list')){ 
        include("404.php");
        exit();
 }  */?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Project Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Project Entry Form
		</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post" name="add_name" id="add_name">
                    <div class="row" id="div1" style="">
                        <div class="col-sm-2 col-md-2">
                            <div class="form-group">
                                <label>Project Code</label>
                                <input type="text" name="code" id="code" class="form-control" readonly="readonly" value="<?php echo getDefaultCategoryCode('projects', 'code', '03d', '001', 'PR-') ?>">
                            </div>
                        </div>
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Project Name</label>
                                <input type="text" name="name" id="name" class="form-control">
                            </div>
                        </div>
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address" id="address" class="form-control">
                            </div>
                        </div>
						<div class="col-sm-2 col-md-2">
                            <div class="form-group">
                                <label>Type</label>
                                <select class="form-control" id="type" name="type">
									<option value="Own">Own</option>
									<option value="Rental">Rental</option>
								</select>
                            </div>
                        </div>
						<div class="col-sm-2 col-md-2">
                            <div class="form-group">
                                <label>Owner/Client</label>
                                <select class="form-control material_select_2" id="client_id" name="client_id" required >
										<option value="">Select</option>
										<?php $results = mysqli_query($conn, "SELECT * FROM `clients`"); 
										while ($row = mysqli_fetch_array($results)) {
											?>
										<option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
										<?php } ?>
								</select>
                            </div>
                        </div>
						<div class="col-xs-12">
                            <div class="form-group">
                                <input type="submit" name="project_submit" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />   
                            </div>
                        </div>
                    </div>
					<div class="row">
						<div class="col-xs-12">
							<table id="dataTable" class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="25%">Project Name</th>
										<th width="45%">Address</th>
										<th width="7%">Type</th>
										<th>Client</th>
										<th width="7%">Action</th>
									</tr>
								</thead>
								<tbody>
								<?php
                                    $projectsData = getTableDataByTableName('projects');
                                    ;
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?>
									<tr>
										<td><?php echo $data['project_name']; ?></td>
										<td><?php echo $data['address']; ?></td>
										<td><?php echo $data['type']; ?></td>
										<td><?php echo getNameByIdAndTable("clients",$data['client_id']) ?></td>
										<td>
											<?php if(check_permission('project-edit')){ ?>
                                            <a href="#"><i class="fas fa-edit text-success"></i></a>
                                             <?php } ?>
                                             <?php if(check_permission('project-delete')){ ?>
											<a href="#"><i class="fa fa-trash text-danger"></i></a>
                                        <?php } ?>
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
                </form>
            </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>