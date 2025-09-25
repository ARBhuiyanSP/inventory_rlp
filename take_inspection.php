<?php 
include 'header.php';
?>
<?php /* if(!check_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <!-- Small cardes (Stat card) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <!-- /.card-header -->
                    <div class="card-body">
                        <div class="row">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									
									<div class="page-title-card">
                                    <h4 class="page-title">Equipment Inspection</h4>

                                    <div class="clearfix"></div>
                                </div>
									<div class="row">
							<?php
							$id         =   $_GET['id']; 
							$sql	=	"select * from equipments where id=$id";
							$result = mysqli_query($conn, $sql);
							$row=mysqli_fetch_array($result);
							?>
                            <div class="col-lg-12">
								<table style="" class="table table-bordered">
									<tr>
										<th>Name:</th>
										<td>
										<?php echo $row['name'];?>
										</td>
										<td width="50%" rowspan="6"><center><h3>Equipment Image Not Found</h3></center></td>
									</tr>
									<tr>
										<th>EEL Code:</th>
										<td><?php echo $row['eel_code'] ?></td>
									</tr>
									<tr>
										<th>Origin:</th>
										<td><?php echo $row['origin'] ?></td>
									</tr>
									<tr>
										<th>Capacity:</th>
										<td><?php echo $row['capacity'] ?></td>
									</tr>
									<tr>
										<th>Model:</th>
										<td><?php echo $row['model'] ?></td>
									</tr>
									<tr>
										<th>Last Inspaction:</th>
										<td><?php echo $row['inspaction_date'] ?></td>
									</tr>
								</table>
							</div>
						</div>
						<form action="" method="post">
							<div class="row">
								<div class="col-xs-6">
									<div class="form-group">
										<label>Inspection Date</label>
										<input name="ins_date" type="text" class="form-control" id="rlpdate" value="" size="30" autocomplete="off"/>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="form-group">
										<label>Inspection Status</label>
										<select id="dv" name="status" class="form-control select2">
											<option value="ok">Running</option>
											<option value="idle">Idle</option>
											<option value="breakdown">Breakdown</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="ad">Remarks</label>
										<textarea id="ad" name="remarks" class="form-control"></textarea>
									</div>
								</div>
							</div>
							<input type="hidden" name="id" value="<?php echo $row['id'] ?>" />
							<input type="hidden" name="product_id" value="<?php echo $row['eel_code'] ?>" />
							<button class="btn btn-block btn-danger" type="submit" name="ins_submit"> Submit</i></button>
						</form>
								</div>
								<div class="col-md-1"></div>
							</div>
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
<?php include 'footer.php'; ?>
