<?php include 'header.php';
?>

<style>
table span{
	padding:15px 5px ;
}
table h5{
	padding:5px 5px ;
}
</style>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <section class="content">
        <!-- Small cardes (Stat card) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Userwise Task Report</h3>
                    </div>
                    <!-- /.card-header -->
                     <div class="card-body">
						<div class="row">
							<div class="col-sm-12">
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Choose an User</label>
												<select class="form-control material_select_2" id="task_done_by" name="task_done_by" required >
													<option value="">Select User</option>
													<?php
													$userData = getUsersName('users');

													if (isset($userData) && !empty($userData)) {
														foreach ($userData as $data) {
															if($_POST['task_done_by'] == $data['office_id']){
																$selected	= 'selected';
																}else{
																$selected	= '';
																}
													?>
												<option value="<?php echo $data['office_id'] ?>" <?php echo $selected; ?>><?php echo $data['name'] ?>|| <?php echo $data['office_id'] ?></option>
												<?php
														}
													}
													?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label for="exampleId">From Date</label>
												<input name="from_date" type="text" class="form-control" id="rlpdate" value="<?php if(isset($_POST['submit'])){if($_POST['from_date']){echo $_POST['from_date'];}} ?>" size="30" autocomplete="off" required />
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label for="exampleId">To Date</label>
												<input name="to_date" type="text" class="form-control" id="date" value="<?php if(isset($_POST['submit'])){if($_POST['to_date']){echo $_POST['to_date'];}} ?>" size="30" autocomplete="off" required />
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-primary" value="Search Data" />
											</div>
										</div>
									</div>
								</form>
							</div>
							</div>
							 <?php
							if(isset($_POST['submit'])){
								$from_date = $_POST['from_date'];
								$to_date = $_POST['to_date'];
								$task_done_by = $_POST['task_done_by'];
								$sql	=	"SELECT * FROM `tasks` WHERE `task_done_by_office_id`='$task_done_by' AND `task_assign_date` BETWEEN '$from_date' AND '$to_date';";
								$result = mysqli_query($conn, $sql);
								
										$sqltime = "SELECT SUM(`working_hrs`) + SUM(`working_mins`) DIV 60 AS Totalhours, SUM(`working_mins`) MOD 60 AS Totalmins FROM tasks WHERE `task_done_by_office_id`='$task_done_by' AND `task_assign_date` BETWEEN '$from_date' AND '$to_date';";
										$resulttime = mysqli_query($conn, $sqltime);
										$rowtime=mysqli_fetch_array($resulttime);
								?>
							<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<center>
									<h5 align="center"><img src="images/spl.png" height="50"></h5>
									<h2>E-Engineering Ltd</h2>
									<p>Khawaja Tower[7th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
									<h5><b>Userwise Task Report</b></h5>
									<h5><b><span style="background-color:#426444;color:#ffffff;padding:3px;border-radius:5px;">User:</span> <?php echo $task_done_by; ?></b> => <?php echo getEmployeeNameByOfficeId('users',$task_done_by); ?> || <span style="background-color:#426444;color:#ffffff;padding:3px;border-radius:5px;">Date:</span> <span style="text-decoration:underline;"><?php echo date("jS F Y", strtotime($from_date));?></span> To <span style="text-decoration:underline;"><?php echo date("jS F Y", strtotime($to_date));?></span></h5>
									
								</center>
									<table border="1">
										<tr style="background-color:#ECEBEA;">
											<td><span>Date</span></td>
											<td><span>Task Info</span></td>
											<td><span>Project Name</span></td>
											<td width="10%"><span>Hours</span></td>
											<td width="8%"><span>Status</span></td>
											<td width="25%"><span>Challenges/Obstacles</span></td>
										</tr>
											
											<?php
											while($row=mysqli_fetch_array($result))
											{?>
											<tr style="color:#ffffff;background-color:<?php if($row['status']=='Completed'){echo 'rgba(3, 48, 6, 0.75)';}else{echo 'rgba(107, 1, 1, 1)';} ?>">
												<td><span><?php echo date("jS F Y", strtotime($row['task_assign_date']));?></span></td>
												<td><span><?php echo $row['task_details']; ?></span></td>
												<td><span><?php echo (isset($row['project_id']) && !empty($row['project_id']) ? getProjectNameById($row['project_id']) : 'No data'); ?></span></td>
												<td><span><?php echo $row['working_hrs']; ?> Hr <?php echo $row['working_mins']; ?> Mins</span></td>
												<td><span><?php echo $row['status']; ?></span></td>
												<td><span><?php echo $row['remarks']; ?></span></td>
											</tr>
											<?php }?>
											<tr>
												<td colspan="3" style="text-align:right;"><b>Total Working Hours : </b></td>
												<td style="background-color:green;color:#ffffff;"><span><?php echo $rowtime['Totalhours']; ?> Hrs <?php echo $rowtime['Totalmins']; ?> Mins</span></td>
												<td colspan="2"></td>
											</tr>
									</table>
								</div>
								<div class="col-md-1"></div>
							</div>
							
								
							<center><button class="btn btn-default" onclick="printDiv('printableArea')" style="margin-top:5px;"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></center>					
							<script>
							function printDiv(divName) {
								 var printContents = document.getElementById(divName).innerHTML;
								 var originalContents = document.body.innerHTML;

								 document.body.innerHTML = printContents;

								 window.print();

								 document.body.innerHTML = originalContents;
							}
							</script>
						<?php  } ?>
	

						</div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
</div>

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php include 'footer.php'; ?>
