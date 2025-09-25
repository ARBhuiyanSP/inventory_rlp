<?php

if(isset($_POST['assign_submit'])){
		
		// Received Values From Assign Form 
		
		$product_id 	= $_POST['product_id'];
		$employee_id 	= $_POST['employee_id'];
		$assign_date 	= $_POST['assign_date'];
		$assigned_by 	= $_POST['assigned_by'];
		$remarks 		= $_POST['remarks'];
		$status 		= 'Active';
		$create 		= date('Y-m-d');
		
		/* Insert Data Into product_assign Table: */
		
		$query = "INSERT INTO `product_assign`(`product_id`,`employee_id`,`assign_date`,`remarks`,`assigned_by`,`status`,`created_at`) VALUES ('$product_id','$employee_id','$assign_date','$remarks','$assigned_by','$status','$create')";
        $conn->query($query);
		$last_id = $conn->insert_id;
		
		/* Update Data Into ams_products Table: */
		
		$queryupdate   = "UPDATE `ams_products` SET `assign_status`='assigned' WHERE `id`='$product_id'";
		$resultupdate = $conn->query($queryupdate);
		
		/* get id from  product_assign Table: 
		$queryget = "select `id` FROM `product_assign`(`product_id`,`employee_id`,`assign_date`,`remarks`,`status`,`created_at`) VALUES ('$product_id','$employee_id','$assign_date','$remarks','$status','$create')";
        $conn->query($queryget);
		$last_id = $conn->insert_id; */
		
		
		
		$_SESSION['success']    =   "Asset Assign process have been successfully Completed.";
		header("Location: handover-receipt.php?id=$last_id");
		exit();
		
		
		/* if ($conn->query($query) === TRUE) {
				  $last_id = $conn->insert_id;
				  $_SESSION['success']    =   "Asset Assign process have been successfully Completed.";
					header("location: handover-receipt.php?id='$last_id'");
					exit();
				} else {
				  echo "Error: " . $sql . "<br>" . $conn->error;
				} */
			
}


if(isset($_POST['transfer_submit'])){

	$product_id 	= $_POST['product_id'];
	$employee_id 	= $_POST['employee_id'];
	$assign_date 	= $_POST['assign_date'];
	$remarks 		= $_POST['remarks'];
	$status 		= 'Active';
	$create 		= date('Y-m-d');
	$id 			= $_POST['id'];

		
		
		
		$query = "insert into product_assign values('','$product_id','$employee_id','$assign_date','','$remarks','$status','$create','')";
        $conn->query($query);
		
		
		
		
		$queryupdate   = "UPDATE `product_assign`  set `refund_date`='$assign_date', `status`='Transfered' where `id`='$id'";
		$result	= $conn->query($queryupdate);
		
		$_SESSION['success']    =   "Asset transfer process have been successfully Completed.";
		/* header("location: assets-list.php");
		exit(); */
}
 ?>