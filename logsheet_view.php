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
						<div class="row">
								<?php
								$id = $_GET['no'];
								$sqllog	=	"select * from `tb_logsheet` where `slno`='$id'";
								$resultlog = mysqli_query($conn, $sqllog);
								$rowlog=mysqli_fetch_array($resultlog);
								
								
								
								$eel_code = $rowlog['equipment_code'];
								$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
								$result = mysqli_query($conn, $sql);
								$row=mysqli_fetch_array($result);
								?>
							</div>
							<div class="row" id="printableArea" style="display:block;">
								<div class="col-md-12">
									<center>
									<h1 align="center"><img src="images/spl.png" height="50"></h1>
									<h2>E-Engineering Limited</h2>
									<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
									<h3>Equipment Daily Logsheet Report</h3>
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
									<table id="" class="table table-bordered table-striped" style="width:90%">
										<thead>
											<tr>
												<th>Date</th>
												<th>Work Details</th>
												<th>Running Hr</th>
												<th>Close Hr</th>
												<th>Total Hr</th>
												<th>Stand By</th>
												<th>Hydraulic (Ltr)</th>
												<th>Diesel (Ltr)</th>
												<th>Engine oil</th>
												<th>Greasing Hour Servicing</th>
											</tr>
										</thead>
										<tbody>
										<?php
											$subTotalhrkm = 0;
											$totalhydrolicltr = 0;
											$totaldisealltr = 0;
											$totalengineoil = 0;
											$totalgreasing = 0;
											$id = $_GET['no'];
											$sqlh	=	"select * from `tb_logsheet` where `slno`='$id'";
											$resulth = mysqli_query($conn, $sqlh);
											while ($rowh = mysqli_fetch_array($resulth)) {
												$subTotalhrkm += $rowh['totalhrkm'];
												$totalhydrolicltr += $rowh['hydrolicltr'];
												$totaldisealltr += $rowh['disealltr'];
												$totalengineoil += $rowh['engineoil'];
												$totalgreasing += $rowh['greasing'];
												?>
										
											<tr>
												<td><?php 
												if($rowh['d_date']){
													$rDate = strtotime($rowh['d_date']);
													$rfDate = date("jS \of F Y",$rDate);
													echo $rfDate;
												}else{
													echo '---';
												}
												?>
												</td>
												<td><?php echo $rowh['workdetails'] ?></td>
												<td><?php echo $rowh['runninghrkm'] ?></td>
												<td><?php echo $rowh['closehrkm'] ?></td>
												<td><?php echo $rowh['totalhrkm'] ?></td>
												<td><?php echo $rowh['standby'] ?></td>
												<td><?php echo $rowh['hydrolicltr'] ?></td>
												<td><?php echo $rowh['disealltr'] ?></td>
												<td><?php echo $rowh['engineoil'] ?></td>
												<td><?php echo $rowh['greasing'] ?></td>
											</tr>
											<?php } ?>
											<tr>
												<td style="text-align:right;" colspan="4"><b>Total : </b></td>
												<td><b><?php echo $subTotalhrkm; ?></b></td>
												<td></td>
												<td><b><?php echo $totalhydrolicltr; ?></b></td>
												<td><b><?php echo $totaldisealltr; ?></b></td>
												<td><b><?php echo $totalengineoil; ?></b></td>
												<td><b><?php echo $totalgreasing; ?></b></td>
											</tr>
										</tbody>
									</table>
								</center>
								</div>
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
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>