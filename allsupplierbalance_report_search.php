<?php include 'header.php' ?>
<?php if(!check_permission('material-history')){ 
        include("404.php");
        exit();
 } ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="report.php">Reports</a>
        </li>
        <li class="breadcrumb-item active">All Party/Client Account Status Report</li>
    </ol>

<style>
.dtext{
	text-decoration:underline;
}
.table th, .table td{
	padding:5px;
}

</style>

<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        All Supplier  Balance Status report</div>
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
	
	
	
?>
<center>
	
	<div class="row">
		<div class="col-md-12" id="printableArea">
				<table id="htmltable" class="table table-bordered table-striped ">
					<thead>
						<tr>
							<th colspan="9">
								<center>
										<img src="images/Saif_Engineering_Logo_165X72.png" height="100px;"/><br>
										<span>All Supplier Account Status Report</span><br>
										From  <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?> </span>To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span>
								</center>
							</th>
						</tr>
						<tr>
							<th width="5%">SL</th>
							<th width="10%">Party ID</th>
							<th width="30%">Party Name</th>
							
							
							<th class="text-center">Previous Balance</th>
							<th class="text-center">Bill amount</th>
							<th class="text-center">Paid amount</th>
							
							<th class="text-center" width="15%">Due Balance</th>
							
						</tr>
					</thead>
					<tbody>
					
					
					
					
					
    <?php
	

						
					$sql	=	" SELECT s1.client_name,s1.client_id,SUM(IFNULL(s1.previous_balance,0)) as previous_balance,SUM(IFNULL(s1.sum_debit_amount,0)) as sum_debit_amount,SUM(IFNULL(s1.sum_credit_amount,0)) as sum_credit_amount, SUM(IFNULL(s1._balance,0)+IFNULL(s1.previous_balance,0)) as _balance FROM (

SELECT 'opening' as _type, t2.name as client_name,t1.client_id,SUM(IFNULL(t1.cb_cr_amount,0)-IFNULL(t1.cb_dr_amount,0)) as previous_balance,0 as sum_debit_amount,0 as sum_credit_amount,0 as _balance
						FROM client_balance as t1 
						INNER JOIN clients as t2 ON t1.client_id=t2.id 
						WHERE 1=1 AND t1.cb_date < '$from_date'
                        GROUP BY t1.client_id
   UNION ALL
SELECT 'current' as _type, t2.name as client_name,t1.client_id,0 as previous_balance,t1.cb_dr_amount as sum_debit_amount,t1.cb_cr_amount as sum_credit_amount,t1.cb_cr_amount-t1.cb_dr_amount as _balance
						FROM client_balance as t1 
						INNER JOIN clients as t2 ON t1.client_id=t2.id 
						WHERE 1=1 AND t1.cb_date BETWEEN '$from_date' AND '$to_date'
    ) as s1 GROUP BY s1.client_id ";
						
					
						
						$result = mysqli_query($conn, $sql);
						
						$balance_sum 	=	0; //total sum balance amount variable declare
						$totaldr 	=	0; //total sum balance amount variable declare
						$totalcr =	0; //total goods receive cr variable declare
						$sl=1;
						while($row=mysqli_fetch_array($result))
						{			
							
					?>
					
					
					
					
					
					
					<tr>
						<td><?php echo $sl++; ?></td>
							<td><?php echo $row['client_id'];?></td>
							<td><?php  echo $row['client_name'] ?? ''; ?></td>
							<td style="text-align:right;">
							<?php $previous_balance = $row['previous_balance'] ?? 0;
							echo number_format((float)$previous_balance, 2, '.', '');
							?>
							</td>
							<td style="text-align:right;">
							<?php $totcredit = $row['sum_credit_amount'] ?? 0;
							echo number_format((float)$totcredit, 2, '.', '');
							?>
							</td>
							
							<!-- Debit AMOUNT -->
							<td style="text-align:right;">
								<?php 
									$totdebit = $row['sum_debit_amount'] ?? 0;
									echo number_format((float)$totdebit, 2, '.', '');
								?>
							</td>
							<!-- BALANCE -->
							
							<td style="text-align:right;">
								<?php

							$balance =  $row['_balance'] ?? 0; echo number_format((float)$balance, 2, '.', ''); //row balance amount debit - credit
								
							$balance_sum+=$balance; //total sum balance amount 
							$totalcr+=$totcredit;	//total goods receive from supplier
							$totaldr+=$totdebit;	//total goods receive from supplier

							
								?>
							</td>		
					</tr>
						<?php
							} // end of for loop;
						?>
						
						
						
						<tr>
						
							<td colspan="4" style="text-align:right">Total</td>
							<td style="text-align:right;font-weight: bold;"><?php echo number_format((float)$totalcr, 2, '.', ''); ?></td>
							<td style="text-align:right;font-weight: bold;"><?php echo number_format((float)$totaldr, 2, '.', ''); ?></td>
							<td style="text-align:right;font-weight: bold;"><?php echo number_format((float)$balance_sum, 2, '.', ''); ?></td>
						
						</tr>
						<?php 
						
							$rowcount=mysqli_num_rows($result);
							if($rowcount < 1) { ?>
								<tr><td colspan="6"><center>No Data Found</center></td></tr>
	<?php 
	} // end of for loop;
	?>
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
		<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="font-size: 17px;"> Print</i></button><button id="exporttable" class="btn btn-default"><i class="fas fa-file-excel" aria-hidden="true" style="font-size: 17px;"> Export xls</i></button></center>
		
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
<script>
$(function() {
$("#exporttable").click(function(e){
var table = $("#htmltable");
if(table && table.length){
$(table).table2excel({
exclude: ".noExl",
name: "Excel Document Name",
filename: "BBBootstrap" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
fileext: ".xls",
exclude_img: true,
exclude_links: true,
exclude_inputs: true,
preserveColors: false
});
}
});

});
</script>
</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

