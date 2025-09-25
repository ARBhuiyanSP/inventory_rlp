<?php
// CS Create
if (isset($_POST['cs_create']) && !empty($_POST['cs_create'])){

    $cs_no               = 'CS'.date('YmdHis');
	$request_division		= (isset($_POST['request_division']) && !empty($_POST['request_division']) ? trim(mysqli_real_escape_string($conn,$_POST['request_division'])) : "");
    $request_department		= (isset($_POST['request_department']) && !empty($_POST['request_department']) ? trim(mysqli_real_escape_string($conn,$_POST['request_department'])) : "");
    $request_project		= (isset($_POST['request_project']) && !empty($_POST['request_project']) ? trim(mysqli_real_escape_string($conn,$_POST['request_project'])) : "");
    $request_warehouse		= (isset($_POST['request_warehouse']) && !empty($_POST['request_warehouse']) ? trim(mysqli_real_escape_string($conn,$_POST['request_warehouse'])) : "");
	
    $rlp_info_id  =   (isset($_POST['rlp_info_id']) && !empty($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
	$request_date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : date("Y-m-d"));
	
	$remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
    
	$cs_info_response  =   execute_cs_info_table();
	if(isset($cs_info_response)){
		
		$param['rlp_info_id']   =   $_POST['rlp_info_id'];
        $param['ack_status']    =   '6';
        $param['user_id']       =   $_SESSION['logged']['user_id'];
        $param['remarks']       =   $_POST['remarks'];
        update_rlp_acknowledgement_forCs($param);
        save_rlp_remarks_Cs();
		
		
		
        $cs_info_id    =   $cs_info_response['last_id'];
        /*
        * *****************************rlp_details table operation********************
        */    
        $cs_details_response  =   execute_cs_details_table($cs_info_id);
        
        $_SESSION['success']    =   "Your request have been successfully procced.";
    }else{
        $_SESSION['error']    =   "Failed to save data";
    }
    header("location: cs_list.php");
    exit();
}

// CS Create
if (isset($_POST['cs_update']) && !empty($_POST['cs_update'])){
	if (getRLPStatusBYID($cs_info->rlp_info_id)==1){
		$_SESSION['error']    =   "This RLP is Alredy Approved";
	}else{
		$cs_info_id  =   (isset($_POST['cs_id']) && !empty($_POST['cs_id']) ? trim(mysqli_real_escape_string($conn,$_POST['cs_id'])) : "");
	
    $rlp_info_id  =   (isset($_POST['rlp_info_id']) && !empty($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
	
	$request_date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : date("Y-m-d"));
	
	$remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
    
	//$cs_info_response  =   execute_cs_info_table();
	$cs_info_response  =   update_cs_info_table($rlp_info_id);
	
	$delsql    = "DELETE FROM cs_details WHERE cs_id ='$cs_info_id'";
		$conn->query($delsql);
		
	if(isset($cs_info_response)){
		
		$param['rlp_info_id']   =   $_POST['rlp_info_id'];
        $param['ack_status']    =   '6';
        $param['user_id']       =   $_SESSION['logged']['user_id'];
        $param['remarks']       =   $_POST['remarks'];
        update_rlp_acknowledgement_forCs($param);
        save_rlp_remarks_Cs();
		
		
		
       $cs_info_id  =   (isset($_POST['cs_id']) && !empty($_POST['cs_id']) ? trim(mysqli_real_escape_string($conn,$_POST['cs_id'])) : "");
        /*
        * *****************************rlp_details table operation********************
        */    
        $cs_details_response  =   execute_cs_details_table($cs_info_id);
        
        $_SESSION['success']    =   "Your request have been successfully procced.";
    }else{
        $_SESSION['error']    =   "Failed to save data";
    }
    header("location: cs_list.php");
    exit();
	}

    
}
/* 
update cs_info table
 */
 function update_cs_info_table($rlp_info_id){
    global $conn;
    
	
    
    $rlp_info_id  =   (isset($_POST['rlp_info_id']) && !empty($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
	
	$request_date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : date("Y-m-d"));
	
	$remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
    
    /*
     * *****************************rlp_info table operation********************
     */
    $table_sql     =   "cs_master";
	
	$dataParam['rlp_info_id']     =   $rlp_info_id;
	$dataParam['request_date']     =   $request_date;
	$dataParam['remarks']     =   $remarks;

	
	$dataParam['updated_by']     =   $_SESSION['logged']['user_id'];
	$dataParam['updated_at']     =   date('Y-m-d h:i:s');
	
	$where      =   [
		'rlp_info_id'    =>  $rlp_info_id
	];
	
    
    $response   =   updateData('cs_master', $dataParam, $where);
   // $response   =   saveData("rlp_info", $dataParam);
    return $response;
}

function update_rlp_acknowledgement_forCs($data){
    $user_id        =   $data['user_id'];
    $rlp_info_id    =   $data['rlp_info_id'];
    $dataParam['rlp_info_id']       =   $data['rlp_info_id'];
    $dataParam['user_id']           =   $data['user_id'];
    if(isset($data['ack_status']) && !empty($data['ack_status'])){
        $dataParam['ack_status']    =   $data['ack_status'];
    }
    $where  =   "rlp_info_id=$rlp_info_id AND user_id=$user_id";
    $isDuplicate    =   isDuplicateData('rlp_acknowledgement', $where);
    if($isDuplicate){
        // process rlp_acknowledgement (table will be updated):
        $dataParam['ack_updated_date']  =   date("Y-m-d H:i:s");
        $dataParam['updated_by']        =   $user_id;
        $where      =   [
            'id'    =>  $isDuplicate
        ];
        updateData('rlp_acknowledgement', $dataParam, $where);
        
        $dataParam                      =   [];
        $where                          =   [];
        $dataParam['rlp_status']        =   $data['ack_status'];
        $dataParam['updated_at'] 		=   date("Y-m-d H:i:s");
        $where      =   [
            'id'    =>  $rlp_info_id
        ];
        updateData('rlp_info', $dataParam, $where);
        
        set_rlp_visible_for_acknowledge($rlp_info_id);
    }
}
function save_rlp_remarks_Cs(){
    if(isset($_POST['remarks']) && !empty($_POST['remarks'])){
        $dataParam      =   [];
        $dataParam['remarks']        =   $_POST['remarks'];
        $dataParam['rlp_info_id']    =   $_POST['rlp_info_id'];
        $dataParam['user_id']        =   $_SESSION['logged']['user_id'];
        $dataParam['remarks_date']   =   date("Y-m-d H:i:s");

        saveData('rlp_remarks_history', $dataParam);
    }
}
function execute_cs_info_table(){
    global $conn;

    $cs_no               = 'CS'.date('YmdHis');
    $request_division    = (isset($_POST['request_division']) ? trim(mysqli_real_escape_string($conn,$_POST['request_division'])) : "");
    $request_department  = (isset($_POST['request_department']) ? trim(mysqli_real_escape_string($conn,$_POST['request_department'])) : "");
    $request_project     = (isset($_POST['request_project']) ? trim(mysqli_real_escape_string($conn,$_POST['request_project'])) : "");
    $request_warehouse   = (isset($_POST['request_warehouse']) ? trim(mysqli_real_escape_string($conn,$_POST['request_warehouse'])) : "");
    $rlp_no              = (isset($_POST['rlp_no']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_no'])) : "");
    $rlp_info_id         = (isset($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
    $request_date        = (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : date("Y-m-d"));
    $remarks             = (isset($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");

    // ------------------ FILE UPLOAD HANDLER -------------------
    $uploadDir = "uploads/cs/";
    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $allowedTypes = ['jpg','jpeg','png','pdf'];
    $maxSize = 500 * 1024; // 500 KB

    function handleFileUpload($fieldName, $uploadDir, $allowedTypes, $maxSize){
        if (!isset($_FILES[$fieldName]) || $_FILES[$fieldName]['error'] != 0) {
            return "";
        }
        $fileName = basename($_FILES[$fieldName]['name']);
        $fileTmp  = $_FILES[$fieldName]['tmp_name'];
        $fileSize = $_FILES[$fieldName]['size'];
        $ext      = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

        if (!in_array($ext, $allowedTypes)) {
            return "";
        }

        $newName = uniqid($fieldName . "_") . "." . $ext;
        $target  = $uploadDir . $newName;

        if ($ext == 'pdf') {
            // PDF শুধু size check করবে
            if ($fileSize > $maxSize) {
                return "";
            }
            move_uploaded_file($fileTmp, $target);
        } else {
            // Image হলে compress check
            if ($fileSize > $maxSize) {
                $image = null;
                if ($ext == 'jpg' || $ext == 'jpeg') {
                    $image = imagecreatefromjpeg($fileTmp);
                } elseif ($ext == 'png') {
                    $image = imagecreatefrompng($fileTmp);
                }
                if ($image) {
                    imagejpeg($image, $target, 70); // 70% quality compress
                    imagedestroy($image);
                }
            } else {
                move_uploaded_file($fileTmp, $target);
            }
        }
        return $target;
    }

    // Call for 4 attachments
    $attachment_s1 = handleFileUpload("attachment_s1", $uploadDir, $allowedTypes, $maxSize);
    $attachment_s2 = handleFileUpload("attachment_s2", $uploadDir, $allowedTypes, $maxSize);
    $attachment_s3 = handleFileUpload("attachment_s3", $uploadDir, $allowedTypes, $maxSize);
    $selected_attachment = ""; // Initially blank, পরে selected supplier অনুযায়ী set হবে

    if (isset($_POST['selected_supplier_heading'])) {
        $sel = $_POST['selected_supplier_heading'];
        if ($sel == "1") $selected_attachment = $attachment_s1;
        if ($sel == "2") $selected_attachment = $attachment_s2;
        if ($sel == "3") $selected_attachment = $attachment_s3;
    }

    // ------------------ INSERT TO DB -------------------
    $dataParam = [
        'cs_no'                => $cs_no,
        'rlp_no'               => $rlp_no,
        'rlp_info_id'          => $rlp_info_id,
        'request_division'     => $request_division,
        'request_department'   => $request_department,
        'request_project'      => $request_project,
        'request_warehouse'    => $request_warehouse,
        'request_date'         => date('Y-m-d h:i:s', strtotime($request_date)),
        'remarks'              => $remarks,
        'attachment_s1'        => $attachment_s1,
        'attachment_s2'        => $attachment_s2,
        'attachment_s3'        => $attachment_s3,
        'selected_attachment'  => $selected_attachment,
        'created_by'           => $_SESSION['logged']['user_id'],
        'created_at'           => date('Y-m-d h:i:s')
    ];

    $response = saveData("cs_master", $dataParam);
    return $response;
}

/* function execute_cs_info_table(){
    global $conn;
    $cs_no               = 'CS'.date('YmdHis');
	$request_division		= (isset($_POST['request_division']) && !empty($_POST['request_division']) ? trim(mysqli_real_escape_string($conn,$_POST['request_division'])) : "");
    $request_department		= (isset($_POST['request_department']) && !empty($_POST['request_department']) ? trim(mysqli_real_escape_string($conn,$_POST['request_department'])) : "");
    $request_project		= (isset($_POST['request_project']) && !empty($_POST['request_project']) ? trim(mysqli_real_escape_string($conn,$_POST['request_project'])) : "");
    $request_warehouse		= (isset($_POST['request_warehouse']) && !empty($_POST['request_warehouse']) ? trim(mysqli_real_escape_string($conn,$_POST['request_warehouse'])) : "");
	
    $rlp_no  =   (isset($_POST['rlp_no']) && !empty($_POST['rlp_no']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_no'])) : "");
    $rlp_info_id  =   (isset($_POST['rlp_info_id']) && !empty($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
	
	$request_date		= (isset($_POST['date']) && !empty($_POST['date']) ? trim(mysqli_real_escape_string($conn,$_POST['date'])) : date("Y-m-d"));
	
	$remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
	

	
    
    //*****************************rlp_info table operation********************
   
    $table_sql     =   "cs_master";
    $dataParam     =   [
        'cs_no'              =>  $cs_no,
        'rlp_no'                =>  $rlp_no,
        'rlp_info_id'                =>  $rlp_info_id,
        //'rlp_user_id'           =>  $_SESSION['logged']['user_id'],
        'request_division'      =>  $request_division,
        'request_department'    =>  $request_department,
        'request_project'   	=>  $request_project,
        'request_warehouse'   	=>  $request_warehouse,
        'request_date'          =>  date('Y-m-d h:i:s', strtotime($request_date)),
        //'request_person'        =>  $_SESSION['logged']['office_id'],
       //  'designation'           =>  $_SESSION['logged']['designation'],
       // 'email'                 =>  $_SESSION['logged']['email'],
       // 'contact_number'        =>  $_SESSION['logged']['contact_number'], 
        'remarks'          =>  $remarks,
        'created_by'            =>  $_SESSION['logged']['user_id'],
        'created_at'            =>  date('Y-m-d h:i:s')
    ];
    
    $response   =   saveData("cs_master", $dataParam);
    return $response;
} */

function execute_cs_details_table($cs_info_id){
    global $conn;
    /*
     * ***************************** rlp_details table operation ********************
     */
    for($count 		= 0; $count<count($_POST['material_name']); $count++){        
	
       
		
    $rlp_info_id  =   (isset($_POST['rlp_info_id']) && !empty($_POST['rlp_info_id']) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_info_id'])) : "");
	
        $rlp_details_id	= (isset($_POST['rlp_details_id'][$count]) && !empty($_POST['rlp_details_id'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['rlp_details_id'][$count])) : '');
		
        $material_name	= (isset($_POST['material_name'][$count]) && !empty($_POST['material_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['material_name'][$count])) : '');
		
        $material_id	= (isset($_POST['material_id'][$count]) && !empty($_POST['material_id'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['material_id'][$count])) : '');
		
        $quantity	= (isset($_POST['quantity'][$count]) && !empty($_POST['quantity'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['quantity'][$count])) : '');
		
        $unit	= (isset($_POST['unit'][$count]) && !empty($_POST['unit'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit'][$count])) : '');
		
		
        $unit_price_1	= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : '');       
        $amount_1	= (isset($_POST['amount'][$count]) && !empty($_POST['amount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount'][$count])) : '');  
        $supplier_id_1	= (isset($_POST['supplier_name'][$count]) && !empty($_POST['supplier_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name'][$count])) : '');

		
		$unit_price_2	= (isset($_POST['unit_price_s2'][$count]) && !empty($_POST['unit_price_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price_s2'][$count])) : '');       
        $amount_2	= (isset($_POST['amount_s2'][$count]) && !empty($_POST['amount_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount_s2'][$count])) : '');  
        $supplier_id_2	= (isset($_POST['supplier_name_s2'][$count]) && !empty($_POST['supplier_name_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name_s2'][$count])) : '');


		$unit_price_3	= (isset($_POST['unit_price_s3'][$count]) && !empty($_POST['unit_price_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price_s3'][$count])) : '');       
        $amount_3	= (isset($_POST['amount_s3'][$count]) && !empty($_POST['amount_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount_s3'][$count])) : '');  
        $supplier_id_3	= (isset($_POST['supplier_name_s3'][$count]) && !empty($_POST['supplier_name_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name_s3'][$count])) : '');

		// Selected supplier info // 1,2,3
        $sel = (isset($_POST['selected_supplier'][$count]) && !empty($_POST['selected_supplier'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['selected_supplier'][$count])) : '');

 		if($sel == 1){
			$selected_unit_price	= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : '');
			
			$selected_amount	= (isset($_POST['amount'][$count]) && !empty($_POST['amount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount'][$count])) : '');
			
			$selected_supplier_id	= (isset($_POST['supplier_name'][$count]) && !empty($_POST['supplier_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name'][$count])) : '');
		}elseif($sel == 2){
			$selected_unit_price	= (isset($_POST['unit_price_s2'][$count]) && !empty($_POST['unit_price_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price_s2'][$count])) : '');
			
			$selected_amount	= (isset($_POST['amount_s2'][$count]) && !empty($_POST['amount_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount_s2'][$count])) : '');
			
			$selected_supplier_id	= (isset($_POST['supplier_name_s2'][$count]) && !empty($_POST['supplier_name_s2'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name_s2'][$count])) : '');
		}
		
		elseif($sel == 3){
			$selected_unit_price	= (isset($_POST['unit_price_s3'][$count]) && !empty($_POST['unit_price_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price_s3'][$count])) : '');
			
			$selected_amount	= (isset($_POST['amount_s3'][$count]) && !empty($_POST['amount_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['amount_s3'][$count])) : '');
			
			$selected_supplier_id	= (isset($_POST['supplier_name_s3'][$count]) && !empty($_POST['supplier_name_s3'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['supplier_name_s3'][$count])) : '');
		}
		
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'cs_id'       =>  $cs_info_id,
            
            'rlp_details_id'          =>  $rlp_details_id,
            'material_id'          =>  $material_id,
            'material_name'          =>  $material_name,
            'unit'          	=>  $unit,
            'quantity'          =>  $quantity,
            //'estimated_price'   =>  $estimatedPrice,
            'unit_price_1'   		=>  $unit_price_1,
            'amount_1'   			=>  $amount_1,
            'supplier_id_1'          =>  $supplier_id_1,
			
			
            'unit_price_2'   		=>  $unit_price_2,
            'amount_2'   			=>  $amount_2,
            'supplier_id_2'          =>  $supplier_id_2,
			
			
            'unit_price_3'   		=>  $unit_price_3,
            'amount_3'   			=>  $amount_3,
            'supplier_id_3'          =>  $supplier_id_3,
			
			
            'selected_unit_price'   		=>  $selected_unit_price,
            'selected_amount'   			=>  $selected_amount,
            'selected_supplier_id'          =>  $selected_supplier_id,
        ];
        saveData("cs_details", $dataParam);
		
		/*
		*  update rlp_details price:
		*/
		$queryBal = "UPDATE `rlp_details` SET `unit_price`='$selected_unit_price', `amount`= '$selected_amount', `supplier`= '$selected_supplier_id' WHERE `id` = '$rlp_details_id'";
		$conn->query($queryBal); 
		/*
		*  update rlp_info is_cs:
		*/
		$queryCs = "UPDATE `rlp_info` SET `is_cs`='1' WHERE `id` = '$rlp_info_id'";
		$conn->query($queryCs); 
		
		
		
    }
}

function getCSListDataW(){
    $user_id            =   $_SESSION['logged']['user_id'];
    $warehouse_id            =   $_SESSION['logged']['warehouse_id'];
    $role_id            =   $_SESSION['logged']['role_id'];    
    $role_name          =   get_role_shortcode_by_role_id($role_id);
	
	
	$listData   =   [];
	$sql      = '* FROM `cs_master` WHERE 1=1 ORDER BY `id` DESC , `created_at` DESC  ';
   
	$listData   = getTableDataListByTableName($sql);
	
    return $listData;
}

function getCsDetailsData($cs_id){
    $table      =   "cs_master WHERE id=$cs_id";
    $cs_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "cs_details WHERE cs_id=$cs_id";
    $cs_details   = getTableDataByTableNameRlp($table, $order, $column);
    
    $feedbackData   =   [
        'cs_info'      =>  $cs_info,
        'cs_details'   =>  $cs_details
    ];
    return $feedbackData;
}


?>
