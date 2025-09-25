<?php 
include 'header.php';

 if(!check_permission('project-list')){ 
        include("404.php");
        exit();
 } ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Client Entry</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Client Entry Form
		</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post" name="add_name" id="add_name">
                    <div class="row" id="div1" style="">
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Client Name</label>
                                <input type="text" name="name" id="name" class="form-control">
                            </div>
                        </div>
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" name="address" id="address" class="form-control">
                            </div>
                        </div>
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" name="phone" id="phone" class="form-control">
                            </div>
                        </div>
						<div class="col-sm-3 col-md-3">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" id="email" class="form-control">
                            </div>
                        </div>
						<div class="col-xs-12">
                            <div class="form-group">
                                <input type="submit" name="client_submit" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save" />   
                            </div>
                        </div>
                    </div>
					<div class="row">
						<div class="col-xs-12">
							<table id="dataTable" class="table table-bordered table-striped table-hover">
								<thead>
									<tr>
										<th width="20%">Client Name</th>
										<th width="30%">Address</th>
										<th>Phone</th>
										<th width="10%">Action</th>
									</tr>
								</thead>
								<tbody>
								<?php
                                    $projectsData = getTableDataByTableName('clients');
                                    ;
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?>
									<tr>
										<td><?php echo $data['name']; ?></td>
										<td><?php echo $data['address']; ?></td>
										<td><?php echo $data['phone']; ?></td>
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