<?php
if (isset($_POST['cost_entry']) && !empty($_POST['cost_entry'])){

    $m_cost_id		= (isset($_POST['m_cost_id']) && !empty($_POST['m_cost_id']) ? trim(mysqli_real_escape_string($conn,$_POST['m_cost_id'])) : "");
    $eel_code		= (isset($_POST['eel_code']) && !empty($_POST['eel_code']) ? trim(mysqli_real_escape_string($conn,$_POST['eel_code'])) : "");
	$in_time		= (isset($_POST['in_time']) && !empty($_POST['in_time']) ? trim(mysqli_real_escape_string($conn,$_POST['in_time'])) : date("Y-m-d h:i:s"));
	$out_time		= (isset($_POST['out_time']) && !empty($_POST['out_time']) ? trim(mysqli_real_escape_string($conn,$_POST['out_time'])) : date("Y-m-d h:i:s"));
    $problem_details		= (isset($_POST['problem_details']) && !empty($_POST['problem_details']) ? trim(mysqli_real_escape_string($conn,$_POST['problem_details'])) : "");
    $remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
	
	$project_id		= (isset($_POST['project_id']) && !empty($_POST['project_id']) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'])) : "");
    $warehouse_id		= (isset($_POST['warehouse_id']) && !empty($_POST['warehouse_id']) ? trim(mysqli_real_escape_string($conn,$_POST['warehouse_id'])) : "");
    
    /*
     * *****************************rrr_info table operation********************
     */  

		
		
    
    $notesheets_info_response  =   execute_other_cost_table();
    $notesheets_info_response  =   execute_maintenance_mechanic_table();
    $notesheets_info_response  =   execute_maintenance_cost_table();
    if(isset($notesheets_info_response) && $notesheets_info_response['status'] == "success"){
        $rrr_info_id    =   $notesheets_info_response['last_id'];
		$notesheets_info_response  =   execute_maintenance_spare_parts_table($rrr_info_id);
        $_SESSION['success']    =   "Your request have been successfully procced.";
    }else{
        //$_SESSION['error']    =   "Failed to save data";
		$_SESSION['success']    =   "Your request have been successfully procced.";
    }
    header("location: maintenance_cost.php");
    exit();
}
function execute_maintenance_cost_table(){
		global $conn;
		//$m_cost_id		= (isset($_POST['m_cost_id']) && !empty($_POST['m_cost_id']) ? trim(mysqli_real_escape_string($conn,$_POST['m_cost_id'])) : "");
		$m_cost_id		= get_mcsl_no();
		$eel_code		= (isset($_POST['eel_code']) && !empty($_POST['eel_code']) ? trim(mysqli_real_escape_string($conn,$_POST['eel_code'])) : "");
		$in_time		= (isset($_POST['in_time']) && !empty($_POST['in_time']) ? trim(mysqli_real_escape_string($conn,$_POST['in_time'])) : date("Y-m-d h:i:s"));
		$out_time		= (isset($_POST['out_time']) && !empty($_POST['out_time']) ? trim(mysqli_real_escape_string($conn,$_POST['out_time'])) : date("Y-m-d h:i:s"));
		$problem_details		= (isset($_POST['problem_details']) && !empty($_POST['problem_details']) ? trim(mysqli_real_escape_string($conn,$_POST['problem_details'])) : "");
		$remarks		= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? trim(mysqli_real_escape_string($conn,$_POST['remarks'])) : "");
		
		$project_id		= (isset($_POST['project_id']) && !empty($_POST['project_id']) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'])) : "");
    $warehouse_id		= (isset($_POST['warehouse_id']) && !empty($_POST['warehouse_id']) ? trim(mysqli_real_escape_string($conn,$_POST['warehouse_id'])) : "");
                       
        $dataParam     =   [
            'm_cost_id'	=>  $m_cost_id,
            'eel_code'	=>  $eel_code,
            'in_time'       	=>  $in_time,
            'out_time'	=>  $out_time,
            'problem_details'	=>  $problem_details,
            'remarks'	=>  $remarks,
            'status'		=>  'Created',
            'project_id'		=>  $project_id,
            'warehouse_id'		=>  $warehouse_id,
			'created_at'	=>  date('Y-m-d h:i:s'),
			'created_by'	=>  $_SESSION['logged']['user_id']
        ];
    
    $response   =   saveData("maintenance_cost", $dataParam);
    return $response;
}
function execute_maintenance_spare_parts_table($rrr_info_id){
    global $conn;
    /*
     * *****************************rrr_details table operation********************
     */
	 //$no_of_material     =   0;
    for($count 		= 0; $count<count($_POST['material_name']); $count++){
        $m_cost_id		= (isset($_POST['m_cost_id']) && !empty($_POST['m_cost_id']) ? trim(mysqli_real_escape_string($conn,$_POST['m_cost_id'])) : "");
        $material_name	= (isset($_POST['material_name'][$count]) && !empty($_POST['material_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['material_name'][$count])) : '');
        $material_id	= (isset($_POST['material_id'][$count]) && !empty($_POST['material_id'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['material_id'][$count])) : '');
		$part_no	= (isset($_POST['part_no'][$count]) && !empty($_POST['part_no'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['part_no'][$count])) : '');
		$product_price_id	= (isset($_POST['product_price_id'][$count]) && !empty($_POST['product_price_id'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['product_price_id'][$count])) : '');
        $quantity	= (isset($_POST['quantity'][$count]) && !empty($_POST['quantity'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['quantity'][$count])) : '');
        $unit	= (isset($_POST['unit'][$count]) && !empty($_POST['unit'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit'][$count])) : '');
        $unit_price	= (isset($_POST['unit_price'][$count]) && !empty($_POST['unit_price'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_price'][$count])) : '');
        $totalamount	= (isset($_POST['totalamount'][$count]) && !empty($_POST['totalamount'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamount'][$count])) : '');
		$project_id		= (isset($_POST['project_id']) && !empty($_POST['project_id']) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'])) : "");
    $warehouse_id		= (isset($_POST['warehouse_id']) && !empty($_POST['warehouse_id']) ? trim(mysqli_real_escape_string($conn,$_POST['warehouse_id'])) : "");
		//$no_of_material     = $no_of_material+$quantity;
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'm_cost_id'	=>  $m_cost_id,
            'spare_parts_name'	=>  $material_name,
            'material_id'	=>  $material_id,
            'part_no'	=>  $part_no,
            'qty'	=>  $quantity,
            'unit'	=>  $unit,
            'rate'	=>  $unit_price,
            'amount'	=>  $totalamount,
            'project_id'	=>  $project_id,
            'warehouse_id'	=>  $warehouse_id,
            
			'created_at'	=>  date('Y-m-d h:i:s'),
			'created_by'	=>  $_SESSION['logged']['user_id']
        ];
    
        saveData("maintenance_spare_parts", $dataParam);
		
		/* Update Qty in inv_product_price table*/

					$sqlGetPrice = "select * from `inv_product_price` where `id`='$product_price_id'";
					$resultGetPrice = mysqli_query($conn, $sqlGetPrice);
					$rowGetPrice = mysqli_fetch_array($resultGetPrice);

					$oldQty = $rowGetPrice['qty'];
					$newQty = $oldQty - $quantity;
					
					if($newQty > 1){
						$status = 0;
					}
					

					$queryUpdateQty    = "UPDATE `inv_product_price` SET `qty`='$newQty' WHERE `id`='$product_price_id'";
	    			$conn->query($queryUpdateQty);

    			/* Update Qty in inv_product_price table*/
    			/* Update Qty in inv_material table*/

	    			$sqlGetqty = "select * from `inv_material` where `material_id_code`='$material_id'";
					$resultGetqty = mysqli_query($conn, $sqlGetqty);
					$rowGetqty = mysqli_fetch_array($resultGetqty);

					$old_Qty = $rowGetqty['current_balance'];
					$new_Qty = $old_Qty - $quantity;

	    			$queryUpdateQty    = "UPDATE `inv_material` SET `current_balance`='$new_Qty' WHERE `material_id_code`='$material_id'";
	    			$conn->query($queryUpdateQty);
					
					/*
				 *  Insert Data Into inv_materialbalance Table:
				*/
				$mb_ref_id      = $rrr_info_id;
				$mb_materialid  = $material_id;
				$material_name	= (isset($_POST['material_name'][$count]) && !empty($_POST['material_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['material_name'][$count])) : '');
				$eel_code		= (isset($_POST['eel_code']) && !empty($_POST['eel_code']) ? trim(mysqli_real_escape_string($conn,$_POST['eel_code'])) : "");
				$mb_date        = (isset($in_time) && !empty($in_time) ? date('Y-m-d h:i:s', strtotime($in_time)) : date('Y-m-d h:i:s'));
				$mbin_qty       = 0;
				$mbin_val       = 0;
				$mbout_qty      = $quantity;
				$mbout_val      = $mbout_qty * $unit_price;
				$mbprice        = $unit_price;
				$mbtype         = 'mCost';
				$mbserial       = '1.1';
				$mbunit_id      = $project_id;
				$mbserial_id    = 0;
				$jvno           = $rrr_info_id;             
				
				$query_inmb = "INSERT INTO `inv_materialbalance` (`mb_ref_id`,`mb_materialid`,`material_name`,`eel_code`,`mb_date`,`mbin_qty`,`mbin_val`,`mbout_qty`,`mbout_val`,`mbprice`,`mbtype`,`mbserial`,`mbserial_id`,`mbunit_id`,`jvno`,`part_no`,`project_id`,`warehouse_id`) VALUES ('$mb_ref_id','$mb_materialid','$material_name','$eel_code','$mb_date','$mbin_qty','$mbin_val','$mbout_qty','$mbout_val','$mbprice','$mbtype','$mbserial','$mbunit_id','$unit','$jvno','$part_no','$project_id','$warehouse_id')";
				$conn->query($query_inmb);
    }
}

function execute_other_cost_table(){
    global $conn;
    /*
     * *****************************rrr_details table operation********************
     */
	 $no_of_oc     =   0;
    for($count 		= 0; $count<count($_POST['oc_name']); $count++){
        $m_cost_id		= (isset($_POST['m_cost_id']) && !empty($_POST['m_cost_id']) ? trim(mysqli_real_escape_string($conn,$_POST['m_cost_id'])) : "");
		
        $oc_name		= (isset($_POST['oc_name'][$count]) && !empty($_POST['oc_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['oc_name'][$count])) : '');
		
        $oc_qty			= (isset($_POST['quantityoc'][$count]) && !empty($_POST['quantityoc'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['quantityoc'][$count])) : '');
		
        $oc_unit_price	= (isset($_POST['unit_priceoc'][$count]) && !empty($_POST['unit_priceoc'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['unit_priceoc'][$count])) : '');
		
        $oc_amount		= (isset($_POST['totalamountoc'][$count]) && !empty($_POST['totalamountoc'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['totalamountoc'][$count])) : '');
		$project_id		= (isset($_POST['project_id']) && !empty($_POST['project_id']) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'])) : "");
    $warehouse_id		= (isset($_POST['warehouse_id']) && !empty($_POST['warehouse_id']) ? trim(mysqli_real_escape_string($conn,$_POST['warehouse_id'])) : "");
		
		$no_of_oc     = $no_of_oc+$oc_name;
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'm_cost_id'		=>  $m_cost_id,
            'oc_name'		=>  $oc_name,
            'oc_qty'		=>  $oc_qty,
            'oc_unit_price'	=>  $oc_unit_price,
            'oc_amount'		=>  $oc_amount,
            'project_id'		=>  $project_id,
            'warehouse_id'		=>  $warehouse_id,
            
			'created_at'	=>  date('Y-m-d h:i:s'),
			'created_by'	=>  $_SESSION['logged']['user_id']
        ];
    
        saveData("maintenance_other_cost", $dataParam);
    }
}

function execute_maintenance_mechanic_table(){
    global $conn;
    /*
     * *****************************rrr_details table operation********************
     */
	 $no_of_mmechanic     =   0;
    for($count 		= 0; $count<count($_POST['mechanic_name']); $count++){
        $m_cost_id		= (isset($_POST['m_cost_id']) && !empty($_POST['m_cost_id']) ? trim(mysqli_real_escape_string($conn,$_POST['m_cost_id'])) : "");
        $mechanic_name	= (isset($_POST['mechanic_name'][$count]) && !empty($_POST['mechanic_name'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['mechanic_name'][$count])) : '');
		$no_of_mmechanic     = $no_of_mmechanic+$mechanic_name;
        $dataParam     =   [
            //'id'                =>  get_table_next_primary_id('rlp_details'),
            'm_cost_id'	=>  $m_cost_id,
            'mechanic_name'	=>  $mechanic_name,
            
			'created_at'	=>  date('Y-m-d h:i:s'),
			'created_by'	=>  $_SESSION['logged']['user_id']
        ];
    
        saveData("maintenance_mechanic", $dataParam);
    }
}


function getMaintenanceCostDetailsData($m_cost_id){
    $table      =   "`maintenance_cost` WHERE `m_cost_id`='$m_cost_id'";
    $m_cost_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "`maintenance_spare_parts` WHERE `m_cost_id`='$m_cost_id'";
    $m_cost_parts_details   = getTableDataByTableName($table, $order, $column);
    
    $feedbackData   =   [
        'm_cost_info'      =>  $m_cost_info,
        'm_cost_parts_details'   =>  $m_cost_parts_details
    ];
    return $feedbackData;
}


