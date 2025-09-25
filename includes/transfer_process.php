<?php
/*******************************************************************************
 * The following code will
 * Store Receive entry data.
 * There are 4 table to keet track on receive data. The are following:
 * 1. inv_receive (Store single row)      
 * 2. inv_receivedetail (Store Multiple row)
 * 3. inv_materialbalance (Store Multiple row)
 * 4. inv_supplierbalance (Store single row)
 * *****************************************************************************
 */  
if (isset($_POST['transfer_submit']) && !empty($_POST['transfer_submit'])) {
	
	// check duplicate:
	$transfer_id	= $_POST['transfer_id'];
    $table		= 'inv_transfermaster';
    $where		= "transfer_id='$transfer_id'";
    if(isset($_POST['transfer_update_submit']) && !empty($_POST['transfer_update_submit'])){
        $notWhere   =   "id!=".$_POST['transfer_update_submit'];
        $duplicatedata = isDuplicateData($table, $where, $notWhere);
    }else{
        $duplicatedata = isDuplicateData($table, $where);
    }
	if ($duplicatedata) {
		$status     =   'error';
		$_SESSION['warning']    =   "Operation faild. Duplicate data found..!";
    }else{
		    
			$transfer_total		=   0;
			$no_of_material  	=   0;
			for ($count = 0; $count < count($_POST['quantity']); $count++) {
				
				/*
				 *  Insert Data Into inv_issuedetail Table:
				*/       
				
				$transfer_date      = $_POST['transfer_date'];
				$transfer_id        = $_POST['transfer_id'];
				//$project_id         = $_POST['project_id'];
				$from_warehouse   	= $_POST['from_warehouse'];
				$to_warehouse   	= $_POST['to_warehouse'];
				
				$from_project   	= $_SESSION['logged']['project_id'];
				$to_project   		= $_SESSION['logged']['project_id'];
				
				$material_name      = $_POST['material_name'][$count];
				$material_id        = $_POST['material_id'][$count];
				$product_price_id   = $_POST['product_price_id'][$count];
				$unit               = $_POST['unit'][$count];
				$part_no            = $_POST['part_no'][$count];
				$unit_price         = $_POST['unit_price'][$count];
				$quantity           = $_POST['quantity'][$count];
				//$use_in          	= $_POST['use_in'];
				$total_amount       = $_POST['sub_total_amount'];
				$remarks            = $_POST['remarks']; 
				$transfered_by      = $_SESSION['logged']['user_id']; 
				
				$no_of_material     = $no_of_material+$quantity;
				$transfer_total   	= $transfer_total+$unit_price;

				
				
				
				if (is_uploaded_file($_FILES['file']['tmp_name'])) 
				{
					$temp_file=$_FILES['file']['tmp_name'];
					$issue_image=time().$_FILES['file']['name'];
					$q = move_uploaded_file($temp_file,"images/".$issue_image);
				} 

				
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

    			/* Update Qty in inv_material table*/

    			/* insert in inv_issuedetail table*/
        
				$query = "INSERT INTO `inv_tranferdetail` (`transfer_id`,`material_id`,`material_name`,`part_no`,`transfer_qty`,`unit`,`unit_price`,`type`,`inwarehouse`,`outwarehouse`,`inproject`,`outproject`) VALUES ('$transfer_id','$material_id','$material_name','$part_no','$quantity','$unit','$unit_price','1','$to_warehouse','$from_warehouse','$to_project','$from_project')";
				$conn->query($query);
				
				
				/*
				 *  Insert Data Into inv_materialbalance Table:
				*/
				$mb_ref_id      = $transfer_id;
				$mb_materialid  = $material_id;
				$mb_date        = (isset($transfer_date) && !empty($transfer_date) ? date('Y-m-d h:i:s', strtotime($transfer_date)) : date('Y-m-d h:i:s'));
				$mbin_qty       = 0;
				$mbin_val       = 0;
				$mbout_qty      = $quantity;
				$mbout_val      = $mbout_qty * $unit_price;
				$mbprice        = $unit_price;
				$mbtype         = 'Transfer';
				$mbserial       = '1.1';
				$mbunit_id      = $transfer_id;
				$mbserial_id    = 0;
				$status    		= 'Pending';
				$jvno           = $transfer_id;
				$created_by		= $_SESSION['logged']['user_id'];		
				
				/* $query_inmb = "INSERT INTO `inv_materialbalance` (`mb_ref_id`,`mb_materialid`,`mb_date`,`mbin_qty`,`mbin_val`,`mbout_qty`,`mbout_val`,`mbprice`,`mbtype`,`mbserial`,`mbserial_id`,`mbunit_id`,`jvno`,`part_no`,`project_id`,`warehouse_id`) VALUES ('$mb_ref_id','$mb_materialid','$mb_date','$mbin_qty','$mbin_val','$mbout_qty','$mbout_val','$mbprice','$mbtype','$mbserial','$mbunit_id','$unit','$jvno','$part_no','$project_id','$warehouse_id')";
				$conn->query($query_inmb); */
			}
			/*
			*  Insert Data Into inv_issue Table:
			*/
			$query2 = "INSERT INTO `inv_transfermaster` (`transfer_id`, `transfer_date`, `no_of_material`, `transfer_total`, `from_warehouse`, `to_warehouse`, `from_project`, `to_project`, `remarks`, `status`, `created_by`) VALUES ('$transfer_id','$transfer_date','$no_of_material','$transfer_total','$from_warehouse','$to_warehouse','$from_project','$to_project','$remarks','$status','$created_by')";
			$result2 = $conn->query($query2);  
			
			$_SESSION['success']    =   "Transfer process have been successfully completed.";
			header("location: transfer_list.php");
			exit();
			}
	
}

function getTransferDataDetailsById($id){
    global $conn;
    $transfers      =   "";
    $transferDetails =   "";
    
    // get receive data
    $sql1           = "SELECT * FROM inv_transfermaster where id=".$id;
    $result1        = $conn->query($sql1);

    if ($result1->num_rows > 0) {
        $transfers = $result1->fetch_object();
        // get receive details data
        $table                  =   'inv_tranferdetail where transfer_id='."'$transfers->transfer_id'";
        $order                  =   'DESC';
        $column                 =   'transfer_qty';
        $dataType               =   'obj';
        $transferDetailsData     = getTableDataByTableName($table, $order, $column, $dataType);
        if(isset($transferDetailsData) && !empty($transferDetailsData)){
            $transferDetails     =   $transferDetailsData;
        }
    }
    $feedbackData   =   [
        'transferData'           =>  $transfers,
        'transferDetailsData'    =>  $transferDetails
    ];
    
    return $feedbackData;
}




/* if(isset($_GET['process_type']) && $_GET['process_type'] == 'get_building_by_package'){
    include '../connection/connect.php';
    include '../helper/utilities.php';
    $package_id      =    $_POST['package_id'];
    $tableName      =    'buildings where package_id='.$package_id;
    $tableData      = getTableDataByTableName($tableName, '', 'building_id');
    if (isset($tableData) && !empty($tableData)) {
        echo "<option value=''>Please Select</option>";
        foreach ($tableData as $data) { ?>
            <option value="<?php echo $data['id']; ?>"><?php echo $data['building_id'].'('.$data['id'].')'; ?></option>
            <?php
        }
    }
} */
/*******************************************************************************
 * The following code will
 * Update Receive entry data.
 * There are 4 table to keet track on receive data. The are following:
 * 1. inv_receive (Update single row)      
 * 2. inv_receivedetail (First Delete all rows then Store Multiple row)
 * 3. inv_materialbalance (First Delete all rows then Store Multiple row)
 * 4. inv_supplierbalance (Update single row)
 * *****************************************************************************
 */

if(isset($_POST['transfer_receive_submit']) && !empty($_POST['transfer_receive_submit'])){


    $edit_id            =   $_POST['edit_id'];
    $transfer_id    	=   $_POST['transfer_id'];
    
    // first delete all from inv_receivedetail; 
    //$delsql    = "DELETE FROM `inv_issuedetail` WHERE `issue_id`='$transfer_id'";
    //$conn->query($delsql);
    // first delete all from inv_materialbalance; 
    //$delsq2    = "DELETE FROM `inv_materialbalance` WHERE `mb_ref_id`='$transfer_id'";
    //$conn->query($delsq2);
    
    for ($count = 0; $count < count($_POST['quantity']); $count++) {
        /*
         *  Insert Data Into inv_issuedetail Table:
        */       
        
				$transfer_date 		= $_POST['transfer_date'];
				$receive_date 		= $_POST['receive_date'];
				$transfer_id    	= $_POST['transfer_id'];
				$from_warehouse 	= $_POST['from_warehouse'];
				$to_warehouse   	= $_POST['to_warehouse'];
				
				$from_project 		= $_SESSION['logged']['project_id'];
				$to_project   		= $_SESSION['logged']['project_id'];
				
				$material_name      = $_POST['material_name'][$count];
				$material_id        = $_POST['material_id'][$count];
				$unit               = $_POST['unit'][$count];
				$part_no            = $_POST['part_no'][$count];
				$unit_price         = $_POST['unit_price'][$count];
				$quantity           = $_POST['quantity'][$count];
				$totalamount     	= $_POST['totalamount'][$count];
				$transferDetailsId  = $_POST['id'][$count];
				
				$total_amount       = $_POST['sub_total_amount'];
				$remarks            = $_POST['remarks'];     
				
				
				if (is_uploaded_file($_FILES['file']['tmp_name'])) 
				{
					$temp_file=$_FILES['file']['tmp_name'];
					$issue_image=time().$_FILES['file']['name'];
					$q = move_uploaded_file($temp_file,"images/".$issue_image);
				} 
        
				$queryPro = "INSERT INTO `inv_product_price`(`mrr_no`,`material_id`, `receive_details_id`, `qty`, `price`,`part_no`,`project_id`,`warehouse_id`, `status`) VALUES ('$transfer_id','$material_id','$transferDetailsId','$quantity','$unit_price','$part_no','$to_project','$to_warehouse','1')";
				$conn->query($queryPro); 
				
				/*
				*  update inv_material current_balance:
				*/
				$queryBal = "UPDATE `inv_material` SET `current_balance`=current_balance + $quantity WHERE `material_id_code` = '$material_id'";
				$conn->query($queryBal); 
				
				/*
				 *  Insert Data Into inv_materialbalance Table:
				*/
				$mb_ref_id      = $transfer_id;
				$mb_materialid  = $material_id;
				$mb_date        = (isset($transfer_date) && !empty($transfer_date) ? date('Y-m-d h:i:s', strtotime($transfer_date)) : date('Y-m-d h:i:s'));
				$mbfrom_in_qty       = 0;
				$mbfrom_out_qty      = $quantity;
				$mbfrom_type         = 'Transfer Out';
				$mbserial       = '1.1';
				$mbunit_id      = $project_id;
				$mbserial_id    = 0;
				$jvno           = $transfer_id;       
				
				$query_outmb = "INSERT INTO `inv_materialbalance` (`mb_ref_id`,`mb_materialid`,`mb_date`,`mbin_qty`,`mbin_val`,`mbout_qty`,`mbout_val`,`mbprice`,`mbtype`,`mbserial`,`mbserial_id`,`mbunit_id`,`project_id`, `warehouse_id`) VALUES ('$mb_ref_id','$mb_materialid','$mb_date','$mbfrom_in_qty','$mbin_val','$mbfrom_out_qty','$mbout_val','$mbprice','$mbfrom_type','$mbserial','$mbunit_id','$mbserial_id','$from_project','$from_warehouse')";
				$conn->query($query_outmb);
				
				
				$mbin_in_qty       	= $quantity;
				$mbin_out_qty      	= 0;
				$mbfrom_type		= 'Transfer In';
				$query_inmb = "INSERT INTO `inv_materialbalance` (`mb_ref_id`,`mb_materialid`,`mb_date`,`mbin_qty`,`mbin_val`,`mbout_qty`,`mbout_val`,`mbprice`,`mbtype`,`mbserial`,`mbserial_id`,`mbunit_id`,`project_id`, `warehouse_id`) VALUES ('$mb_ref_id','$mb_materialid','$mb_date','$mbin_in_qty','$mbin_val','$mbin_out_qty','$mbout_val','$mbprice','$mbfrom_type','$mbserial','$mbunit_id','$mbserial_id','$to_project','$to_warehouse')";
				$conn->query($query_inmb);
    }
    /*
        *  Update Data Into inv_receive Table:
    */
			

    $query2 = "UPDATE `inv_transfermaster` SET `status`='Approved' WHERE `id` = '$edit_id'";
	
    
    $result2 = $conn->query($query2); 
    
    $_SESSION['success']    =   "Transfer process have been successfully updated.";
    header("location: transfer_list.php");
    exit();
}


if (isset($_POST['issue_approve_submit']) && !empty($_POST['issue_approve_submit'])) {
 
        /*
         *  Update Data Into inv_receive Table:
        */ 
       
        $issue_id				= $_POST['issue_id']; 
        $approval_status		= $_POST['approval_status'];       
        $approved_by            = $_SESSION['logged']['user_id'];       
        $approved_at            = $_POST['approved_at'];        
        $approval_remarks		= $_POST['approval_remarks'];       
               
        $query = "UPDATE `inv_issue` SET `approval_status`='$approval_status',`approved_by`='$approved_by',`approved_at`='$approved_at',`approval_remarks`='$approval_remarks' WHERE `issue_id`='$issue_id'";
        $conn->query($query);
		
		
		/*
         *  Update Data Into inv_receivedetail Table:
        */      
        $query2 = "UPDATE `inv_issuedetail` SET `approval_status`='$approval_status' WHERE `issue_id`='$issue_id'";
        $conn->query($query2);
		
		/*
         *  Update Data Into inv_materialbalance Table:
        */      
        $query3 = "UPDATE `inv_materialbalance` SET `approval_status`='$approval_status' WHERE `mb_ref_id`='$issue_id'";
        $conn->query($query3);
		
		/*
         *  Update Data Into inv_supplierbalance Table:
        */      
        $query3 = "UPDATE `inv_supplierbalance` SET `approval_status`='$approval_status' WHERE `sb_ref_id`='$issue_id'";
        $conn->query($query3);
		
		

    $_SESSION['success']    =   "ISSUE Approval process successfully completed.";
    header("location: issue-list.php");
    exit();
}

?>