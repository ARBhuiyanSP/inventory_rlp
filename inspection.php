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
        <li class="breadcrumb-item active"> Equipment Inspection</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-body">
                       <div class="row">
							<div class="col-sm-12">
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-3">
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
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="NEW ENTRY" />
											</div>
										</div>
										<div class="col-sm-2">
											<label for="exampleId">From Date</label>
											<input name="from_date" type="text" class="form-control" id="fromdate" value="<?php if(isset($_POST['from_date'])){ echo $_POST['from_date']; } else {echo date("Y-m-d");} ?>" size="30" autocomplete="off" required />
										</div>
										<div class="col-sm-2">
											<label for="exampleId">To Date</label>
											<input name="to_date" type="text" class="form-control" id="todate" value="<?php if(isset($_POST['to_date'])){ echo $_POST['to_date']; } else {echo date("Y-m-d");} ?>" size="30" autocomplete="off" required />
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="historySubmit" id="submit" class="btn btn-block btn-primary" value="PRE. HISTORY" />
											</div>
										</div>
									</div>
								</form>
							</div>
							</div>
							</div>
							<?php    
								if(isset($_POST['submit'])){ 
									$eel_code 	= 	$_POST['eel_code'];
									$sql		=	"select * from `equipments` where `eel_code`='$eel_code'";
									$result 	= mysqli_query($conn, $sql);
									$row		= mysqli_fetch_array($result);
							?>
							
							<div class="row">
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
								<input type="hidden" name="eel_code" value="<?php echo $row['eel_code'] ?>" />
								<button class="btn btn-block btn-success" type="submit" name="ins_submit"> Submit</i></button>
							</form>
							
							
							
						<?php  } else if(isset($_POST['historySubmit'])){ ?>
							
								<?php
								$from_date	=	$_POST['from_date'];
								$to_date	=	$_POST['to_date'];
								
								$eel_code = $_POST['eel_code'];
								$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
								$result = mysqli_query($conn, $sql);
								$row=mysqli_fetch_array($result);
								?>
							<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-12 col-sm-12">
									<center>
									<h1 align="center"><img src="images/spl.png" height="50"></h1>
									<h2>E-Engineering Limited</h2>
									<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
									<h5>Equipment Inspection Report</h5>
									From  <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?> </span>To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?>
									<table class="table" style="">
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
									<table id="" class="table table-bordered table-striped" style="">
										<thead>
											<tr>
												<th>Inspection Date</th>
												<th>Remarks</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
										<?php
											$eel_code = $row['eel_code'];
											$sqlh	=	"select * FROM `inspaction` WHERE `eel_code`='$eel_code' AND `ins_date` BETWEEN '$from_date' AND '$to_date'";
											$resulth = mysqli_query($conn, $sqlh);
											while ($rowh = mysqli_fetch_array($resulth)) {
												?>
										
											<tr>
												<td><?php 
												if($rowh['ins_date']){
													$rDate = strtotime($rowh['ins_date']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php echo $rowh['remarks'] ?></td>
												<td><?php echo $rowh['status'] ?></td>
											</tr>
											<?php } ?>
										</tbody>
									</table>
								</center>
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
							</div>
							
						<?php  } ?>
						</div>
                    </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>


<script>
function sum() {
            var runninghrkm = document.getElementById('runninghrkm').value;
            var closehrkm = document.getElementById('closehrkm').value;

 

            var result =  parseInt(closehrkm) - parseInt(runninghrkm);
            if (!isNaN(result)) {
                document.getElementById('sumhrkm').value = result;
            }
        }
</script>
<!-- /.content-wrapper -->
<?php include 'footer.php'; ?>
