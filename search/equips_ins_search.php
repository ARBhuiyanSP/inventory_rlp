
<div class="card mb-3">
    <div class="card-header">
        <i class="fas fa-search"></i>
        Equipments Inspection Report Search</div>
    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td width="15%">
                                <div class="form-group">
                                    <label for="todate">Equipments Name</label>
                                    <select class="form-control select2" id="project_id" name="eel_code">
											<?php $results = mysqli_query($conn, "SELECT * FROM `equipments`"); 
											while ($row = mysqli_fetch_array($results)) {
												if($_POST['eel_code'] == $row['eel_code']){
													$selected	= 'selected';
													}else{
													$selected	= '';
													}
												?>
											<option value="<?php echo $row['eel_code']; ?>" <?php echo $selected; ?>><?php echo $row['eel_code']; ?> || <?php echo $row['name']; ?></option>
											<?php } ?>
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
	
	$eel_code		=	$_GET['eel_code'];
	$from_date		=	$_GET['from_date'];
	$to_date		=	$_GET['to_date'];
		$sql	=	"select * from `equipments` where `eel_code`='$eel_code'";
		$result = mysqli_query($conn, $sql);
		$row=mysqli_fetch_array($result);
	
	
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
							<span>Equipments Inspection History Report</span></br>
							From  <span class="dtext"><?php echo date("jS F Y", strtotime($from_date));?> </span>To  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?>
						</p>
						<table class="table" style="">
							<tr>
								<th>Name:</th>
								<td><?php echo $row['name']; ?>
								</td>
								<th>EEL Code:</th>
								<td><?php echo $row['eel_code'] ?></td>
								<th>Brand:</th>
								<td><?php echo $row['makeby'] ?></td>
								
							</tr>
							<tr>
								<th>Model:</th>
								<td><?php echo $row['model'] ?></td>
								<th>Origin:</th>
								<td><?php echo $row['origin'] ?></td>
								<th>Purchase Date:</th>
								<td><?php //echo $row['purchase_date'] ?></td>
							</tr>
						</table>
						<table id="" class="table table-bordered table-striped" style="">
							<thead>
								<tr>
									<th>Inspection Date</th>
									<th>Remarks</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
							<?php
								$eel_code = $row['eel_code'];
								$sqlh	=	"select * FROM `inspaction` WHERE `eel_code`='$eel_code' AND `ins_date` BETWEEN '$from_date' AND '$to_date'";
								$resulth = mysqli_query($conn, $sqlh);
								while ($rowh = mysqli_fetch_array($resulth)) {
									?>
							
								<tr>
									<td><?php 
									if($rowh['ins_date']){
										$rDate = strtotime($rowh['ins_date']);
										$rfDate = date("jS \of F Y",$rDate);
										echo $rfDate;
									}else{
										echo '---';
									}
									?>
									</td>
									<td><?php echo $rowh['remarks'] ?></td>
									<td><?php echo $rowh['status'] ?></td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
					</center>
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


