<?php
include 'header.php';
 global $conn;
    
    // get receive data
    $sql1           = "SELECT * FROM inv_materialbalance  order by id asc";
    $result        = $conn->query($sql1);
    $duplicate_array = [];
    $deleted_array = [];
while ($row = $result->fetch_assoc()) {
	$row_1=$row["mb_ref_id"].$row["mb_materialid"].$row["mb_date"].$row["mbin_qty"].$row["mbin_val"].$row["mbout_qty"].$row["mbout_val"].$row["mbprice"].$row["mbtype"].$row["mbserial"].$row["mbserial_id"].$row["mbunit_id"].$row["jvno"].$row["part_no"].$row["project_id"].$row["warehouse_id"];

	if(in_array($row_1,$duplicate_array)){
		$date_and_id = $row["mb_date"]."___".$row["id"];
		array_push($deleted_array,intval($row["id"]));
		//array_push($deleted_array,$date_and_id);
	}else{

		array_push($duplicate_array, $row_1);
	}
	
}

$ids = implode(",",$deleted_array);
echo $ids;

foreach($deleted_array as $vale){
	//echo $vale;
// 	 $sql2          = " DELETE FROM `inv_materialbalance` WHERE id ='$vale' ";
 // $tr        = $conn->query($sql2);
}






echo "<pre>";
	print_r(sizeof($duplicate_array));
	echo "</pre>";
exit();
?>