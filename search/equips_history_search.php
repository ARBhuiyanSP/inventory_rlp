<style>
.dtext{
	text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Equipments Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td width="15%">
                                <div class="form-group">
                                    <label for="todate">Equipments Name</label>
                                    <select class="form-control select2" name="equipments" id="equipments" required >
										<option value="">Select</option>
										<?php
										$projectsData = getTableDataByTableName('equipments', '', 'eel_code');
										if (isset($projectsData) && !empty($projectsData)) {
											foreach ($projectsData as $data) {
												if($_GET['equipments'] == $data['eel_code']){
												$selected	= 'selected';
												}else{
												$selected	= '';
												}
												?>
												<option value="<?php echo $data['eel_code']; ?>" <?php echo $selected; ?>><?php echo $data['eel_code'].'|'.$data['name']; ?></option>
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
							<td width="40%"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<?php
if(isset($_GET['submit'])){
	
	$equipments		=	$_GET['equipments'];
	$from_date		=	$_GET['from_date'];
	$to_date		=	$_GET['to_date'];
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
	
	
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
							<h2>SAIF POWERTEC LIMITED</h2>
							<h5>KAMALAPUR ICD MOTIJHEEL, DHAKA</h5>
							<p>DEPARTMENT:CTED-DHAKA(MAINTENANCE)KAMALAPUR ICD, PROJECT</p> 
							<span>Equipments Cost History Report</span></br>
							<span style="font-size:18px;font-weight:bold;">Equipment Name : <?php echo $equipments; ?></span></br>
							From <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?></span> To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
				<table id="" class="table table-bordered list-table-custom-style">
					<thead>
						<tr>
							<th>Date</th>
							<th>Ref No</th>
							<th>Material Name</th>
							<th>Part No</th>
							<th>Type</th>
							<th>Unit</th>
							<th>QTY</th>
							<th>Unit Price</th>
							<th>Amount</th>

						</tr>
					</thead>
					<tbody>
						<?php
							$totalQty = 0;
							$totalAmount = 0;
							$sqlall	=	"SELECT * FROM `inv_materialbalance` WHERE `eel_code` = '$equipments' AND `mbtype` ='Issue' AND `mb_date` BETWEEN '$from_date' AND '$to_date'";
							$resultall = mysqli_query($conn, $sqlall);
							while($rowall=mysqli_fetch_array($resultall))
							{
								$totalQty += $rowall['mbout_qty'];
								$totalAmount += $rowall['mbout_qty'] * $rowall['mbout_val'];
								
						?>
						<tr>
							<td><?php echo date("j M y", strtotime($rowall['mb_date']));?></td>
							<td><a href="issue-view.php?no=<?php echo $rowall['mb_ref_id']; ?>" target="blank"><?php echo $rowall['mb_ref_id']; ?></a></td>
							<td><?php 
								echo getMaterialNameByIdAndTableandId('inv_material',$rowall['material_name']);
							?>
							</td>
							<td><?php echo $rowall['part_no']; ?></td>
							<td><?php echo $rowall['mbtype']; ?></td>
							
							<td><?php echo getDataRowByTableAndId('inv_item_unit', $rowall['mbunit_id'])->unit_name; ?></td>
							<td style="text-align:right;"><?php echo $rowall['mbout_qty']; ?></td>
							<td style="text-align:right;"><?php echo $rowall['mbout_val']; ?></td>
							<td style="text-align:right;"><?php echo $rowall['mbout_qty'] * $rowall['mbout_val'];?></td>
						</tr>
						<?php } ?>
						<tr style="text-align:right;">
							<td colspan="6"> <b>Total:</b></td>
							<td></td>
							<td></td>
							<td><b><?php echo $totalAmount; ?></b></td>
						</tr>
						<tr style="text-align:left;">
							<td colspan="9"> <b>Total Amount in words: <span class="amountWords" style="text-decoration:underline;"><?php echo convertNumberToWords2($totalAmount).' Only';?></span></b></td>
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


