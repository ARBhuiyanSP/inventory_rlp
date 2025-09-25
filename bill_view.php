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
							<img src="images/hotline.png" height="50px;" style="float:right;">
						</div>
					</div>
					<?php 
					$id = $_GET['no'];
					$query = "SELECT * FROM rent_invoice where `id`='$id' ORDER BY id DESC";  
					$result = mysqli_query($conn, $query);
					$row = mysqli_fetch_array($result);
					?>
					<div class="row">
						<div class="col-sm-6">	
							<p>
							<span>Khawaja Tower[7th Floor]</br>95 Bir Uttam A.K Khandokar Road, Mohakhali C/A</br>Dhaka-1212, Bangladesh</span></p></div>
						<div class="col-sm-6">
							<table class="table table-bordered">
							  <tr>
								<th>Challan No:</th>
								<td><?php echo $row["challan_no"]; ?></td>
							  </tr>
							  <tr>
								<th>Invoice No:</th>
								<td><?php echo $row["invoice_no"]; ?></td>
							  </tr>
							  <tr>
									<th>Invoice Date:</th>
									<td>
										<?php echo date("jS F Y", strtotime($row['invoice_date']));  
										?>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<center><h5>INVOICE</h5></center>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered" id="material_receive_list"> 
								<tr>
									<td style="width:50%">
										<b>To [Client Info]</b></br>
										<b><?php echo getNameByIdAndTable('clients',$row["client_name"]); ?></b></br>
										<?php echo getProjectNameById($row["project_name"]); ?></br>
										<?php echo getProjectAddressById($row["project_name"]); ?>
									</td>
									<td></td>
								</tr>
							</table>
						</div>
					</div>
					<center><h5></h5></center>
					<div id="employee_table">  
						<table class="table table-bordered table-striped">  
						   <tr>  
								<th>Rented Equipments</th>    
								<th style="">Amount</th>   
						   </tr>  
						   <?php
							$id = $_GET['no'];
							$queryData = "SELECT * FROM `rent_invoice` WHERE `id`='$id' ORDER BY id DESC";  
							$resultData = mysqli_query($conn, $queryData);
							//$rowData = mysqli_fetch_array($resultData);
							   while($rowData = mysqli_fetch_array($resultData))  
							   {  
						   ?>  
						   <tr>   
								<td>
									<?php 
									$rent_id = $rowData['rent_id'];
									$rent_details    =   getRentDetailsData($rent_id);   
									$rent_info       =   $rent_details['rents'];
									$rent_details    =   $rent_details['rent_details'];
					
										foreach($rent_details as $dataDetails){ echo $dataDetails->eel_code.','; }
									?>
								</td>     
								<td><?php echo $row["amount"]; ?></td>    
						   </tr>  
						   <?php  
						   }  
						   ?> 
						   <tr>  
								<td style="text-align:right"><b> Total:</b></td>    
								<td><?php echo $row["amount"]; ?></td>    
						   </tr>
						   <tr>
								<td class="grand_total" style="text-align:left;">
									<b>Amount In Words :<span style="font-style: italic;text-decoration:underline;"><?php echo convertNumberToWords($row["amount"]);?></span> Only</b>
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
