<?php
if (isset($_POST['rent_entry']) && !empty($_POST['rent_entry'])){
    /*
     * *****************************rrr_info table operation********************
     */
    $rent_details_response  =   execute_rent_details_table();
		$rent_details_id    =   $rent_details_response['last_id'];
    $rent_info_response  =   execute_rent_extend_table($rent_details_id);
    $rent_info_response  =   execute_rent_master_table();
    $rent_info_response  =   execute_client_balance_table();
    $rent_info_response  =   update_equipments_table();
    if(isset($rent_info_response) && $rent_info_response['status'] == "success"){
        
        $_SESSION['success']    =   "Your request have been successfully procced.";
    }else{
        //$_SESSION['error']    =   "Failed to save data";
		$_SESSION['success']    =   "Your request have been successfully procced.";
    }
    header("location: rent.php");
    exit();
}
function execute_rent_master_table(){
		global $conn;
		$date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : "");
		$client_name		= (isset($_POST['client_name']) && !empty($_POST['client_name']) ? trim(mysqli_real_escape_string($conn,$_POST['client_name'])) : "");
		$project_name		= (isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : "");
		$ref_name		= (isset($_POST['ref_name']) && !empty($_POST['ref_name']) ? trim(mysqli_real_escape_string($conn,$_POST['ref_name'])) : "");
		$challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
		
		$sub_total_amount		= (isset($_POST['sub_total_amount']) && !empty($_POST['sub_total_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['sub_total_amount'])) : "");
		$discount		= (isset($_POST['discount']) && !empty($_POST['discount']) ? trim(mysqli_real_escape_string($conn,$_POST['discount'])) : "");
		$grandtotal		= (isset($_POST['grandtotal']) && !empty($_POST['grandtotal']) ? trim(mysqli_real_escape_string($conn,$_POST['grandtotal'])) : "");
		$paid_amount		= (isset($_POST['paid_amount']) && !empty($_POST['paid_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['paid_amount'])) : "");
		$due_amount		= (isset($_POST['due_amount']) && !empty($_POST['due_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['due_amount'])) : "");
                       
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'date'				=>  $date,
            'client_name'		=>  $client_name,
            'project_name'		=>  $project_name,
            'ref_no'       		=>  $ref_name,
            'challan_no'			=>  $challan_no,
            'total_rent_amount' 	 	=>  $sub_total_amount,
            'discount' 	 	=>  $discount,
            'grandtotal' 	 	=>  $grandtotal,
            'deposit_amount' 	 	=>  $paid_amount,
            'due_amount' 	 	=>  $due_amount,
			
            'status'			=>  '0',
			'created_at'		=>  date('Y-m-d h:i:s'),
			'created_by'		=>  $_SESSION['logged']['user_id']
        ];
    
    $response   =   saveData("rents", $dataParam);
    return $response;
}
function execute_client_balance_table(){
		global $conn;
		$challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
		$date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : "");
		$client_name		= (isset($_POST['client_name']) && !empty($_POST['client_name']) ? trim(mysqli_real_escape_string($conn,$_POST['client_name'])) : "");
		$project_name		= (isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : "");
		$grandtotal		= (isset($_POST['grandtotal']) && !empty($_POST['grandtotal']) ? trim(mysqli_real_escape_string($conn,$_POST['grandtotal'])) : "");
		$paid_amount		= (isset($_POST['paid_amount']) && !empty($_POST['paid_amount']) ? trim(mysqli_real_escape_string($conn,$_POST['paid_amount'])) : "");
                       
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'ref_id'			=>  $challan_no,
            'cb_date'			=>  $date,
            'client_id'			=>  $client_name,
            'project_id'			=>  $project_name,
            'cb_dr_amount'		=>  $paid_amount,
            'cb_cr_amount'		=>  $grandtotal,
            'cb_method'			=>  '',
            'bank_name'			=>  '',
            'bank_branch'		=>  '',
            'bank_cheque_no'	=>  '',
            'cb_remarks'		=>  '',
			
			'created_at'		=>  date('Y-m-d h:i:s'),
			'created_by'		=>  $_SESSION['logged']['user_id']
        ];
    
    $response   =   saveData("client_balance", $dataParam);
    return $response;
}
function update_equipments_table(){
		global $conn;
		
		for($count 		= 0; $count<count($_POST['equipments']); $count++){
        
		$project_name		= (isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : "");
		
		$present_location_type		= getProjectTypeByID((isset($_POST['project_name']) && !empty($_POST['project_name']) ? trim(mysqli_real_escape_string($conn,$_POST['project_name'])) : ""));
		
        $equipments		= (isset($_POST['equipments'][$count]) && !empty($_POST['equipments'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['equipments'][$count])) : "");
		
        $dataParam     =   [
            //'id'                	=>  get_table_next_primary_id('rents'),
            'present_location'		=>  $project_name,
            'present_location_type'	=>  $present_location_type,
            'status'				=>  'Rented'
        ];
		$where      =   [
			'eel_code'	=>  $equipments
		];
    
        updateData('equipments', $dataParam, $where);
    }
		          
        
    
    /* $response   =   updateData('equipments', $dataParam, $where);
    return $response; */
	
    
} 
function execute_rent_details_table(){
    global $conn;
    /*
     * *****************************rrr_details table operation********************
     */
	 //$no_of_material     =   0;
    for($count 		= 0; $count<count($_POST['equipments']); $count++){
        $challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
        $equipments		= (isset($_POST['equipments'][$count]) && !empty($_POST['equipments'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['equipments'][$count])) : "");
		$unit_price		= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : "");
		$totalamount		= (isset($_POST['totalamount'][$count]) && !empty($_POST['totalamount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamount'][$count])) : "");
		$rent_date		= (isset($_POST['rent_date']) && !empty($_POST['rent_date']) ? trim(mysqli_real_escape_string($conn,$_POST['rent_date'])) : "");
		$return_date	= (isset($_POST['return_date']) && !empty($_POST['return_date']) ? trim(mysqli_real_escape_string($conn,$_POST['return_date'])) : "");
		$totaldays		= (isset($_POST['totaldays']) && !empty($_POST['totaldays']) ? trim(mysqli_real_escape_string($conn,$_POST['totaldays'])) : "");
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rents'),
            'challan_no'	=>  $challan_no,
            'eel_code'	=>  $equipments,
            'rent_date'       	=>  $rent_date,
            'return_date'	=>  $return_date,
            'extended_date'	=>  $return_date,
            'total_days'	=>  $totaldays,
            'amount'	=>  $totalamount
        ];
    
        saveData("rent_details", $dataParam);
    }
}
function execute_rent_extend_table($rent_details_id){
    global $conn;
    /*
     * *****************************rrr_details table operation********************
     */
	 //$no_of_material     =   0;
    for($count 		= 0; $count<count($_POST['equipments']); $count++){
        $challan_no		= (isset($_POST['challan_no']) && !empty($_POST['challan_no']) ? trim(mysqli_real_escape_string($conn,$_POST['challan_no'])) : "");
        $equipments		= (isset($_POST['equipments'][$count]) && !empty($_POST['equipments'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['equipments'][$count])) : "");
		$unit_price		= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : "");
		$totalamount		= (isset($_POST['totalamount'][$count]) && !empty($_POST['totalamount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamount'][$count])) : "");
		$rent_date		= (isset($_POST['rent_date']) && !empty($_POST['rent_date']) ? trim(mysqli_real_escape_string($conn,$_POST['rent_date'])) : "");
		$return_date	= (isset($_POST['return_date']) && !empty($_POST['return_date']) ? trim(mysqli_real_escape_string($conn,$_POST['return_date'])) : "");
		$totaldays		= (isset($_POST['totaldays']) && !empty($_POST['totaldays']) ? trim(mysqli_real_escape_string($conn,$_POST['totaldays'])) : "");
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rents'),
            'rent_details_id'	=>  $rent_details_id,
            //'challan_no'	=>  $challan_no,
            'eel_code'	=>  $equipments,
            'prev_return_date'	=>  $return_date,
            'extended_date'	=>  $return_date,
            'amount'	=>  $totalamount
        ];
    
        saveData("rent_extend", $dataParam);
    }
}






function getRentDetailsData($wo_id){
    $table      =   "`workorders_master` WHERE `wo_no`='$wo_id'";
    $wo_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "`workorders` WHERE `wo_no`='$wo_id'";
    $wo_details   = getTableDataByTableName2($table, $order, $column);
    
    $feedbackData   =   [
        'wo_info'      =>  $wo_info,
        'wo_details'   =>  $wo_details
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
        $deposit_amount        	= $_POST['deposit_amount'];
        $due_amount        	= $_POST['due_amount'];
        $cb_method		= $_POST['cb_method'];
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
		
			$query3 = "UPDATE `rents` SET `deposit_amount`='$newDeposit_amount',`due_amount`='$newDue_amount',`status`='$newStatus',`updated_at`='$updated_at',`updated_by`='$updated_by' WHERE `id`='$id'";
			$conn->query($query3); 
			
		$created_at			=	date("Y-d-m");
		$created_by			=	$_SESSION['logged']['user_id'];
		
		$query2 = "INSERT INTO `client_balance` (`ref_id`, `cb_date`, `client_id`, `project_id`, `cb_dr_amount`, `cb_cr_amount`, `cb_method`, `bank_name`, `bank_branch`, `bank_cheque_no`, `bank_cheque_date`, `cb_remarks`,`created_at`,`created_by`) VALUES ('$mr_no', '$cb_date', '$client_id', '$project_id', '$amount', '0', '$cb_method', '$bank_name', '$bank_branch', '$bank_cheque_no', '$bank_cheque_date', '$cb_remarks','$created_at','$created_by')";
        $conn->query($query2);
		
		header("location: mr_list.php");
		exit();
    
}




