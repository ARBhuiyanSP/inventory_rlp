<?php
global $conn;
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "eel_equipment";

// Create connection
$conn       = new mysqli($servername, $username, $password, $dbname);



$balance_query = " SELECT SUM(t1.mbin_qty-t1.mbout_qty) AS _balance,t1.mb_materialid,t2.part_no 
FROM inv_materialbalance as t1
INNER JOIN inv_material AS t2 ON t2.material_id_code=t1.mb_materialid 
GROUP BY t1.mb_materialid HAVING SUM(t1.mbin_qty-t1.mbout_qty) > 0 ";

$balance_query_result =  $conn->query($balance_query);

// print_r($balance_query_result) ;
// exit();


 

$id =0;
 while ($row = $balance_query_result->fetch_assoc()) {
 	
 	$mb_materialid= $row["mb_materialid"];
 	$part_no_new= $row["part_no"];

 	
 		 $balance_query_result->num_rows;

	 	    $detail_query ="SELECT t1.material_id,t1.mrr_no,t1.id AS _detail_id,t1.unit_price,t2.part_no
			FROM inv_receivedetail as t1
			INNER JOIN inv_material AS t2 on t1.material_id=t2.material_id_code
			WHERE t1.material_id='".$mb_materialid."' ORDER BY t1.id DESC LIMIT 1";
	
		$detail_query_result =  $conn->query($detail_query);
		while ($row2 = $detail_query_result->fetch_object()) {
			$material_id =  $row2->material_id;
			$mrr_no =  $row2->mrr_no;
			$_detail_id =  $row2->_detail_id;
			$unit_price =  $row2->unit_price;
			$part_no =  $row2->part_no;
			$_balance =  $row["_balance"];

			if($detail_query_result->num_rows==0){
			    $mrr_no = "OP";
			    $_detail_id=0;
			    $unit_price=0;
			    $part_no=$part_no_new;
			}

			$queryInsert = " INSERT INTO `inv_product_price`(`mrr_no`, `material_id`, `receive_details_id`, `qty`, `price`, `part_no`, `status`) VALUES ('$mrr_no','$material_id','$_detail_id','$_balance','$unit_price','$part_no','1')";
				$conn->query($queryInsert);

			$queryUpdate = "UPDATE `inv_material` SET `current_balance`='$_balance' WHERE `material_id_code` ='$material_id'";
			$conn->query($queryUpdate);


		}

		$id++;	
 	

      

	

  }
$_SESSION['success']    =   "Price have been successfully updated.";



?>