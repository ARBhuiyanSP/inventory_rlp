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
        <li class="breadcrumb-item active"> Rent List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Invoice Create
            <a href="mr_list.php" style="float:right"><i class="fas fa-plus"></i> List<a>
        </div>
        <div class="card-body">
            <form action="#" method="post" name="add_name" id="add_name">  
				<div class="row">
					<div class="col-sm-7">
						<div class="row">
							<?php
							$mr_id=$_GET['id'];
							$sql = "select * FROM `rents` WHERE `id`='$mr_id'";
							$result = mysqli_query($conn, $sql);
							$row = mysqli_fetch_array($result);
							?>
							
							<div class="col-sm-12">
								<table class="table table-condensed table-hover table-bordered">
									<tr>
										<?php $mrrno    =   get_mr_bill_no(); ?>
										<td>Invoice No# <input type="text" name="mr_no" class="form-control" value="<?php echo $mrrno; ?>" readonly ></td>
										<td>Invoice Date# <input name="mr_date" type="text" class="form-control" id="fromdate" value="<?php echo date("Y-m-d"); ?>" size="" autocomplete="off" required /></td>
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
						<h3 style="border:1px solid gray;border-radius:5px;padding:20px;text-align:center;">Client Invoice</h3>
					</div>
				</div>
				<div class="row" style="">
					
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Challan No</label>
							<input name="invoice_no" id="invoice_no" class="form-control" type="text" value="<?php echo $row['challan_no']; ?>" readonly />
						</div>
					</div>
					<div class="col-xs-2">
						<div class="form-group">
							<label for="id">Challan Amount</label>
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
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>

<script>
$(function () {    
  get_rent_data_table();
})

function get_rent_data_table(){

  let project_id   = '';
  let sub_project_id   = '';
    //getDataTablelogsheetList call from  grid_management.php
    var url       =   baseUrl + "function/grid_management.php?process_type=getDataTableRentList";
//logsheet_list_table  reference logsheet-list.php
    var userListDataTable   =   $('#rent_list_table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url:url,
                type:'POST',
                dataType:'json',
                data: {
                    project_id		: project_id,
                    sub_project_id	: sub_project_id
                }
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ -1, 2, 3 ] }
            ],
            "lengthMenu": [[10, 100, 250, -1], [10,100, 250,"All"]]
        });


}




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