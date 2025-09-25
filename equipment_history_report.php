<?php 
include 'header.php';
?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Reports List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        
        <div class="card-body">
            <!--here your code will go-->
           <div class="row">
							<div class="col-sm-12">
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Equipment</label>
												<select class="form-control select2" id="project_id" name="eel_code">
														<?php $results = mysqli_query($conn, "SELECT * FROM `equipments`"); 
														while ($row = mysqli_fetch_array($results)) {
															if($_POST['eel_code'] == $row['eel_code']){
															$selected	= 'selected';
															}else{
															$selected	= '';
															}
														?>
														<option value="<?php echo $row['eel_code']; ?>" <?php echo $selected; ?>><?php echo $row['eel_code']; ?> || <?php echo $row['name']; ?></option>
														<?php } ?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search Data" />
											</div>
										</div>
										<div class="col-sm-3">
											<div class="form-group">
												<label></label>
												<input type="button" name="" id="" class="btn btn-block btn-primary" value="Back To Reports Section" onclick="location.href='reports.php';"/>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
							 <?php
						if(isset($_POST['submit'])){ 
								$eel_code = $_POST['eel_code'];
								$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
								$result = mysqli_query($conn, $sql);
								$row=mysqli_fetch_array($result);
								?>
							
							<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-1"></div>
								<div class="col-md-10">
									<center>
									<h1 align="center"><img src="images/spl.png" height="50"></h1>
									<h2>E-Engineering Ltd</h2>
									<p>72,Mohakhali C/A, (8th Floor),Rupayan Center,Dhaka-1212,bangladesh</p>
									<h3>Equipment Shifting Report</h3>
									<table class="table" style="width:80%">
										<tr>
											<th>Name:</th>
											<td><?php echo $row['name']; ?>
											</td>
											<th>EEl Code:</th>
											<td><?php echo $row['eel_code'] ?></td>
											<th>Brand:</th>
											<td><?php echo $row['makeby'] ?></td>
											
										</tr>
										<tr>
											<th>Model:</th>
											<td><?php echo $row['model'] ?></td>
											<th>Origin:</th>
											<td><?php echo $row['origin'] ?></td>
											<th>Purchase Date:</th>
											<td><?php //echo $row['purchase_date'] ?></td>
										</tr>
									</table>
									<table id="" class="table table-striped" style="width:90%" border="1">
										<thead>
											<tr>
												<th>Project Name</th>
												<th>Equipment in date</th>
												<th>Equipment out date</th>
											</tr>
										</thead>
										<tbody>
										<?php
											$eel_code = $row['eel_code'];
											$sqlh	=	"select * from `equipment_assign` where `eel_code`='$eel_code'";
											$resulth = mysqli_query($conn, $sqlh);
											while ($rowh = mysqli_fetch_array($resulth)) { ?>
										
											<tr>
												<td>
												<?php 
												$project_id=$rowh['project_id']; 
												$sqlpri	= "select * from projects where id=$project_id";
												$resultpri = mysqli_query($conn, $sqlpri);
												$rowpri=mysqli_fetch_array($resultpri);
												echo $rowpri['project_name']; 
												?>
												</td>
												<td><?php 
												if($rowh['assign_date']){
													$rDate = strtotime($rowh['assign_date']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php 
												if($rowh['refund_date']){
													$rfDate = strtotime($rowh['refund_date']);
													$rffDate = date("jS \of F Y",$rfDate);
													echo $rffDate;
												}else{
													echo '---';
												}
												?>
												</td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</center>
								</div>
								<div class="col-md-1"></div>
							</div>
								
							<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></center>					
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
                    <!-- /.box-body -->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
