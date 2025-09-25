<?php 
include 'header.php';


 if(!check_permission('equipment-list')){ 
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
        <li class="breadcrumb-item active">Equipment Rent Invoice</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-body">
            <div class="row" id="printableArea" style="padding-top:20px;">
				<div class="col-sm-12">
					<div class="row">
						<div class="col-sm-6">	
							<img src="images/spl.png" height="80px;"/>
						</div>
						<div class="col-sm-6">
							<img src="images/hotline.png" height="50px;"/ style="float:right;">
						</div>
					</div>
					<?php 
					$queryDetails = "SELECT * FROM `rents` WHERE `challan_no`='$id'";  
					$resultDetails = mysqli_query($conn, $queryDetails);
					$rowDetails = mysqli_fetch_array($resultDetails);
					?>
					<div class="row">
						<div class="col-sm-6">	
							<p>
							<span>Khawaja Tower[7th Floor]</br>95 Bir Uttam A.K Khandokar Road, Mohakhali C/A</br>Dhaka-1212, Bangladesh</span></p></div>
						<div class="col-sm-6">
							<table class="table table-bordered">
							  <tr>
								<th>Internal Memo No:</th>
								<td><?php echo $rowDetails["challan_no"]; ?></td>
							  </tr>
							  <tr>
									<th> Invoice Date:</th>
									<td>
										<?php echo date("jS F Y", strtotime($rowDetails['date']));  
										?>
									</td>
								</tr>
							  <tr>
									<th> Invoice Print Date:</th>
									<td>
										<?php echo date("jS F Y");  
										?>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<center><h5> INVOICE </h5></center>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered" id="material_receive_list"> 
								<tr>
									<td style="width:50%">
										<b>From</b></br>
										<b>E Engineering Ltd</b></br>
										<span>Khawaja Tower[7th Floor]</br>95 Bir Uttam A.K Khandokar Road, Mohakhali C/A</br>Dhaka-1212, Bangladesh</span>
									</td>
									<td style="width:50%">
										<b>To [Client Info]</b></br>
										<b><?php echo getNameByIdAndTable('clients',$rowDetails["client_name"]); ?></b></br>
										<?php echo getProjectNameById($rowDetails["project_name"]); ?></br>
										<?php echo getProjectAddressById($rowDetails["project_name"]); ?>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<center><h5>Rented Equipment List</h5></center>
					<div id="employee_table">  
						<table class="table table-bordered table-striped">  
						   <tr>  
								<th>Equipment Name</th>  
								<th>EEL Code</th>  
								<th style="width:10%;">Rent Date</th>  
								<th style="width:10%;">Return Date</th>   
								<th style="width:10%;">Amount</th>   
						   </tr>  
							<?php
							$totalamount = 0;
							$id = $_GET['id'];
							$query = "SELECT * FROM rent_history where `challan_no`='$id' ORDER BY eel_code DESC";  
							$result = mysqli_query($conn, $query); 
							while($row = mysqli_fetch_array($result))  
								{  
								$totalamount += $row["amount"];
							?>  
						   <tr>  
								<td><?php echo getEquipmentNameByEELCode($row["eel_code"]); ?></td>  
								<td><?php echo $row["eel_code"]; ?></td>  
								<td><?php echo $row["rent_date"]; ?></td>  
								<td><?php echo $row["return_date"]; ?></td>    
								<td><?php echo $row["amount"]; ?></td>    
						   </tr>  
						   <?php  
						   }  
						   ?> 
							<tr>  
								<td colspan="4" style="text-align:right"><b>Sub Total:</b></td>    
								<td><?php echo $totalamount; ?></td>    
						   </tr>
						   <tr>  
								<td colspan="4" style="text-align:right"><b>Discount:</b></td>    
								<td><?php echo $rowDetails["discount"]; ?></td>    
						   </tr>
						   <tr>  
								<td colspan="4" style="text-align:right"><b>Grand Total:</b></td>    
								<td><?php echo $grandtotal = $totalamount - $rowDetails["discount"]; ?></td>    
						   </tr>
						   <tr>  
								<td colspan="4" style="text-align:right"><b>Received Amount:</b></td>    
								<td><?php echo $received = $rowDetails["deposit_amount"]; ?></td>    
						   </tr>
						   <tr>  
								<td colspan="4" style="text-align:right"><b>Net Receivable Amount:</b></td>    
								<td><?php echo $receivable = $grandtotal - $received; ?></td>    
						   </tr>
						   <tr>
								<td colspan="5" class="grand_total" style="text-align:left;">
									<b>Amount In Words :<span style="font-style: italic;text-decoration:underline;"><?php echo convertNumberToWords($receivable);?></span> Only</b>
								</td>
							</tr>
					  </table>  
				 </div>
					
				</div>
				<div class="col-sm-12">
				<center><button class="btn btn-default" onclick="printDiv('printableArea')" style=""><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button></center></div>
				
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
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
