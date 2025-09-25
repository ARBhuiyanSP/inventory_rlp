<?php include 'header.php' ?>
<?php /* if(!check_permission('material-receive-details')){ 
        include("404.php");
        exit();
 } */ ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Reports</a>
        </li>
        <li class="breadcrumb-item active">Material Consumption Report</li>
    </ol>
    <style>
.dtext{
    text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-body">
       <style>
.dtext{
	text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Consumption Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							
							<td width="15%">
                                <div class="form-group">
                                    <label for="todate">From Date</label>
                                    <input type="text" class="form-control" id="from_date" name="from_date" value="<?php if(isset($_GET['from_date'])){ echo $_GET['from_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							<td width="15%">
                                <div class="form-group">
                                    <label for="todate">To Date</label>
                                    <input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							
							<td width="15%">
                                <div class="form-group">
                                    <label for="todate">.</label>
									<button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
                                </div>
                            </td>
							<td width="25%"></td>
                        </tr>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<?php
if(isset($_GET['submit'])){
	$from_date		=	$_GET['from_date'];
	$to_date		=	$_GET['to_date'];
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
	$grand_total_qty=0;
    $grand_total_amount=0;

?>
<center>
	
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="printableArea">
			<div class="row">
				<div class="col-sm-12">	
				<center>
						<p>
							<img src="images/Saif_Engineering_Logo_165X72.png" height="50px;"/><br>
							<span>Material Consumption Report</span></br>
							
							From <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?></span> To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
					</div>
			</div>
				<table id="" class="table table-bordered">
					<thead>
						<tr>
							<th style="text-align:center"> Date</th>
							<th style="text-align:center"> Ref No</th>
							<th style="text-align:center">Use In</th>
							<th style="text-align:center">Unit</th>
							<th style="text-align:center">QTY</th>
							<th style="text-align:center">Unit Price</th>
							<th style="text-align:center">Amount</th>
						</tr>
					</thead>
					<tbody>
					<?php
					
					$master_tables = " SELECT t1.id as master_id,'Issue' as type,t1.created_at,t1.remarks,p.code as p_code,p.project_name,inv_w.name as warehouse_name
FROM maintenance_cost as t1
INNER JOIN projects as p ON p.id=t1.project_id
INNER JOIN inv_warehosueinfo as inv_w ON inv_w.id=t1.warehouse_id


UNION ALL
SELECT t1.id as master_id,'maintenance' as type,t1.created_date as created_at,t1.remarks,p.code as p_code,p.project_name,inv_w.name as warehouse_name
FROM maintenance as t1
INNER JOIN projects as p ON p.id=t1.project_id
INNER JOIN inv_warehosueinfo as inv_w ON inv_w.id=t1.warehouse_id  ";

$master_tables_results = mysqli_query($conn, $master_tables);

while($masterRow=mysqli_fetch_array($master_tables_results))
{

	$master_id = $masterRow['master_id'];
	$type  	= $masterRow['type'];
	
							$totalQty = 0;
							$totalAmount = 0;
							//$mrr_no = $row['mrr_no'];
							$sqlall	=	"SELECT a1.mb_ref_id,a1.mb_date,a3.category_description,a2.material_id_code,a2.material_description,a4.unit_name
                            ,a1.mbout_qty,a1.mbout_val,a1.mbprice ,a1.eel_code              
                            FROM `inv_materialbalance` a1 
                            INNER JOIN  `inv_material` a2 ON a1.material_name=a2.id
                            INNER JOIN `inv_materialcategorysub` a3 ON a2.material_id=a3.id
                            INNER JOIN `inv_item_unit` a4 ON a1.mbunit_id=a4.id
                            WHERE 1=1 AND mbtype='$type' AND mb_ref_id='$master_id'  ";
							  
							$sqlall	.=	" AND a1.mb_date BETWEEN '$from_date' AND '$to_date';";

							$resultall = mysqli_query($conn, $sqlall);

							$resize_data =[];
							while($rowall=mysqli_fetch_array($resultall))
							{
								$resize_data[$rowall["category_description"]][]=$rowall;
							}

							

							foreach($resize_data as $key=>$detail)
							{
								
								$group_totalQty = 0;
								$group_totalAmount = 0;
								
						?>
					
				
					
				
						<?php
						foreach($detail as $key=>$rowall){
							
								$totalQty += $rowall['mbout_qty'];
								$totalAmount += $rowall['mbout_val'];
								
							
							
							?>
							<?php
							if($key ==0){ ?>
								<tr style="text-align:left;background-color:#F7F7F7;font-weight:bold;">
								<td>Issue NO:<?php echo $masterRow['master_id'] ?? '' ?></td>
								<td>DATE:<?php echo $masterRow['created_at'] ?? '' ?></td>
								<td colspan="2">Warehouse Name:<?php echo $masterRow['warehouse_name'] ?? '' ?></td>
								<td colspan="2">Project Name:<?php echo $masterRow['project_name'] ?? '' ?></td>
								
								
								</tr>
							<?php }

							?>
						<tr>
							<td style="text-align:center"><?php echo date("j M y", strtotime($rowall['mb_date']));?></td>
							<td style="text-align:center"><?php echo $rowall['mb_ref_id']; ?></td>
							<td style="text-align:right"><?php echo $rowall['eel_code'] ?></td>
							<td style="text-align:center"><?php echo $rowall['unit_name']; ?></td>
							<td style="text-align:center"><?php echo $rowall['mbout_qty']; ?></td>
						    <td style="text-align:center"><?php echo $rowall['mbprice'] ?></td>
							<td style="text-align:right"><?php echo $rowall['mbout_val'] ?></td>
						</tr>

						<?php }  } ?>
						
							<?php } ?> <!-- End of Master data Loop-->
						
						     <tr>
									<td colspan="4" class="grand_total" style="text-align:right;font-weight:bold;">Grand Total:</td>
									<td style="text-align:center">
										<?php 
										
										echo $totalQty ;
										

										?>
									</td>
									<td></td>
									<td style="text-align:right">
									<?php 
										echo $totalAmount ;
										?>
									</td>
								</tr>
								
					       </tbody>
						   
						   
				</table>
				<center><div class="row">
					<div class="col-sm-6"></br></br>--------------------</br>Receiver Signature</div>
					<div class="col-sm-6"></br></br>--------------------</br>Authorised Signature</div>
				</div></center></br>
				<div class="row">
					<div class="col-sm-12" style="border:1px solid gray;border-radius:5px;padding:10px;color:#f26522;">
						<center><h5>Notice***</br><span style="font-size:14px;color:#000000;">Please Check Everything Before Signature</span></h5></center>
						
					</div>
				</div>
			</div>			
		</div>
		<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="    font-size: 17px;"> Print</i></button></center>
		<div class="col-md-1"></div>
</center>
<?php }?>
<script>
function printDiv(divName) {
	 var printContents = document.getElementById(divName).innerHTML;
	 var originalContents = document.body.innerHTML;

	 document.body.innerHTML = printContents;

	 window.print();

	 document.body.innerHTML = originalContents;
}
</script>
<script>
    $(function () {
        $("#from_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<script>
    $(function () {
        $("#to_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>



    </div>
</div>



</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>