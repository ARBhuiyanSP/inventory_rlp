<style>
.dtext{
	text-decoration:underline;
}
.linktext{
	font-size:12px;
}

</style>
<div class="card mb-3">
    <div class="card-header">
		<button class="btn btn-info linktext" onclick="window.location.href='stock_report.php';"> Stock Report Search</button>
		<button class="btn btn-success linktext"> Categorywise Stock Report </button>
		<button class="btn btn-info linktext" onclick="window.location.href='material_wise_stock_report.php';"> Materialwise Stock Report </button>
		<!-- <button class="btn btn-info linktext" onclick="window.location.href='typewise_stock_report.php';"> Typeywise Stock Report </button>
		<?php if($_SESSION['logged']['user_type'] !== 'whm') {?>
		<button class="btn btn-info linktext" onclick="window.location.href='total_stock_report.php';"> Total Stock Report</button>
		<button class="btn btn-info linktext" onclick="window.location.href='warehouse_stock_report.php';"> Warehouse Stock Report </button>
		<button class="btn btn-info linktext" onclick="window.location.href='warehouse_categorywise_stock_report.php';"> Warehouse Categorywise Stock Report </button>
		<?php } ?> -->
	</div>

    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td style="width:20%">
                                <div class="form-group">
									<label for="sel1">Material Category:</label>
									<select class="form-control select2" id="material_id" name="material_id">
										<option value="0">Parent Category</option>
	                                    <?php
	                                    $category_resize_data = category_tree();
	                                    $html = '';
	                                    function generateOptions($category_resize_data, $indent = 0) {
	                                        foreach ($category_resize_data as $key => $value) {
	                                            echo '<option value="' . $value['id'] . '">' . str_repeat('-', $indent * 1) . $value['id'].'-' .$value['category_description']. '</option>';
	                                            if (is_array($value['children']) && !empty($value['children'])) {
	                                                generateOptions($value['children'], $indent + 1);
	                                            }
	                                        }
	                                    }
	                                    
	                                    generateOptions($category_resize_data);
	                                    ?>
									</select>
								</div>
                            </td>
							<td style="width:20%">
                                <div class="form-group">
                                    <label for="todate">To Date</label>
                                    <input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							
							<td style="width:10%">
                                <div class="form-group">
                                    <label for="todate">.</label>
									<button type="submit" name="submit" class="form-control btn btn-primary">Search</button>
                                </div>
                            </td>
                            <td style="width:50%"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<?php
if(isset($_GET['submit'])){
	
	$material_id	=	$_GET['material_id'];
	$cateory_id     =$material_id;
	$to_date		=	$_GET['to_date'];
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];

	$category_ids_array=[];
	//$category_ids_array[]=$material_id;

	function findChildCategories($cateory_id,$to_date){

		global $conn;
		$sqlall	=	"SELECT * FROM inv_materialcategorysub WHERE `parent_id` = '$cateory_id' ";
		$result = mysqli_query($conn, $sqlall);
		while ($val = $result->fetch_assoc()) {
			fetch_category_wise_data($val["id"],$to_date);
			if($val["has_child"] ==1){
				findChildCategories($val["id"],$to_date);
			}
		}

	}
	
function fetch_category_wise_data($cateory_id,$to_date){
 	global $conn;
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
 	$sql2=" SELECT t4.category_description,t1.mb_date,t2.material_id,t1.mb_materialid,t2.material_description,t2.spec,t2.part_no,t2.qty_unit, t3.unit_name,SUM(t1.mbin_qty-t1.mbout_qty) as qty_balance,t1.mb_materialid FROM `inv_materialbalance` AS t1
			INNER JOIN inv_material AS t2 ON t1.mb_materialid=t2.material_id_code
			INNER JOIN inv_materialcategorysub as t4 ON t4.id=t2.material_id
			INNER JOIN inv_item_unit AS t3 ON t3.id=t2.qty_unit
			WHERE 1=1 AND t1.warehouse_id = $warehouse_id AND t2.material_id=$cateory_id AND t1.mb_date <= '$to_date'   GROUP BY t1.mb_materialid ";
$result = mysqli_query($conn, $sql2);
while ($val = $result->fetch_assoc()) {
	echo  "<tr>
			<td>".$val['category_description']."</td>
			<td>".$val['mb_materialid']."-".$val['material_description']."</td>
			<td>".$val['part_no']."</td>
			<td>".$val['spec']."</td>
			<td>".$val['unit_name']."</td>
			<td>".$val['qty_balance']."</td>
		</tr>";
}

 }

	
	
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
							<span>Categorywise Material Stock Report</span><br>
							<span>Category:<?php 
								$dataresult =   getDataRowByTableAndId('inv_materialcategorysub', $material_id);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->category_description : '');
								?></span><br>
							Till  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
				<table id="" class="table table-bordered table-striped ">
					<thead>
						<tr>
							<th>Category</th>
							<th>Material Name</th>
							<th>Part No</th>
							<th>Specification</th>
							<th>Unit</th>
							<th>In Stock</th>
						</tr>
					</thead>
					<tbody>
					<?php
					echo fetch_category_wise_data($material_id,$to_date);
					echo findChildCategories($material_id,$to_date);
					
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
		<center><button class="btn btn-default" onclick="printDiv('printableArea')"><i class="fa fa-print" aria-hidden="true" style="    font-size: 17px;"> Print</i></button></center>
		<div class="col-md-1"></div>
</center>
<?php }?>
<script>
var category_id = <?php echo $material_id ?? 0 ?>;
console.log(category_id)
$(document).find("#material_id").val(category_id).change();

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


