
<?php 
include 'header.php';
ini_set('display_errors', 0);
?>
<script src="https://res.cloudinary.com/dxfq3iotg/raw/upload/v1569818907/jquery.table2excel.min.js"></script>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Reports List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        
        <div class="card-body">
		 <div class="row">
							<div class="col-sm-12">
								<form action="" method="post">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label>Category</label>
												<select class="form-control select2" id="material_id" name="material_id">
														<option value="all">All Category</option>
														<?php
														$category_resize_data = category_tree();
														$html = '';
														function generateOptions($category_resize_data, $indent = 0) {
															foreach ($category_resize_data as $key => $value) {
																if(isset($_POST['material_id']) && $_POST['material_id'] == $value['id']){
																$selected	= 'selected';
																}else{
																$selected	= '';
																}
																echo '<option value="' . $value['id'] . '"'.$selected.'>' . str_repeat('-', $indent * 1) . $value['id'].'-' .$value['category_description']. '</option>';
																if (is_array($value['children']) && !empty($value['children'])) {
																	generateOptions($value['children'], $indent + 1);
																}
															}
														}
														
														generateOptions($category_resize_data);
														?>
												</select>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<label></label>
												<input type="submit" name="submit" id="submit" class="btn btn-block btn-success" value="Search" />
											</div>
										</div>
									</div>
								</form>
							</div>
							</div>
							 <?php
if(isset($_POST['submit'])){
	$material_id		= $_POST['material_id'];
	
	//query from db
	
	$resultSet = mysqli_query($conn, "SELECT * FROM `inv_material` WHERE `is_manual_code_edit` =  '0'".($material_id!='all'?" AND `material_id` = '$material_id'":'')." ");
	$count = $resultSet->num_rows;
	
/* 	echo "<pre>";
print_r($resultSet);
echo "</pre>"; */
	
	if($resultSet->num_rows > 0){
		echo "<div id='printableArea'><center><h1 align='center'><img src='images/spl.png' height='50' style='padding-top:10px'></h1><h2>SAIF POWERTEC LIMITED</h2><h5>KAMALAPUR ICD MOTIJHEEL, DHAKA</h5><p>DEPARTMENT:CTED-DHAKA(MAINTENANCE)KAMALAPUR ICD, PROJECT</p><h3>Material List Report</h3>Total Material: $count</center>";
		echo "<table id='htmltable' class='table table-bordered table-striped list-table-custom-style'>
		<tr>
			<th>Material Name</th>
			<th>Material Code</th>
			<th>Category</th>
			<th>Part No</th>
			<th>Specification</th>
		</tr>";

		$i = 0;
		while($rows = $resultSet->fetch_assoc()) {
			$i++;
			echo "<tr>
					<td>" . $rows['material_description'] .' || '.$rows['material_id_code']. "</td>
					<td>" . $rows['material_id_code']. "</td>
					<td>" . getCategoryNameById($rows['material_id']) . "</td>
					<td>" . $rows['part_no'] . "</td>
					<td>" . $rows['spec'] . "</td>
					
				</tr>";
			
		}
		echo "</table></div>";
	}
	else{
		echo "<center>No Result</center>";
	}
}
?>
<div class="row">
	<div class="col-sm-12">
		<center>
			<a class="btn btn-default" onclick="printDiv('printableArea')" value="print a div!" style="margin-top:5px;">
				<i class="fa fa-print"></i> Print 
			</a>
			
			<a id="exporttable" class="btn btn-default" value="" style="margin-top:5px;">
				<i class="fa fa-file-excel-o"></i> Export xls 
			</a>
			
		</center>
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
                    <!-- /.box-body -->
                </div>
    </div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script>
$(function() {
$("#exporttable").click(function(e){
var table = $("#htmltable");
if(table && table.length){
$(table).table2excel({
exclude: ".noExl",
name: "Excel Document Name",
filename: "EEL_Equipment" + new Date().toISOString().replace(/[\-\:\.]/g, "") + ".xls",
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
