<?php include 'header.php';
$no=$_GET['no']; ?>


<link rel="stylesheet" type="text/css" href="css/jquery.fancybox.css">
<script src="js/jquery.fancybox.js"></script>

<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Material Receive Report
			<?php
				$sqld = "select * from `orders` where `id`='$no'";
				$resultd = mysqli_query($conn, $sqld);
				$rowd = mysqli_fetch_array($resultd);
			?>
			<!-- Your HTML content goes here -->
			<button class="btn btn-default" onclick="printDiv('printableArea')" style="float:right;"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></div>
			<div class="card-body" id="printableArea">
				<style>
.table-bordered {
	border: 1px solid #000000;
}
.table-bordered th, .table-bordered td{
	border: 1px solid #000000;
}
.table th, .table td {
	padding:2px 10px 2px 10px;
}
.table td {
	height:25px !important;
}

.challan{
	font-weight:bold;
}
.amountWords{
	text-decoration:underline;
	font-style:italic;
	color:#f26522;
}
.label {
  width: 32px;
  height: 150px;
  /* you need to know the max height  or you get overflow */
 
  white-space: nowrap;
  display: inline-block;
  position: relative;
}
.label-text {
  position: absolute;
  top: 0;
  left: 0;
  height: 32px;
  line-height: 32px;
  padding: 0 1em;
  transform-origin: top left;
  transform: rotate(-90deg) translateX(-100%);
}

</style>
				<div class="row">
					<div class="col-md-1 col-sm-1"></div>
					<div class="col-md-10 col-sm-10">
						<center>
							<h3>NEW SHAHJALAL OPTICS</h3>
							<span>Phone:02-222224917, Monbile:01778-979880</span>
							<h5>Order For CR-39/Glass</h5>
						</center>
						<div class="row">
							<div class="col-md-12 col-sm-12">
								<h5>ORDER NO : <?php echo $rowd['sl_no']; ?></h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Size _________________</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Colour _______________</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Quality ______________</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Quantity _____________</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Date _________________</h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Delivery Date ________</h5>
							</div>
							<div class="col-md-6 col-sm-6">
								<center><h5>RIGHT EYE</h5></center>
							</div>
							<div class="col-md-6 col-sm-6">
								<center><h5>LEFT EYE</h5></center>
							</div>
							<div class="col-md-12 col-sm-12">
								<table class="table table-bordered">
									<thead>
									  <tr>
										<td class="" rowspan="3" style="width:40px;">
											<div class="label">
												<span class="label-text">Reading/Distance</span>
											</div>
										</td>
										<td class="">SPH</td>
										<td class="">CYL</td>
										<td class="">AXIS</td>
										<td class="">SPH</td>
										<td class="">CYL</td>
										<td class="">AXIS</td>
									  </tr>
									  <tr>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
									  </tr>
									  <tr>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
									  </tr>
									</thead>

								</table>
							</div>
							<div class="col-md-12 col-sm-12">
								<h5 style="float:right">Signature</h5>
							</div>
						</div>
						----------------------
						<center>
							<h3>NEW SHAHJALAL OPTICS</h3>
						</center>
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<center><h5>RIGHT EYE</h5></center>
							</div>
							<div class="col-md-6 col-sm-6">
								<center><h5>LEFT EYE</h5></center>
							</div>
							<div class="col-md-12">
								<table class="table table-bordered">
									<thead>
									  <tr>
										<td class="" rowspan="3" style="width:40px;">
											<div class="label">
												<span class="label-text">Reading/Distance</span>
											</div>
										</td>
										<td class="">SPH</td>
										<td class="">CYL</td>
										<td class="">AXIS</td>
										<td class="">SPH</td>
										<td class="">CYL</td>
										<td class="">AXIS</td>
									  </tr>
									  <tr>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
									  </tr>
									  <tr>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
										<td class=""></td>
									  </tr>
									</thead>

								</table>
							</div>
							<div class="col-md-12">
								<h5>I.P.D _____________________ Contact No.:</h5>
							</div>
							<div class="col-md-8 col-sm-8">
								<h5>ORDER NO : <?php echo $rowd['sl_no']; ?></h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<h5>Date : </h5>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="row">
									<div class="col-md-2 col-sm-2">Name</div>
									<div class="col-md-10 col-sm-10" style="border-bottom: 1px solid #aaa;"></div>
								</div>
								<div class="row">
									<div class="col-md-2 col-sm-2">Frame</div>
									<div class="col-md-10 col-sm-10" style="border-bottom: 1px solid #aaa;"></div>
								</div>
								<div class="row">
									<div class="col-md-2 col-sm-2">Glass</div>
									<div class="col-md-4 col-sm-4" style="border-bottom: 1px solid #aaa;"></div>
									<div class="col-md-2 col-sm-2">D/Date</div>
									<div class="col-md-4 col-sm-4" style="border-bottom: 1px solid #aaa;"></div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="row">
									<div class="col-md-6 col-sm-6">Total</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-6">Advance</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-6">Balance</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
							</div>
						</div>
						--------------------------------
						<center>
							<h3>NEW SHAHJALAL OPTICS</h3>
							<span>Phone:02-222224917, Monbile:01778-979880</span>
							<h5>Order For CR-39/Glass</h5>
						</center>
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<h5>ORDER NO : <?php echo $rowd['sl_no']; ?></h5>
							</div>
							<div class="col-md-8 col-sm-8">
								<h5>Date : </h5>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="row">
									<div class="col-md-6 col-sm-6">Total</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-6">Advance</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-6">Balance</div>
									<div class="col-md-6 col-sm-6"><input type="text"/></div>
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="row">
									<div class="col-md-2 col-sm-2">Name</div>
									<div class="col-md-10 col-sm-10" style="border-bottom: 1px solid #aaa;"></div>
								</div>
								<div class="row">
									<div class="col-md-2 col-sm-2">Frame</div>
									<div class="col-md-10 col-sm-10" style="border-bottom: 1px solid #aaa;"></div>
								</div>
								<div class="row">
									<div class="col-md-2 col-sm-2">Frame No</div>
									<div class="col-md-2 col-sm-2" style="border-bottom: 1px solid #aaa;"></div>
									<div class="col-md-2 col-sm-2">Colour</div>
									<div class="col-md-2 col-sm-2" style="border-bottom: 1px solid #aaa;"></div>
									<div class="col-md-2 col-sm-2">Size</div>
									<div class="col-md-2 col-sm-2" style="border-bottom: 1px solid #aaa;"></div>
								</div>
								<div class="row">
									<div class="col-md-2 col-sm-2">Lens</div>
									<div class="col-md-10 col-sm-10" style="border-bottom: 1px solid #aaa;"></div>
								</div>
							</div>
							<div class="col-md-12 col-sm-12">
								<div class="row">
									<div class="col-md-6 col-sm-6">
										<div class="row">
											<div class="col-md-3 col-sm-3">Date of Delivery</div>
											<div class="col-md-9 col-sm-9" style="border-bottom: 1px solid #000;"></div>
											<div class="col-md-12">
												<center><h5>We are not responsible if not taken delivery in one month.</h5>
												<h5>১ মাসের মধ্যে ডেলিভারি না নিলে কোম্পানি দায়ী থাকবে না।</h5></center>
											</div>
										</div>
									</div>
									<div class="col-md-4 col-sm-4" style="padding-top:30px;text-decoration-line: overline underline;text-decoration-style: double;"> <h5>সন্ধ্যার পর ডেলিভারি দেয়া হয় না।</h5></div>
									<div class="col-md-2 col-sm-2" style="padding-top:50px;">Signature</div>
								</div>
							</div>
						</div>
					</div>
					</div>
					<div class="col-md-1 col-sm-1"></div>
				</div>
			</div>				
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
	</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>