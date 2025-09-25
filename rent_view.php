<?php include 'header.php';
//$return_id=$_GET['no']; ?>
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

.challan{
	font-weight:bold;
}
</style>
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Invoice View
			<button class="btn btn-default" onclick="printDiv('printableArea')" style="float:right;"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></div>
			<div class="card-body" id="printableArea">
				<div class="row" style="padding-top:20px;">
					<div class="col-sm-1"></div>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-6">	
								<img src="images/spl.png" height="60px;"/>
								<p>
								<span>Plot #52, Road #301, Sector # 11,Purbachol New Town</br> Purbachol Express Highway,Dhaka</br>Email : billing@igniteautoworkshop.com</span></p></div>
							<div class="col-sm-6">
								<table class="table table-bordered">
								  <tr>
									<th>Internal Memo No:</th>
									<td>INV-001</td>
								  </tr>
								  <tr>
										<th>Date:</th>
										<td>1st August 2020										</td>
									</tr>
								</table>
							</div>
						</div>
						<center><button class="btn btn-block challan">INTERNAL MEMO</button></center>
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-bordered" id="material_receive_list"> 
									<tr>
										<td style="width:50%">
											<b>Client Info</b></br>
											Name : SAIF POWERTEC LTD</br>
											Division : SAIF POWER BATTERY</br>
											Phone : 01708154732</br>
											Email : pinky@igniteautoworkshop.com</br>
											Address : 95#Khawaja Tower, Mohakhali C/A, Dhaka-1212										</td>
										<td style="width:50%">
											<b>Driver Info</b></br>
											Name : Rasel</br>
											Phone : 01915761277										</td>
									</tr>
								</table>
							</div>
							<div class="col-sm-12">
								<table class="table" id="material_receive_list"> 
									<tr>
										<td>
											<b>Vehicle Info</b>
										</td>
									</tr>
									<tr>
										<td>
											Reg-No : DMT-GA-56-2723										</td>
										<td>
											Brand : TOYOTA										</td>
										<td>
											Year : 2012										</td>
									</tr>
									<tr>
										<td>
											Chassis-No : TRH200-0166941										</td>
										<td>
											Model : HIACE										</td>
										<td>
											Engine-No : 1TR-1208892										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="row">
															
														<div class="col-md-12">
								<table class="table table-bordered" id="material_receive_list"> 
									<thead>
										<tr style="background-color:#E9ECEF;">
											<th style="width:5%;">SL</th>
											<th style="width:75%;">Services Performed</th>
											<th style="width:10%;">Amount</th>
										</tr>
									</thead>
									<tbody id="material_receive_list_body">
																				<tr>
											<td>
												1											</td>
											<td>
												Gear Chamber Service with Open & Fitting											</td>
											<td style="text-align:right;">
												300											</td>
										</tr>
										
																				<tr>
											<td>
												2											</td>
											<td>
												Transmission Fluid Change											</td>
											<td style="text-align:right;">
												1000											</td>
										</tr>
										
																				<tr>
											<td>
												3											</td>
											<td>
												General Service											</td>
											<td style="text-align:right;">
												200											</td>
										</tr>
										
																				<tr>
											<td colspan="2" class="grand_total" style="text-align:right;">
												<b>Total:</b>
											</td>
											<td style="text-align:right;">
												1500											</td>
										</tr>
									</tbody>
								</table>
							</div>
																					<div class="col-sm-12">
								<div class="row" style="">
									<div class="col-sm-12">
									<table class="table table-bordered">
										<tr>
											<td class="grand_total" style="text-align:right;">
												<b>Grand Total Amount:</b>
											</td>
											<td style="text-align:right;">
												<b>1500</b>
											</td>
										</tr>
										<tr>
											<td colspan="2" class="grand_total" style="text-align:left;">
												<b>Amount In Words :One Thousand Five Hundred Taka  Only</b>
											</td>
										</tr>
									</table>
									</div>
									<div class="col-sm-12" style="text-align:center;">
																				<img src="images/approved.png" height="100px;" />
																			</div>
								</div> 
							</div>
						</div>
						
					</div>
					
					<div class="col-sm-1"></div>
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







