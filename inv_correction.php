<?php
/*
 * Mysql Database connection string:
 */
global $conn;
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "cted_backup_28_8";

// Create connection
$conn       = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


/*2nd Connection*/
global $sconn;
$sservername = "localhost";
$susername   = "root";
$spassword   = "";
$sdbname     = "cted_duplicate";

// Create connection
$sconn       = new mysqli($sservername, $susername, $spassword, $sdbname);
// Check connection
if ($sconn->connect_error) {
    die("Connection failed: " . $sconn->connect_error);
}

//update product price table

//  $sql = "SELECT material_id_code,current_balance FROM inv_material ";
// $result = $conn->query($sql);

// foreach($result as $key=>$val){

//     $select_last_query = "SELECT `id`, `mrr_no`, `material_id` FROM `inv_product_price` WHERE material_id='".$val['material_id_code']."' ORDER by id DESC  LIMIT 1";
//     $result_2 = $conn->query($select_last_query);
//     foreach($result_2 as $l_val){
//          $insetQuery = "UPDATE `inv_product_price` 
//              SET 
//              `qty`='".$val['current_balance']."',status=1  
//              WHERE material_id='".$l_val['material_id']."' AND id='".$l_val['id']."'  ";
//              $result = $conn->query($insetQuery);
//     }

     
// } 

//Current Balance Update
// $sql = "SELECT SUM(mbin_qty-mbout_qty) as current_balance,mb_materialid   FROM `inv_materialbalance`  GROUP BY mb_materialid ";
// $result = $conn->query($sql);
// foreach($result as $key=>$val){
//     $insetQuery = "UPDATE `inv_material` 
//     SET 
//     `current_balance`='".$val['current_balance']."'  WHERE material_id_code='".$val['mb_materialid']."' ";
//     $result = $conn->query($insetQuery);

   
// }



//Opening Balance and opening val update from 
// $sql = "SELECT * FROM `inv_materialbalance` WHERE mbtype='OP'";
// $result = $conn->query($sql);
// foreach($result as $key=>$val){
//     $insetQuery = "UPDATE `inv_material` SET `op_balance_qty`='".$val['mbin_qty']."',`op_balance_val`='".$val['mbin_val']."' where material_id_code='".$val['mb_materialid']."' ";
//     $result = $conn->query($insetQuery);

   
// }


//Setp one 

//Opening Data insert into product Price Table and inv_materials table
// $sql = "SELECT * FROM `inv_materialbalance` WHERE mbtype='OP'";
// $result = $sconn->query($sql);
// foreach($result as $key=>$val){
//     $insetQuery = "INSERT INTO `inv_product_price`( `mrr_no`, `material_id`, `receive_details_id`, `qty`, `price`, `part_no`, `status`, `created_at`, `cerated_by`, `updated_at`, `updated_by`) VALUES ('".$val['mb_ref_id']."','".$val['mb_materialid']."','0','".$val['mbin_qty']."','".$val['mbin_val']."','".$val['part_no']."','1','".$val['mb_date']."','1','".$val['mb_date']."','1') ";
//     $result = $conn->query($insetQuery);

//     $insetQuery2 = "INSERT INTO `inv_materialbalance`(`id`, `mb_ref_id`, `mb_materialid`, `mb_date`, `mbin_qty`, `mbin_val`, `mbout_qty`, `mbout_val`, `mbprice`, `mbtype`, `mbserial`, `mbserial_id`, `mbunit_id`, `jvno`, `part_no`, `project_id`, `warehouse_id`, `package_id`, `building_id`, `approval_status`, `is_manual_code_edit`) VALUES ('".$val['id']."','".$val['mb_ref_id']."','".$val['mb_materialid']."','".$val['mb_date']."','".$val['mbin_qty']."','".$val['mbin_val']."','".$val['mbout_qty']."','".$val['mbout_val']."','".$val['mbprice']."','".$val['mbtype']."','".$val['mbserial']."','".$val['mbserial_id']."','".$val['mbunit_id']."','".$val['jvno']."','".$val['part_no']."','".$val['project_id']."','".$val['warehouse_id']."','".$val['package_id']."','".$val['building_id']."','".$val['approval_status']."',0)";
//     $result = $conn->query($insetQuery2);
// }


//step two

// $sql = "SELECT t1.`mrr_date`,  t2.`id`, t2.`mrr_no`, t2.`material_id`, t2.`material_name`, t2.`unit_id`, t2.`receive_qty`, t2.`unit_price`, t2.`sl_no`, t2.`total_receive`, t2.`rd_serial_id`, t2.`part_no`, t2.`project_id`, t2.`warehouse_id`, t2.`approval_status`, t2.`is_manual_code_edit` 
// FROM `inv_receive` as t1
// INNER JOIN inv_receivedetail AS t2 ON t1.mrr_no=t2.mrr_no ";
// $result = $conn->query($sql);

// foreach($result as $key=>$val){
//     $insetQuery = "INSERT INTO `inv_product_price`( `mrr_no`, `material_id`, `receive_details_id`, `qty`, `price`, `part_no`, `status`, `created_at`, `cerated_by`, `updated_at`, `updated_by`) VALUES ('".$val['mrr_no']."','".$val['material_id']."','".$val['id']."','".$val['receive_qty']."','".$val['unit_price']."','".$val['part_no']."','1','".$val['mrr_date']."','1','".$val['mrr_date']."','1') ";
//     $result = $conn->query($insetQuery);

//     $insetQuery2 = "INSERT INTO `inv_materialbalance`( `mb_ref_id`, `mb_materialid`, `mb_date`, `mbin_qty`, `mbin_val`, `mbout_qty`, `mbout_val`, `mbprice`, `mbtype`, `mbserial`, `mbserial_id`, `mbunit_id`, `jvno`, `part_no`, `project_id`, `warehouse_id`, `package_id`, `building_id`, `approval_status`, `is_manual_code_edit`) VALUES ('".$val['mrr_no']."','".$val['material_id']."','".$val['mrr_date']."','".$val['receive_qty']."','".$val['unit_price']."','0','0','".($val['receive_qty']*$val['unit_price'])."','Receive','1','1','".$val['unit_id']."','0','".$val['part_no']."','".$val['project_id']."','".$val['warehouse_id']."','0','0','".$val['approval_status']."',0)";
//     $result = $conn->query($insetQuery2);
// }


//Step three

// $sql = " SELECT  t1.issue_id,t2.material_id,t1.issue_date,t2.issue_qty,t2.issue_price,(t2.issue_qty * t2.issue_price ) as mbprice ,'Issue' as mbtype,t2.unit,t2.part_no,t2.project_id,t2.warehouse_id  FROM inv_issue AS t1 
// INNER JOIN inv_issuedetail AS t2 ON t1.issue_id=t2.issue_id ";
// $result = $conn->query($sql);
// //$id=0;
// foreach($result as $key=>$val){
//     // $id++;
//     // if($id < 10){
//     //     echo "<pre>";
//     //     print_r($val);
//     //     echo "</pre>";
//     // }

//     $sql2 = "INSERT INTO `inv_materialbalance`(`mb_ref_id`, `mb_materialid`, `mb_date`, `mbin_qty`, `mbin_val`, `mbout_qty`, `mbout_val`, `mbprice`, `mbtype`, `mbserial`, `mbserial_id`, `mbunit_id`, `jvno`, `part_no`, `project_id`, `warehouse_id`, `package_id`, `building_id`, `approval_status`, `is_manual_code_edit`)  VALUES ('".$val['issue_id']."','".$val['material_id']."','".$val['issue_date']."','0','0','".$val['issue_qty']."','".$val['issue_price']."','".$val['mbprice']."','".$val['mbtype']."','0','0','".$val['unit']."','0','".$val['part_no']."','".$val['project_id']."','".$val['warehouse_id']."','0','0','0','0') ";
//     $result = $conn->query($sql2);
// }


