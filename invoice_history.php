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
            <div class="row">
				<div class="col-sm-12">
					<?php 
					$queryDetails = "SELECT * FROM `rents` WHERE `challan_no`='$id'";  
					$resultDetails = mysqli_query($conn, $queryDetails);
					$rowDetails = mysqli_fetch_array($resultDetails);
					?>
					 <h5>Invoice's List For Challan No : <?php echo $rowDetails["challan_no"]; ?></h5>
					
					<div id="employee_table">  
						<table class="table table-bordered table-striped">  
						   <tr>  
								<th>Equipment Name</th>  
								<th>EEL Code</th>  
								<th style="width:10%;">Rent Date</th>  
								<th style="width:10%;">Return Date</th>   
								<th style="width:10%;">Amount</th>   
								<th style="width:10%;">Action</th>   
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
								<td>
									<a title="Invoice" class="btn btn-sm btn-success" href="single_invoice.php?id=<?php echo $row["id"]; ?>" target="blank" style="font-size:10px;"> Invoice</a>
								</td>    
						   </tr>  
						   <?php  
						   }  
						   ?> 
							
					  </table>  
				 </div>
					
				</div>
			</div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
