<?php 
include 'header.php';
$id = $_GET['no'];
$query = "SELECT * FROM rent_bill where `id`='$id' ORDER BY id DESC";  
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_array($result);

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
					$challan_no = $row['challan_no'];
					$queryDetails = "SELECT * FROM `rents` WHERE `challan_no`='$challan_no'";  
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
									<th>Invoice Date:</th>
									<td>
										<?php echo date("jS F Y", strtotime($rowDetails['date']));  
										?>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<center><h5>Money Receipt</h5></center>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-bordered" id="material_receive_list"> 
								<tr>
									<td style="width:50%">
										<b>To [Client Info]</b></br>
										<b><?php echo getNameByIdAndTable('clients',$rowDetails["client_name"]); ?></b></br>
										<?php echo getProjectNameById($rowDetails["project_name"]); ?></br>
										<?php echo getProjectAddressById($rowDetails["project_name"]); ?>
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
								<th>Bill No</th>  
								<th style="">Challan No</th>    
								<th style="">Amount</th>   
						   </tr>  
						   <?php
							$id = $_GET['no'];
							$queryData = "SELECT * FROM `rent_bill` WHERE `id`='$id' ORDER BY id DESC";  
							$resultData = mysqli_query($conn, $queryData);
							//$rowData = mysqli_fetch_array($resultData);
							   while($rowData = mysqli_fetch_array($resultData))  
							   {  
						   ?>  
						   <tr>  
								<td><?php echo $row["bill_no"]; ?></td>  
								<td><?php echo $row["challan_no"]; ?></td>     
								<td><?php echo $row["amount"]; ?></td>    
						   </tr>  
						   <?php  
						   }  
						   ?> 
						   <tr>  
								<td colspan="2" style="text-align:right"><b> Total:</b></td>    
								<td><?php echo $row["amount"]; ?></td>    
						   </tr>
						   <tr>
								<td colspan="2" class="grand_total" style="text-align:left;">
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
