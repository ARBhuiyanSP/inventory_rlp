<?php
/////// new process
/////// new process
if (isset($_POST['rent_entry']) && !empty($_POST['rent_entry'])) {
	
	// check duplicate:
	$challan_no		= $_POST['challan_no'];
    $table		= 'rents';
    $where		= "challan_no='$challan_no'";
    if(isset($_POST['rent_update_submit']) && !empty($_POST['rent_update_submit'])){
        $notWhere   =   "id!=".$_POST['rent_update_submit'];
        $duplicatedata = isDuplicateData($table, $where, $notWhere);
    }else{
        $duplicatedata = isDuplicateData($table, $where);
    }
	if ($duplicatedata) {
		$status     =   'error';
		$_SESSION['warning']    =   "Operation faild. Duplicate data found..!";
    }else{
		$project_name		= (isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : "");
		$present_location_type		= getProjectTypeByID((isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : ""));
		$challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
		$date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : "");
		$client_name		= (isset($_POST['client_name']) && !empty($_POST['client_name']) ? trim(mysqli_real_escape_string($conn,$_POST['client_name'])) : "");
		$ref_name		= (isset($_POST['ref_name']) && !empty($_POST['ref_name']) ? trim(mysqli_real_escape_string($conn,$_POST['ref_name'])) : "");
		$sub_total_amount		= (isset($_POST['sub_total_amount']) && !empty($_POST['sub_total_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['sub_total_amount'])) : "");
		$discount		= (isset($_POST['discount']) && !empty($_POST['discount']) ? trim(mysqli_real_escape_string($conn,$_POST['discount'])) : "");
		$grandtotal		= (isset($_POST['grandtotal']) && !empty($_POST['grandtotal']) ? trim(mysqli_real_escape_string($conn,$_POST['grandtotal'])) : "");
		$paid_amount		= (isset($_POST['paid_amount']) && !empty($_POST['paid_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['paid_amount'])) : "");
		$due_amount		= (isset($_POST['due_amount']) && !empty($_POST['due_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['due_amount'])) : "");
        
        $equipments		= (isset($_POST['equipments'][$count]) && !empty($_POST['equipments'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['equipments'][$count])) : "");
		$unit_price		= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : "");
		$totalamount		= (isset($_POST['totalamount'][$count]) && !empty($_POST['totalamount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamount'][$count])) : "");
		$rent_date		= (isset($_POST['rent_date']) && !empty($_POST['rent_date']) ? trim(mysqli_real_escape_string($conn,$_POST['rent_date'])) : "");
		$return_date	= (isset($_POST['return_date']) && !empty($_POST['return_date']) ? trim(mysqli_real_escape_string($conn,$_POST['return_date'])) : "");
		$totaldays		= (isset($_POST['totaldays']) && !empty($_POST['totaldays']) ? trim(mysqli_real_escape_string($conn,$_POST['totaldays'])) : "");
		$rent_id = get_table_next_primary_id('rents');
		
		$created_at		=  date('Y-m-d h:i:s');
		$created_by		=  $_SESSION['logged']['user_id'];	
		
	$query2 = "INSERT INTO `rents`(`date`, `client_name`, `project_name`, `ref_no`, `challan_no`, `total_rent_amount`, `discount`, `grandtotal`, `deposit_amount`, `due_amount`, `status`, `created_at`, `created_by`) VALUES ('$date','$client_name','$project_name','$ref_name','$challan_no','$sub_total_amount','$discount','$grandtotal','$paid_amount','$due_amount','Rented','$created_at','$created_by')";
    $result2 = $conn->query($query2);
	$lastinsertedrentId =  mysqli_insert_id($conn);	
		
	//$receive_total      =   0;
    //$no_of_material     =   0;
    for ($count = 0; $count < count($_POST['equipments']); $count++) { 
		$project_name		= (isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : "");
		$present_location_type		= getProjectTypeByID((isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : ""));
		$challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
		$date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : "");
		$client_name		= (isset($_POST['client_name']) && !empty($_POST['client_name']) ? trim(mysqli_real_escape_string($conn,$_POST['client_name'])) : "");
		$ref_name		= (isset($_POST['ref_name']) && !empty($_POST['ref_name']) ? trim(mysqli_real_escape_string($conn,$_POST['ref_name'])) : "");
		$sub_total_amount		= (isset($_POST['sub_total_amount']) && !empty($_POST['sub_total_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['sub_total_amount'])) : "");
		$discount		= (isset($_POST['discount']) && !empty($_POST['discount']) ? trim(mysqli_real_escape_string($conn,$_POST['discount'])) : "");
		$grandtotal		= (isset($_POST['grandtotal']) && !empty($_POST['grandtotal']) ? trim(mysqli_real_escape_string($conn,$_POST['grandtotal'])) : "");
		$paid_amount		= (isset($_POST['paid_amount']) && !empty($_POST['paid_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['paid_amount'])) : "");
		$due_amount		= (isset($_POST['due_amount']) && !empty($_POST['due_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['due_amount'])) : "");
        
        $equipments		= (isset($_POST['equipments'][$count]) && !empty($_POST['equipments'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['equipments'][$count])) : "");
		$unit_price		= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : "");
		$totalamount		= (isset($_POST['totalamount'][$count]) && !empty($_POST['totalamount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamount'][$count])) : "");
		$rent_date		= (isset($_POST['rent_date']) && !empty($_POST['rent_date']) ? trim(mysqli_real_escape_string($conn,$_POST['rent_date'])) : "");
		$return_date	= (isset($_POST['return_date']) && !empty($_POST['return_date']) ? trim(mysqli_real_escape_string($conn,$_POST['return_date'])) : "");
		$totaldays		= (isset($_POST['totaldays']) && !empty($_POST['totaldays']) ? trim(mysqli_real_escape_string($conn,$_POST['totaldays'])) : "");
		$rent_id = $lastinsertedrentId;
		
		$created_at		=  date('Y-m-d h:i:s');
		$created_by		=  $_SESSION['logged']['user_id'];
		
		
		/* if (is_uploaded_file($_FILES['file']['tmp_name'])) 
		{
			$temp_file=$_FILES['file']['tmp_name'];
			$mrr_image=time().$_FILES['file']['name'];
			$q = move_uploaded_file($temp_file,"images/".$mrr_image);
		} */
		
        $query = "INSERT INTO `rent_details`(`rent_id`,`client_name`,`project_name`, `challan_no`, `eel_code`, `rent_date`, `return_date`, `extended_date`, `total_days`, `amount`, `status`) VALUES ('$rent_id','$client_name','$project_name','$challan_no','$equipments','$rent_date','$return_date','$return_date','$totaldays','$totalamount','Rented')";
        $conn->query($query);
		$lastinsertedId =  mysqli_insert_id($conn);
		
		$queryEx = "INSERT INTO `rent_history`(`challan_no`,`rent_details_id`, `eel_code`, `rent_date`, `return_date`, `amount`, `status`) VALUES ('$challan_no','$lastinsertedId','$equipments','$rent_date','$return_date','$totalamount','Rented')";
         $conn->query($queryEx); 
		
		/*
		*  update equipments table:
		*/
		$queryEquipments = "UPDATE `equipments` SET `present_location`='$project_name',`present_location_type`='$present_location_type',`status`='Rented' WHERE `eel_code` = '$equipments'";
		$conn->query($queryEquipments); 
		
			$select_assign = "SELECT * FROM `equipment_assign` WHERE `eel_code`='$equipments' ORDER BY `id` DESC";  
			$resultassign = mysqli_query($conn, $select_assign);
			$rowassign = mysqli_fetch_array($resultassign);
			$assign_id = $rowassign['id'];
	

    $sql8	=	"UPDATE `equipment_assign` set `refund_date`='$created_at' where `id`='$assign_id'";
    $result8 = $conn->query($sql8); 
	
	$sql9	=	"insert into `equipment_assign` values('','$equipments','$project_name','$created_at','','')";
	$result9 = $conn->query($sql9); 
		}
    /*
    *  Insert Data Into inv_receive Table:
    */
	

	
	
  
    /*
    *  Insert Data Into inv_supplierbalance Table:
    */
 /*   $query3 = "INSERT INTO `client_balance`(`ref_id`, `cb_date`, `client_id`, `project_id`, `cb_dr_amount`, `cb_cr_amount`, `cb_method`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `cb_remarks`, `created_at`, `created_by`) VALUES ('$challan_no','$date','$client_name','$project_name','$paid_amount','$grandtotal','','','','','','','$created_at','$created_by')";
    $result2 = $conn->query($query3); */
	
	
    
    $_SESSION['success']    =   "Rent process have been successfully completed.";
    header("location: rent.php");
    exit();
	}
		

}
/////// new process
/////// new process


function getrentListData(){
	$table      = 'rents WHERE 1 = 1';
	$order      = 'DESC';
	$column     = 'created_at';
	$dataType   = 'obj';
	$listData   = getTableDataByTableName2($table, $order, $column, $dataType);
       
    return $listData;
}


function getRentDetailsData($rent_id){
    $table      =   "`rents` WHERE `id`='$rent_id'";
    $rent_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "`rent_details` WHERE `rent_id`='$rent_id'";
    $rent_details   = getTableDataByTableName2($table, $order, $column);
    
    $feedbackData   =   [
        'rents'      =>  $rent_info,
        'rent_details'   =>  $rent_details
    ];
    return $feedbackData;
}


if(isset($_GET['process_type']) && $_GET['process_type'] == "wo_update_execute"){
    date_default_timezone_set("Asia/Dhaka");
    include '../connection/connect.php';
    include '../helper/utilities.php';
    $param['wo_no']   =   $_POST['wo_no'];
    //update_rlp_acknowledgement($param);
    //$dataParam['wo_no']     	=   $_POST['wo_no'];
    $dataParam['status']     	=   $_POST['acknowledgement'];
    $dataParam['updated_by']	=   $_POST['created_by'];
    $dataParam['updated_at']	=   date("Y-d-m H:i:s");
    $where      =   [
        'id'    =>  $param['wo_no']
    ];
    updateData('workorders_master', $dataParam, $where);
    //save_rlp_remarks();
    $feedback   =   [
        'status'    => "success",
        'message'   => "Work Order have been successfully updated",
    ];
    
    echo json_encode($feedback);
}
if (isset($_POST['invoice_create']) && !empty($_POST['invoice_create'])) {

        $id				= $_POST['id'];
        $rent_id		= $_POST['rent_id'];
        $invoice_no		= $_POST['invoice_no'];
        $invoice_date	= $_POST['invoice_date'];
        $client_id		= $_POST['client_id'];
       $project_id		= $_POST['project_id'];
       $challan_no     = $_POST['challan_no'];
        $amount        	= $_POST['amount'];
        $invoiceable_amount	= $_POST['invoiceable_amount'];
        $deposit_amount     = $_POST['deposit_amount'];
        $due_amount        	= $_POST['due_amount'];
        $cb_remarks        	= $_POST['remarks'];
			

			
			$newDeposit_amount	=	$deposit_amount + $amount;
			$newDue_amount		=	$due_amount - $amount;
			if($newDue_amount > 0){
				$newStatus			=	'Pending';
			}else{
				$newStatus			=	'Paid';
			}	
			$updated_at			=	date("Y-d-m");;
			$updated_by			=	$_SESSION['logged']['user_id'];
		
			$query3 = "UPDATE `rents` SET `deposit_amount`='$newDeposit_amount',`due_amount`='$newDue_amount',`bill_status`='$newStatus',`updated_at`='$updated_at',`updated_by`='$updated_by' WHERE `id`='$rent_id'";
			$conn->query($query3); 
			
		$created_at			=	date("Y-d-m");
		$created_by			=	$_SESSION['logged']['user_id'];
		
		
		$query8 = "INSERT INTO `rent_invoice` (`invoice_no`, `rent_id`, `invoice_date`, `challan_no`, `client_name`, `project_name`, `amount`, `deposit_amount`, `due_amount`, `status`, `created_at`, `created_by`) VALUES ('$invoice_no','$rent_id','$invoice_date','$challan_no','$client_id', '$project_id','$amount','0','$amount','Pending','$created_at','$created_by')";
		$conn->query($query8);
		
		
		$query3 = "INSERT INTO `client_balance`(`ref_id`, `cb_date`, `client_id`, `project_id`, `cb_dr_amount`, `cb_cr_amount`, `cb_method`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `cb_remarks`, `created_at`, `created_by`) VALUES ('$invoice_no','$invoice_date','$client_id','$project_id','0','$amount','','','','','','','$created_at','$created_by')";
		$result2 = $conn->query($query3);
		
		header("location: invoice_list.php");
		exit();
    
}
 

if (isset($_POST['mr_create']) && !empty($_POST['mr_create'])) {
	
/*********************************************************************** 
		 *	Insert Data Into inv_challan Table:
        */ 
        $id				= $_POST['id'];
        $mr_no			= $_POST['mr_no'];
        $cb_date		= $_POST['mr_date'];
        $client_id		= $_POST['client_id'];
        $project_id		= $_POST['project_id'];
        $invoice_no		= $_POST['invoice_no'];
        $amount        	= $_POST['amount'];
        $challan_no        	= $_POST['challan_no'];
        $rent_id        	= $_POST['rent_id'];
        $deposit_amount     = $_POST['deposit_amount'];
        $due_amount        	= $_POST['due_amount'];
        $cb_method			= $_POST['cb_method'];
			$bank_name			= $_POST['bank_name'];
			$bank_branch		= $_POST['bank_branch'];
			$bank_cheque_no		= $_POST['bank_cheque_no'];
			$bank_cheque_date	= $_POST['bank_cheque_date'];
        $cb_remarks        = $_POST['remarks'];
			

			
			$newDeposit_amount	=	$deposit_amount + $amount;
			$newDue_amount		=	$due_amount - $amount;
			if($newDue_amount > 0){
				$newStatus			=	'Pending';
			}else{
				$newStatus			=	'Paid';
			}	
			$updated_at			=	date("Y-d-m");;
			$updated_by			=	$_SESSION['logged']['user_id'];
		
			/* $query3 = "UPDATE `rents` SET `deposit_amount`='$newDeposit_amount',`due_amount`='$newDue_amount',`bill_status`='$newStatus',`updated_at`='$updated_at',`updated_by`='$updated_by' WHERE `id`='$id'"; */
			$query3 = "UPDATE `rent_invoice` SET `deposit_amount`='$newDeposit_amount',`due_amount`='$newDue_amount',`status`='$newStatus',`updated_at`='$updated_at',`updated_by`='$updated_by' WHERE `id`='$id'";
			$conn->query($query3); 
			
		$created_at			=	date("Y-d-m");
		$created_by			=	$_SESSION['logged']['user_id'];
		
		$query2 = "INSERT INTO `client_balance` (`ref_id`, `cb_date`, `client_id`, `project_id`, `cb_dr_amount`, `cb_cr_amount`, `cb_method`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `cb_remarks`,`created_at`,`created_by`) VALUES ('$mr_no', '$cb_date', '$client_id', '$project_id', '$amount', '0', '$cb_method', '$bank_name', '$bank_branch', '$bank_cheque_no', '$bank_cheque_date', '$cb_remarks','$created_at','$created_by')";
        $conn->query($query2);
		
		/* $query8 = "INSERT INTO `rent_bill` (`bill_no`, `rent_id`, `bill_date`, `challan_no`, `client_name`, `project_name`,`eel_code`, `amount`, `payment_type`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `created_at`, `created_by`) VALUES ('$mr_no','$id','$cb_date','$challan_no','$client_id', '$project_id','','$amount','$cb_method','$bank_name','$bank_branch','$bank_cheque_no','$bank_cheque_date','$created_at','$created_by')"; */
		$query8 = "INSERT INTO `rent_bill` (`bill_no`, `invoice_id`, `bill_date`, `challan_no`, `client_name`, `project_name`,`eel_code`, `amount`, `payment_type`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `created_at`, `created_by`) VALUES ('$mr_no','$id','$cb_date','$challan_no','$client_id', '$project_id','','$amount','$cb_method','$bank_name','$bank_branch','$bank_cheque_no','$bank_cheque_date','$created_at','$created_by')";
        $conn->query($query8);
		
		header("location: mr_list.php");
		exit();
    
}




