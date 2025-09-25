<?php 
include 'header.php';
?>
<?php /* if(!cheque_permission('user-list')){ 
        include("404.php");
        exit();
 } */ ?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Rent Bill Collection</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Rent Bill Collection Form
            <a href="mr_list.php" style="float:right"><i class="fas fa-plus"></i> Bill List<a>
        </div>
        <div class="card-body">
			<form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
				<div class="table-responsive">          
					<table class="table table-borderless search-table">
						<tbody>
							<tr>  
								<td width="30%">
									<div class="form-group">
										<label for="id">Client name</label>
										<select name="client_name" id="client" class="form-control material_select_2">
											<option>Select Client</option>
											<?php 
											$sql	= "select * from `clients` ORDER BY `id` ASC";
											$result = mysqli_query($conn, $sql);
											while($row=mysqli_fetch_array($result))
												{
											?>
											<option value="<?php echo $row['id'] ?>"><?php echo $row['name'] ?></option>
											<?php } ?>
										</select>
									</div>
								</td>
								<td width="30%">
									<div class="form-group">
										<label for="id">Invoice No</label>
										<select class="form-control material_select_2" name="challan_no" id="project">
											<option value="">select project</option>

										</select>
									</div>
								</td>
								
								<td width="10%">
									<div class="form-group">
										<label for="todate">.</label>
										<button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
									</div>
								</td>
								<td width="30%"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<?php
			if(isset($_GET['submit'])){
				$challan_no = $_GET['challan_no'];
							$sqlch = "select * FROM `rents` WHERE `challan_no`='$challan_no'";
							$resultch = mysqli_query($conn, $sqlch);
							$rowch = mysqli_fetch_array($resultch);
			?>
			<form action="#" method="post" name="add_name" id="add_name">  
				<div class="row">
					<div class="col-sm-7">
						<div class="row">
							<?php
							$mr_id=$rowch['id'];
							$sql = "select * FROM `rents` WHERE `id`='$mr_id'";
							$result = mysqli_query($conn, $sql);
							$row = mysqli_fetch_array($result);
							?>
							
							<div class="col-sm-12">
								<table class="table table-condensed table-hover table-bordered">
									<tr>
										<?php $mrrno    =   get_mr_bill_no(); ?>
										<td>Bill/MR No# <?php echo $mrrno; ?><input type="hidden" name="mr_no" value="<?php echo $mrrno; ?>"></td>
										<td>Bill/MR Date# <input name="mr_date" type="text" class="form-control" id="fromdate" value="<?php echo date("Y-m-d"); ?>" size="" autocomplete="off" required /></td>
									</tr>
								</table>
							</div>
							
							<input type="hidden" name="client_id" value="<?php echo $row['client_name']; ?>"/>
							<input type="hidden" name="project_id" value="<?php echo $row['project_name']; ?>"/>
							<input type="hidden" name="challan_no" value="<?php echo $row['challan_no']; ?>"/>
							<input type="hidden" name="rent_id" value="<?php echo $row['id']; ?>"/>
						</div>
					</div>
					<div class="col-sm-5">
						<h3 style="border:1px solid gray;border-radius:5px;padding:20px;text-align:center;">Bill/Money Receipt</h3>
					</div>
				</div>
				<div class="row" style="">
					
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Invoice No</label>
							<input name="invoice_no" id="invoice_no" class="form-control" type="text" value="<?php echo $row['challan_no']; ?>" readonly />
						</div>
					</div>
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Invoice Amount</label>
							<input class="form-control" type="text" value="<?php echo $row['grandtotal']; ?>" readonly />
						</div>
					</div>
					
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Receiveable Amount</label>
							<input type="text" id="id-1" name="due_amount" value="<?php echo $row['due_amount']; ?>"  class="form-control" readonly >
						</div>
					</div>
							<input type="hidden" name="deposit_amount" value="<?php echo $row['deposit_amount']; ?>" >
							<input type="hidden" name="id" value="<?php echo $row['id']; ?>" >
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Receive Amount<span class="reqr"> ***</span></label>
							<input type="number" step=".01" min="1.0" max="<?php echo $row['due_amount']; ?>" autocomplete="off" name="amount" id="id-2" class="form-control" required>
						</div>
					</div>
					<div class="col-xs-1">
						<div class="form-group">
							<label for="id">Net Receiveable</label>
							<input type="text" autocomplete="off" id="id-3" class="form-control" readonly >
						</div>
					</div>
					<!---------------------Bank Dynamic Form Start---------------------->
					
					<div class="col-sm-3">
						<label>Payment Method</label>
						<select class="form-control" name="cb_method" id="switch">
							<option value="cash">Cash</option>
							<option value="cheque">Cheque</option>
						</select>
					</div>
					
					
					<div id="cheque-dropdown" style="display:none;width: 100%;">
						<div class="col-sm-3">
							<div class="form-group">
								<label for="id">Select Bank Name<span class="reqr"> is required***</span></label>
								<select class="form-control" name="bank_name" id="cheque">
									<option value=""></option>
									<option value="Dhaka Bank">Dhaka Bank</option>
									<option value="UCB Bank">UCB Bank</option>
								</select>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label for="id">Branch<span class="reqr"> is required***</span></label>
								<input type="text" autocomplete="off" name="bank_branch" class="form-control" >
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label for="id">Cheque No<span class="reqr"> is required***</span></label>
								<input type="text" autocomplete="off" name="bank_cheque_no" class="form-control" >
							</div>
						</div>
						<div class="col-sm-3">
							<div class="form-group">
								<label for="id">Cheque Date<span class="reqr"> is required***</span></label>
								<input type="text" autocomplete="off" name="bank_cheque_date" id="start_date" class="form-control" >
							</div>
						</div>
					</div>
					<!---------------------Bank Dynamic Form End---------------------->
					</div>
				</div>
				<div class="row" style="padding-top:10px;">
					<div class="col-xs-12">
						<div class="form-group">
							<label>Remarks</label>
							<textarea name="remarks" class="form-control"></textarea>
						</div>
					</div>
					<div class="col-xs-12">
						<div class="form-group">
							<input type="submit" name="mr_create" id="submit" class="btn btn-block btn-info" style="width:100%;" value="Generate Bill/Money Receipt" />  
						</div>
					</div>
				</div>
			</form>
			<?php } ?>
		</div>
    </div>

</div>
<script>
$(document).ready(function() {
			$("#client").on('change', function() {
				var clientid = $(this).val();

				$.ajax({
					method: "POST",
					url: "response2.php",
					data: {
						id: clientid
					},
					datatype: "html",
					success: function(data) {
						$("#project").html(data);
					}
				});
			});
		});
</script>
<script>
$(function () {
  $("#id-1, #id-2").keyup(function () {
    $("#id-3").val(+$("#id-1").val() - +$("#id-2").val());
  });
});
</script>
<script>
					$("#switch").change(function () {
					  switch($("#switch").val()) {
						case "cheque":
						  $("#name-input").css("display", "none")
						  $("#cheque-dropdown").css("display", "inline")
						  break
						default:
						  $("#cheque-dropdown").css("display", "none")
						  $("#name-input").css("display", "none")
					  }
					})
					</script>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
