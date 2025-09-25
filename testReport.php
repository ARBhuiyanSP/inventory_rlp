<?php include 'header.php' ?>
<?php if(!check_permission('material-stock-report')){ 
        include("404.php");
        exit();
 } ?>
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
	
		<button class="btn btn-success linktext"> Stock Report Search</button>
		<button class="btn btn-info linktext" onclick="window.location.href='categorywise_stock_report.php';"> Categorywise Stock Report </button>
		<button class="btn btn-info linktext" onclick="window.location.href='material_wise_stock_report.php';"> Materialwise Stock Report </button>
	</div>

    <div class="card-body">
        <form class="form-horizontal" action="" id="warehouse_stock_search_form" method="GET">
            <div class="table-responsive">          
                <table class="table table-borderless search-table">
                    <tbody>
                        <tr>  
							<td>
                                <div class="form-group">
                                    <label for="todate">To Date</label>
                                    <input type="text" class="form-control" id="to_date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" autocomplete="off" required >
                                </div>
                            </td>
							
							<td style="width:15%">
                                <div class="form-group">
                                    <label for="todate">.</label>
									<button type="submit" name="stockSubmit" class="form-control btn btn-primary" style="padding: 3px;">Stock Search</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>
<?php if(isset($_GET['stockSubmit'])){ 
	$to_date		=	$_GET['to_date'];
	$warehouse_id	=	$_SESSION['logged']['warehouse_id'];
	$grand_total=0;
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
							<h5>CTED CHATTOGRAM</h5>
							<span>Material Stock Report</span><br>
							Till  <span class="dtext"><?php echo date("jS F Y", strtotime($to_date));?> </span><br>
						</p>
					</center>
				</div>
			</div>
			<?php
					
			$sql = "SELECT t1.id,t1.id as category_id,t1.parent_id,t1.category_description
				FROM  `inv_materialcategorysub` as t1 ";
$result = mysqli_query($conn, $sql);	
$category_resize_data =[]; 
 while ($row = $result->fetch_assoc()) {
        $category_resize_data[] = $row;
    }
$data =  buildTreeCateogy($category_resize_data);


 function fetch_category_wise_data($cateory_id,$to_date){
 	global $conn;
 	$sql2=" SELECT t1.mb_date,t2.material_id,t1.mb_materialid,t2.material_description,t2.spec,t2.part_no,t2.qty_unit, t3.unit_name,SUM(t1.mbin_qty-t1.mbout_qty) as qty_balance,t1.mb_materialid FROM `inv_materialbalance` AS t1
			INNER JOIN inv_material AS t2 ON t1.mb_materialid=t2.material_id_code
			INNER JOIN inv_item_unit AS t3 ON t3.id=t2.qty_unit
			WHERE 1=1 AND t2.material_id=$cateory_id AND t1.mb_date <= '$to_date'   GROUP BY t1.mb_materialid ";
$result = mysqli_query($conn, $sql2);
$group_sub_total=0;
while ($val = $result->fetch_assoc()) {
	$group_sub_total +=$val['qty_balance'];
	 
	$GLOBALS["grand_total"]+=$val['qty_balance'];
	echo  "<tr>
			<td colspan='2'>".$val['material_description']."</td>
			<td>".$val['part_no']."</td>
			<td>".$val['spec']."</td>
			<td>".$val['unit_name']."</td>
			<td>".$val['qty_balance']."</td>
		</tr>";
}
if($group_sub_total > 0){
echo  "<tr><td colspan='5'><b>Sub Total</b></td>
			<td><b>".$group_sub_total."</b></td></tr>";
}


 }			
					  

?>
				<table id="" class="table table-bordered table-striped ">
					<thead>
						<tr>
							<th colspan="2">Material Name</th>
							<th>Part No</th>
							<th>Specification</th>
							<th>Unit</th>
							<th width="10%">In Stock</th>
						</tr>
					</thead>
					<tbody>
					 
					 <?php
                                    $html = '';
                                    function generateOptions($data, $indent = 0,$to_date='') {
                                        foreach ($data as $key => $value) {?>
                                           <tr>
                                           	<td colspan="6"><b><?php echo str_repeat('-', $indent * 1) .$value['category_description']; ?></b></td>
                                           </tr>
                                          
                                           <?php
                                            //Fetch Root Level Data By Category Id
                                            fetch_category_wise_data($value['category_id'],$to_date);
                                            ?>
                                          <?php   if (isset($value['children']) && is_array($value['children']) && !empty($value['children'])) {
                                                generateOptions($value['children'], $indent + 1,$to_date);
                                            }
                                        }
                                    }
                                    
                                    generateOptions($data,$indent = 0,$to_date);
                                    ?>
					
					
					
					
						 
					</tbody>
					<tfoot>
						<tr>
							<th colspan="5">GRAND TOTAL</th>
							<th><?php echo $grand_total; ?></th>
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
<?php } ?>
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

<?php include 'footer.php' ?>


