<style>
.dtext{
	text-decoration:underline;
}
</style>
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Notesheet Details Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td>
                                <div class="form-group">
                                    <label for="todate">From Date</label>
                                    <input type="text" class="form-control" id="from_date" name="from_date" value="<?php if(isset($_GET['from_date'])){ echo $_GET['from_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							<td>
                                <div class="form-group">
                                    <label for="todate">To Date</label>
                                    <input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							
							<td>
                                <div class="form-group">
                                    <label for="todate">.</label>
									<button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
                                </div>
                            </td>
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
							<h5>E-Engineering Ltd</h5> 
							<span>Notesheet Details Report</span></br>
							From <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?></span> To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
            <table id="" class="table table-bordered">
					<thead>
						<tr style="">
							<th>Material Name</th>
							<th>Part No</th>
							<th>QTY</th>
							<th>Price</th>
							<th>Amount</th>
							<th>Purpose/Equips</th>
							<th>Supplier/Vendor</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$sql	=	"SELECT * FROM `notesheets_master` where `created_at` BETWEEN '$from_date' AND '$to_date';";
							$result = mysqli_query($conn, $sql);
							while($row=mysqli_fetch_array($result))
							{
						?>
						<tr style="background-color:#E9ECEF;">
							<td colspan="2"><b>NS No :</b> <?php echo $row['notesheet_no']; ?></td>
							<td colspan="2"><b>RLP No :</b> <?php echo $row['rlp_no']; ?></td>
							<td colspan="2"><b>Project :</b> <?php echo getProjectNameById($row['request_project']); ?></td>
							<td colspan="1"><b>Date :</b> <?php echo date("m-d-Y", strtotime($row['created_at']));?></td>
							
						</tr>
						<?php
							$totalQty = 0;
							$totalAmount = 0;
							$notesheet_no = $row['notesheet_no'];
							$sqlall	=	"SELECT * FROM `notesheets` WHERE `notesheet_no` = '$notesheet_no';";
							$resultall = mysqli_query($conn, $sqlall);
							while($rowall=mysqli_fetch_array($resultall))
							{
								$totalQty += $rowall['quantity'];
								$totalAmount += $rowall['total'];
                                $GLOBALS["grand_total_qty"]+=$rowall['quantity'];
                                $GLOBALS["grand_total_amount"]+=$rowall['total'];
                                
						?>
						<tr style="text-align:right;">
							<td><?php 
								$mb_materialid = $rowall['item'];
								$sqlname	=	"SELECT * FROM `inv_material` WHERE `id` = '$mb_materialid' ";
								$resultname = mysqli_query($conn, $sqlname);
								$rowname=mysqli_fetch_array($resultname);
								echo $rowname['material_description'];
							?>
							</td>
							<td><?php echo getMaterialPartNoByIdAndTableandId('inv_material',$rowall['item']); ?></td>
							
							<td><?php echo $rowall['quantity']; ?> <?php echo $rowall['unit']; ?></td>
							<td><?php echo $rowall['unit_price']; ?></td>
							<td><?php echo $rowall['total']; ?></td>
							<td><?php echo $rowall['purpose']; ?></td>
							<td><?php 
								$supplier_id = $row['supplier_name'];
								$sqlunit	=	"SELECT * FROM `suppliers` WHERE `id` = '$supplier_id'  ";
								$resultunit = mysqli_query($conn, $sqlunit);
								$rowunit=mysqli_fetch_array($resultunit);
								echo $rowunit['name'];
								?>
							</td>
						</tr>
						<?php } ?>
						<tr style="text-align:right;font-weight:bold;">
							<td colspan="2" class="grand_total" style="text-align:right">Sub Total:</td>
							<td><?php echo $totalQty; ?></td>
							<td></td>
							<td><?php echo $totalAmount; ?></td>
							<td></td>
							<td></td>
						</tr>
						<?php } ?>
					</tbody>
                    <tfoot>
						<tr style="text-align:right;">
							<th colspan="2"><b style='float:right'>GRAND TOTAL</b></th>
							<th><?php echo $grand_total_qty; ?></th>
                            <th></th>
                            <th><?php echo $grand_total_amount; ?></th>
                            <th></th>
                            <th></th>
						</tr>
					</tfoot>
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


