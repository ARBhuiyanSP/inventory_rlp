<style>
.dtext{
	text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Receive Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td width="30%">
                                <div class="form-group">
                                    <label for="todate">Input Material Name/Part No/Specifications</label>
                                    <select class="form-control select2" id="material_name" name="material_name" required>
										<option value="">Select</option>
										<?php
										$projectsData = get_product_with_category();
										if (isset($projectsData) && !empty($projectsData)) {
											foreach ($projectsData as $data) {
												if($_GET['material_name'] == $data['id']){
												$selected	= 'selected';
												}else{
												$selected	= '';
												}
												?>
												<option value="<?php echo $data['id']; ?>"  <?php echo $selected; ?>><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?></option>
												<?php
											}
										}
										?>
									</select>
                                </div>
                            </td>
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
	$material_name	=	$_GET['material_name'];
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
					<?php
							$totalQty = 0;
							$totalAmount = 0;
							//$mrr_no = $row['mrr_no'];
							$sqlall	=	"SELECT a1.mrr_no,a1.mrr_date,a4.category_description,a3.material_id_code,a3.material_description,a5.unit_name,a3.part_no,a3.spec
							,a2.receive_qty,a2.unit_price,a2.total_receive,a1.remarks 
							FROM `inv_receive` a1 
							INNER JOIN `inv_receivedetail` a2 ON a1.mrr_no=a2.mrr_no
							INNER JOIN  `inv_material` a3 ON a2.material_name=a3.id
							INNER JOIN `inv_materialcategorysub` a4 ON a3.material_id=a4.id
							INNER JOIN `inv_item_unit` a5 ON a2.unit_id=a5.id WHERE 1=1 ";
							  if($material_name !=0){
								$sqlall	.=	"  AND a3.id ='$material_name' ";
							  } 
							$sqlall	.=	" AND a1.mrr_date BETWEEN '$from_date' AND '$to_date';";

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
					<center>
						<p>
							<img src="images/Saif_Engineering_Logo_165X72.png" height="50px;"/><br>
							<h2>SAIF POWERTEC LIMITED</h2>
							<h5>KAMALAPUR ICD MOTIJHEEL, DHAKA</h5>
							<p>DEPARTMENT:CTED-DHAKA(MAINTENANCE)KAMALAPUR ICD, PROJECT</p>
							<span>Materialwise Received Report</span></br>
							<span style="font-size:18px;font-weight:bold;">
								Material Name : <?php echo getMaterialNameByIdAndTableandId('inv_material',$material_name); ?></span></br>
							<span style="font-size:18px;">
								Part No : <?php echo getMaterialPartNoByIdAndTableandId('inv_material',$material_name); ?></br>
								Specification : <?php echo getMaterialSpecByIdAndTableandId('inv_material',$material_name); ?>
							</span></br>
							From <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?></span> To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
				<table id="" class="table table-bordered">
					<thead>
						<tr>
							<th style="text-align:center">Voucher Date</th>
							<th style="text-align:center">Voucher No</th>
							<th style="text-align:center">Unit</th>
							<th style="text-align:center">QTY</th>
							<th style="text-align:center">Unit Price</th>
							<th style="text-align:center">Amount</th>
							<th style="text-align:center">Remarks</th>
						</tr>
					</thead>
					<tbody>
					
				
						<?php
						foreach($detail as $key=>$rowall){
							
								$totalQty += $rowall['receive_qty'];
								$totalAmount += $rowall['total_receive'];
								$GLOBALS["grand_total_qty"]+=$rowall['receive_qty'];
                                $GLOBALS["grand_total_amount"]+=$rowall['total_receive'];

								$group_totalQty += $rowall['receive_qty'];
								$group_totalAmount += $rowall['total_receive'];
								
							
							
							?>
						<tr>
							<td style="text-align:center"><?php echo date("j M y", strtotime($rowall['mrr_date']));?></td>
							<td style="text-align:center"><?php echo $rowall['mrr_no']; ?></td>
							<td style="text-align:center"><?php echo $rowall['unit_name']; ?></td>
							<td style="text-align:center"><?php echo $rowall['receive_qty']; ?></td>
						    <td style="text-align:center"><?php echo $rowall['unit_price'] ?></td>
							<td style="text-align:right"><?php echo $rowall['total_receive'] ?></td>
							<td></td>
						</tr>

						<?php } ?>

						<tr>
						<tr>
									<td colspan="3" class="grand_total" style="text-align:right">Sub Total:</td>
									<td style="text-align:center">
										<?php 
										
										echo $group_totalQty ;
										

										?>
									</td>
									<td></td>
									<td style="text-align:right">
									<?php 
										echo $group_totalAmount ;
										?>
									</td>
									<td></td>
								</tr>
						</tr>
						
						<?php } ?>
						
						     <tr>
									<td colspan="3" class="grand_total" style="text-align:right">Grand Total:</td>
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
									<td></td>
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


