<?php
function getDefaultCategoryCodeByStore2($table, $fieldName, $modifier, $defaultCode, $prefix,$b_store){
    global $conn;
	$store_id	=	$_SESSION['logged']['store_id'];
    $sql    	= "SELECT count($fieldName) as total_row FROM $table WHERE store_id=$b_store";
    $result 	= $conn->query($sql);
    $name   	=   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix.sprintf('%'.$modifier, $number);
    return $defaultCode;
    
}
function getStoreNameById($id){
    global $conn;
    $table  =   "store";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}


function getRLPStatusBYID($id){
    global $conn;
    $table  =   "rlp_info";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->rlp_status;
    }
    return $name;
}

function getCsIDByRLPID($id){
    global $conn;
    $table  =   "cs_master";
    $sql = "SELECT * FROM $table WHERE rlp_info_id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->id;
    }
    return $name;
}

function getDefaultCategoryCodeByStore($table, $fieldName, $modifier, $defaultCode, $prefix){
    global $conn;
	$store_id	=	$_SESSION['logged']['store_id'];
    $sql    	= "SELECT count($fieldName) as total_row FROM $table WHERE store_id=$store_id";
    $result 	= $conn->query($sql);
    $name   	=   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix.sprintf('%'.$modifier, $number);
    return $defaultCode;
    
}

function is_member($user_id, $roleName = 'member') {
    global $conn;
    $sql    =   "SELECT r.*
                     FROM roles as r
                     JOIN users as u 
                     ON r.id = u.role_id
                     WHERE u.id = $user_id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {  
            $users = $result->fetch_object();
            if ($users->short_name == $roleName) {
                return true;
            }
            return false;
        }
    return false;
}

function is_pro($user_id, $roleName = 'pro') {
    global $conn;
    $sql    =   "SELECT r.*
                     FROM roles as r
                     JOIN users as u 
                     ON r.id = u.role_id
                     WHERE u.id = $user_id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {  
            $users = $result->fetch_object();
            if ($users->short_name == $roleName) {
                return true;
            }
            return false;
        }
    return false;
}
function is_super_admin($user_id, $roleName = 'sa') {
    global $conn;
    $sql    =   "SELECT r.*
                     FROM roles as r
                     JOIN users as u 
                     ON r.id = u.role_id
                     WHERE u.id = $user_id";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {  
            $users = $result->fetch_object();
            if ($users->short_name == $roleName) {
                return true;
            }
            return false;
        }
    return false;
}
function is_not_guest($user_id, $type = 'guest') {
    global $conn;
    $sql    =   "SELECT * FROM users WHERE id = $user_id";
    $result = $conn->query($sql);
        if ($result->num_rows > 0) {  
            $users = $result->fetch_object();
            if ($users->type != $type) {
                return true;
            }
            return false;
        }
    return false;
}

function hasAccessPermission($user_id, $page_name, $accessType) {
    global $conn;
    $return = false;
    $fieldsName     =   'pa.' . $accessType;
    $sql    =   "SELECT pa.*
                     FROM role_access as pa
                     JOIN roles as r 
                     ON pa.role_id = r.id
                     JOIN users as u
                     ON u.role_id = r.id
                     WHERE u.id = '$user_id' AND pa.page_name = '$page_name' AND $fieldsName=1";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {            
            $return = true;
        }

    return $return;
}
function getTableDataByTableNameAndIntId($table, $int_id, $dataType) {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE `interview_id` = '$int_id'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}
 function getTableDataByTableName2($table, $order = 'asc', $column='name', $dataType = 'obj') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
} 

function getTableDataByTableNameById($table, $order = 'asc', $column='id', $dataType = '') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getRentableEquipments() {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM `Equipments` WHERE `status` != 'Rented'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getTableDataByTableNameAndId($table, $id, $dataType = '') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE `id`= $id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getInterviewDataByTableName($table, $order = 'asc', $column='name', $dataType = 'obj') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}
function getInterviewDataByTableNameAndIntId($table, $interviewId, $order = 'asc', $column='name', $dataType = 'obj') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE `interview_id`='$interviewId' order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}
function getDataByIntIdAndCanId($table, $int_id, $can_id, $dataType = 'obj') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE `int_id`='$int_id' AND `can_id`='$can_id'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}
function getAgentDataForGroupWise() {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM agency_info";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_object()) {
            $dataContainer[] = $row;
        }
    }
    return $dataContainer;
}
/* function saveData($table, $dataParam) {
    global $conn;
    $fields_array   =   array_keys($dataParam);   
    $fields         =   implode(',', array_keys($dataParam));
    $values         =   "'" . implode ( "', '", array_values($dataParam) ) . "'";;
    $sql            = "INSERT INTO $table ($fields) VALUES ($values)";

    if ($conn->query($sql) === TRUE) {
        $feedbackData   =   [
            'status'    =>  'success',
            'data'      =>  'Data have been successfully inserted',
            'last_id'   =>  $conn->insert_id,
        ];
        return $feedbackData;
    } else {
        $feedbackData   =   [
            'status'    =>  'error',
            'data'      =>  "Error: " . $sql . "<br>" . $conn->error,
            'last_id'   =>  '',
        ];
        return $feedbackData;
    }
} */
/* function updateData($table, $dataParam, $where) {
    global $conn;
    $valueSets = array();
    foreach($dataParam as $key => $value) {
        if(isset($value) && !empty($value)){
            $valueSets[] = $key . " = '" . $value . "'";
        }
    }

    $conditionSets = array();
    foreach($where as $key => $value) {
       $conditionSets[] = $key . " = '" . $value . "'";
    }
    $sql = "UPDATE $table SET ". join(",",$valueSets) . " WHERE " . join(" AND ", $conditionSets);
    if ($conn->query($sql) === TRUE) {
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   =>  'Data have been successfully Updated',
        ];
    } else {
        $feedbackData   =   [
            'status'    =>  'error',
            'message'   =>  "Error: " . $sql . "<br>" . $conn->error,
        ];        
    }
    return $feedbackData;
} */
function getCandidatesSalaryByIdAndTable($table, $id){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `id`='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->expected_salary;
    }
    return $name;
}

function getTCByNotesheetNoAndTable($table, $nno){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `notesheet_no`='$nno'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->terms_condition;
    }
    return $name;
}

function getCandidatesNameByIdAndTable($table, $id){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `id`='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
/* function getNameByIdAndTable($table){
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
} 
function getDataRowIdAndTable($table){
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->fetch_object();
    }
}*/
function getDataRowIdAndTableBySQL($sql){
    global $conn;
    $dataContainer  =   [];
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row
        while ($row = $result->fetch_object()) {
            $dataContainer[] = $row;
        }
    }
    return $dataContainer;
}
function getTotalRowBySQL($sql){
    global $conn;
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}
function getDataRowByTable($table){
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}

function getDataRowByConditions($table,$where){
    global $conn;
    $sql = "SELECT * FROM $table $where";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}

function getDataRowByTableByStatus($table,$status){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `rlp_status`='$status'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}
function getDataRowByTableByPending($table){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `rlp_status`!=1";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}

function getDataRowByTableByType($table,$type){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `rlp_type`='$type'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}
function getAssignmentTotalRows($import_id){
    global $conn;
    $sql = "SELECT * FROM delivery_assignment_details where sms_status=1 and import_id=".$import_id;
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->num_rows;
    }
    return "0";
}
/* function getDataRowByTableAndId($table, $id){
    global $conn;
    $sql    = "SELECT * FROM $table where id=".$id;
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->fetch_object();
    }else{
        return false;
    }
} 
function getDefaultCategoryCode($table, $fieldName, $modifier, $defaultCode, $prefix){
    global $conn;
    $sql    = "SELECT count($fieldName) as total_row FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix.sprintf('%'.$modifier, $number);
    return $defaultCode;
    
}
function isDuplicateData($table, $where, $notWhere=''){
    global $conn;
    $sql='';
    $sql.="SELECT * FROM $table where $where ";
    if(isset($notWhere) && !empty($notWhere)){
        $sql.=" And $notWhere";
    }
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $lastRows   = $result->fetch_object();
        return $lastRows->id;
    }
    return false;
}*/
function setActiveMenuClass($menuName,  $currentMenu, $activeClass='active'){
    if($menuName == $currentMenu){
        return $activeClass;
    }else{
        return 'inactive';
    }
}
function csvToArray($filename = '', $delimiter = ',') {
        if (!file_exists($filename) || !is_readable($filename))
            return false;

        $header = null;
        $data = array();
        $count  =   1;
        if (($handle = fopen($filename, 'r')) !== false) {
            while ($row = fgetcsv($handle)) {
                if($count==1){
                    $count++;
                    continue;
                }
                $data[]     =     $row;
                
            }
            fclose($handle);
        }

        return $data;
    } // end of method
// get Daily Assignment Import Code:
function getDailyAssignmentImportCode($date, $prefix="DAI"){
    global $conn;
    $sql                = "SELECT count(id) as total_row FROM delivery_assignment where import_date = '$date'";
    $result             = $conn->query($sql);
    $lastRows           = $result->fetch_object();
    $number             = intval($lastRows->total_row) + 1;
    $dateFormatExplode  = explode('-', $date);
    $dateFormat         = $dateFormatExplode[0].$dateFormatExplode[1].$dateFormatExplode[2];
    $defaultCode        = $prefix.$dateFormat.sprintf('%08d', $number);
    return $defaultCode;

}
function human_format_date($timestamp){
    return date("jS M, Y h:i:a", strtotime($timestamp)); //September 30th, 2013
}
function getUserNameByUserId($id){
    global $conn;
    $sql = "SELECT * FROM users where id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $users  = $result->fetch_object();
        return $users->name;
    }
    return $name;
}
function getSignatureByUserId($id){
    global $conn;
    $sql = "SELECT * FROM users where id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $users  = $result->fetch_object();
        return $users->signature_image;
    }
    return $name;
}

function getSpecById($id){
    global $conn;
    $sql = "SELECT * FROM inv_material where id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $users  = $result->fetch_object();
        return $users->spec;
    }
    return $name;
}
function getDesignationByUserId($id){
    global $conn;
    $sql = "SELECT * FROM users where id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $users  = $result->fetch_object();
        return getDesignationNameById($users->designation);
    }
    return $name;
}
function sending_sms($smsData) {
    $curl = curl_init();
// Set some options - we are passing in a useragent too here
    curl_setopt_array($curl, [
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL => 'http://users.sendsmsbd.com/smsapi',
        CURLOPT_USERAGENT => 'SMS Process',
        CURLOPT_POST => 1,
        CURLOPT_POSTFIELDS => [
            'api_key'   => 'C20048105db9338ce405a5.84287692',
            'type'      => 'text',
            'senderid'  => 'SAIF POWER',
            'contacts'  => '88'.$smsData['contacts'],
            'msg'       => $smsData['msg'],
        ]
    ]);
// Send the request & save response to $resp
    $resp = curl_exec($curl);
// Close request to clear up some resources
    curl_close($curl);
    return $resp;
}

function deleteRecordByTableAndId($table,$fieldName,$id){
    global $conn;
    $sql            = "DELETE FROM $table WHERE $fieldName='$id'";
    if ($conn->query($sql) === TRUE) {
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   =>  'Data have been successfully Deleted',
        ];
        return $feedbackData;
    } else {
        $feedbackData   =   [
            'status'    =>  'error',
            'message'   =>  "Error: " . $sql . "<br>" . $conn->error,
        ];
        return $feedbackData;
    }
}

function getRoleShortNameByRoleId($id){
    global $conn;
    $table  =   "roles";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->short_name;
    }
    return $name;
}

function validate_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

function get_page_short_name_by_id($id){
    global $conn;
    $table  =   "page_details";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->short_name;
    }
    return $name;
}

function getDesignationNameById($id){
    global $conn;
    $table  =   "designations";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getDesignationIdByName($name){
    global $conn;
    $table  =   "designations";
    $sql = "SELECT * FROM $table WHERE name='$name'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->id;
    }
    return $name;
}

function getRoleIdByRoleName($name){
    global $conn;
    $table  =   "roles";
    $sql = "SELECT * FROM $table WHERE name='$name'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->id;
    }
    return $name;
}
function getRoleNameByRoleId($id){
    global $conn;
    $table  =   "roles";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getDivisionNameById($id){
    global $conn;
    $table  =   "branch";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}

function getDivisionShortNameById($id){
    global $conn;
    $table  =   "branch";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $short_name   =   '';
    if ($result->num_rows > 0) {
        $short_name   =   $result->fetch_object()->short_name;
    }
    return $short_name;
}
function getDivisionAddressById($id){
    global $conn;
    $table  =   "branch";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $division_address   =   '';
    if ($result->num_rows > 0) {
        $division_address   =   $result->fetch_object()->division_address;
    }
    return $division_address;
}
function getCandidateNameById($id){
    global $conn;
    $table  =   "candidates";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getDivisionIdByName($name){
    global $conn;
    $table  =   "branch";
    $sql = "SELECT * FROM $table WHERE name='$name'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->id;
    }
    return $name;
}
function getDepartmentIdByName($branch_id,$name){
    global $conn;
    $table  =   "department";
    $sql = "SELECT * FROM $table WHERE branch_id=$branch_id AND name='$name'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->id;
    }
    return $name;
}
function getDepartmentNameById($id){
    global $conn;
    $table  =   "department";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getDepartmentShortNameById($id){
    global $conn;
    $table  =   "department";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $short_name   =   '';
    if ($result->num_rows > 0) {
        $short_name   =   $result->fetch_object()->short_name;
    }
    return $short_name;
}
function getProjectNameById($id){
    global $conn;
    $table  =   "projects";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        //$name   =   $result->fetch_object()->project_name;
        $name   =   $result->fetch_object()->project_name;
    }
    return $name;
}

function getCategoryNameById($id){
    global $conn;
    $table  =   "inv_materialcategorysub";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        //$name   =   $result->fetch_object()->project_name;
        $name   =   $result->fetch_object()->category_description;
    }
    return $name;
}
function getProjectAddressById($id){
    global $conn;
    $table  =   "projects";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        //$name   =   $result->fetch_object()->project_name;
        $name   =   $result->fetch_object()->address;
    }
    return $name;
}

function getWarehouseNameById($id){
    global $conn;
    $table  =   "inv_warehosueinfo";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        //$name   =   $result->fetch_object()->project_name;
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}

function get_table_next_primary_id($table){
    global $conn;
    $sql        = "SELECT count('id') as total FROM $table";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    $nextRow    =   $total_row+1;
    return $nextRow;
}

function get_table_primary_id($table){
    global $conn;
    $sql = "SELECT `id` FROM $table ORDER BY `id` DESC";
    $result = $conn->query($sql);
    $id   =   '';
    if ($result->num_rows > 0) {
        $id   =   $result->fetch_object()->id;
    }
    return $id;
}

/*  function get_rlp_no($prefix="RLP", $formater_length=3){
    global $conn;
    
    $division_id    =   $_POST['division'];
    $department_id  =   $_POST['department']; 
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM rlp_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month AND is_delete=0 AND request_division=$division_id AND request_department=$department_id ";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$div    = replace_dashes(getDivisionNameById($division_id));
    $div    = replace_dashes(getDivisionShortNameById($division_id));
    $divName    = $div;
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    //$dep    = replace_dashes(getDepartmentNameById($department_id));
    $dep    = replace_dashes(getDepartmentShortNameById($department_id));
	//$depName    = mb_substr($dep, 0, 3);
	$depName    = $dep;
	
	//$pro   = replace_dashes(getProjectNameById($project_id));
    //$proName    = strtoupper(mb_substr($pro, 0, 3));
    
    //return $prefix."-".$year."-".$month."-".$divName.'-'.$proName.'-'.$finalRLPNo;
    return $prefix."-".$divName."-".$depName."-".$year.'-'.$month.'-'.$finalRLPNo;
} */ 
 function get_equips_rlp_no($prefix="E-RLP", $formater_length=3){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $project_id  	=   $_SESSION['logged']['project_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id']; 
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM equips_rlp_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month AND is_delete=0 AND request_project=$project_id";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'ENG';
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    //$dep    = replace_dashes(getDepartmentNameById($department_id));
   // $depName    = mb_substr($dep, 0, 3);
	
	$pro   = replace_dashes(getProjectNameById($project_id));
    $proName    = strtoupper(mb_substr($pro, 0, 3));
    
    //return $prefix."-".$year."-".$month."-".$divName.'-'.$proName.'-'.$finalRLPNo;
    //return $prefix."-".$divName."-".$proName."-".$year.'-'.$month.'-'.$finalRLPNo;
    return $prefix."-".$divName."-".$proName."-".$year.'-'.$month.'-'.$finalRLPNo;
}

 function get_rlp_no($prefix="RLP", $formater_length=3){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $project_id  	=   $_SESSION['logged']['project_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id']; 
    
    $year       =   date("Y");
    $month      =   date("m");
    //$sql        = "SELECT count('id') as total FROM rlp_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month AND is_delete=0 AND request_project=$project_id";
    //$sql        = "SELECT count('id') as total FROM rlp_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month AND is_delete=0";
    $sql        = "SELECT count('id') as total FROM rlp_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'KICD';
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    //$dep    = replace_dashes(getDepartmentNameById($department_id));
   // $depName    = mb_substr($dep, 0, 3);
	
	$pro   = replace_dashes(getProjectNameById($project_id));
    $proName    = strtoupper(mb_substr($pro, 0, 3));
    
    //return $prefix."-".$year."-".$month."-".$divName.'-'.$proName.'-'.$finalRLPNo;
    //return $prefix."-".$divName."-".$proName."-".$year.'-'.$month.'-'.$finalRLPNo;
    return $prefix."-".$divName."-".$year.'-'.$month.'-'.$finalRLPNo;
}  
function get_notesheet_no($prefix="NS", $formater_length=3){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM notesheets_master WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'ENG';
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    $dep    = replace_dashes(getDepartmentNameById($department_id));
    $depName    = mb_substr($dep, 0, 3);
    
    return $prefix."-".$year."-".$month."-".$divName.'-'.$depName.'-'.$finalRLPNo;
}
function get_mcsl_no($prefix="MCSL", $formater_length=3){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM maintenance_cost WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'EEL';
    $depName    = replace_dashes(getDepartmentNameById($department_id));
    
    return $year."-".$month."-".$divName.'-'.$prefix.'-'.$finalRLPNo;
}

function get_invoice_no($prefix="INV", $formater_length=3){
    global $conn;
    
    //$division_id    =   $_SESSION['logged']['branch_id'];
    //$department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    //$office_id      =   $_SESSION['logged']['office_id'];
    //$user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM `rent_invoice` WHERE 1=1";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'EEL';
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    
    return $divName.'-'.$prefix.'-'.$finalRLPNo;
} 

function get_mr_bill_no($prefix="MR", $formater_length=3){
    global $conn;
    
    //$division_id    =   $_SESSION['logged']['branch_id'];
    //$department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    //$office_id      =   $_SESSION['logged']['office_id'];
    //$user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM `rent_bill` WHERE 1=1";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'EEL';
    $depName    = replace_dashes(getDepartmentNameById($department_id));
    
    return $divName.'-'.$prefix.'-'.$finalRLPNo;
}
function get_wo_no($prefix="WO", $formater_length=3){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM workorders_master WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalWoNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    //$divName    = replace_dashes(getDivisionNameById($division_id));
    $divName    = 'ENG';
    //$depName    = replace_dashes(getDepartmentNameById($department_id));
    $dep    = replace_dashes(getDepartmentNameById($department_id));
    $depName    = mb_substr($dep, 0, 3);
    
    return $year."-".$month."-".$divName.'-'.$prefix.'-'.$finalWoNo;
}
function get_rrr_no($prefix="RRR", $formater_length=4){
    global $conn;
    
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $office_id      =   $_SESSION['logged']['office_id'];
    $user_id        =   $_SESSION['logged']['user_id'];
    
    $year       =   date("Y");
    $month      =   date("m");
    $sql        = "SELECT count('id') as total FROM rrr_info WHERE YEAR(created_at) = '$year' AND MONTH(created_at) = $month AND is_delete=0 AND request_division=$division_id AND request_department=$department_id";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    
    $nextRLP    =   $total_row+1;
    $finalRLPNo = sprintf('%0' . $formater_length . 'd', $nextRLP);
    $divName    = replace_dashes(getDivisionNameById($division_id));
    $depName    = replace_dashes(getDepartmentNameById($department_id));
    
    return $prefix."-".$year."-".$month."-".$divName.'-'.$depName.'-'.$finalRLPNo;
}

function replace_dashes($string) {
    $string = str_replace("-", " ", $string);
    return $string;
}
function get_priorities(){
    $table      = 'priority_details';
    $order      = 'ASC';
    $column     = 'show_order';
    $dataType   = 'obj';
    $listData   = getTableDataByTableName($table, $order, $column, $dataType);
    return $listData;
}

function getPriorityName($id){
    global $conn;
    $table  =   "priority_details";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   'Urgent';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getPriorityNameDiv($id){
    global $conn;
    $table  =   "priority_details";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $priority   =   $result->fetch_object();
    ?>    
    <span class="label label-<?php echo $priority->color_code; ?>"><?php echo $priority->name; ?></span>
    <?php }
}
function get_status_color($id){
    global $conn;
    $table  =   "status_details";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   '#FFDB58';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->bg_color;
    }
    return $name;
}
function get_status_name($id){
    global $conn;
    $table  =   "status_details";
    $sql = "SELECT * FROM $table WHERE id=$id";
    $result = $conn->query($sql);
    $name   =   'Pending';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}

function getAllDepartmentHeads($department_id){
    $table  =   "SELECT id,name,branch_id,department_id,office_id FROM users WHERE role_id=3 AND department_id=$department_id";
    $datas  =    getDataRowIdAndTableBySQL($table);
    return $datas;
}
function getAllApprovalBodies(){
    $table  =   "SELECT id,name,branch_id,department_id,office_id FROM users WHERE role_id IN (16,20,21)";
    $datas  =    getDataRowIdAndTableBySQL($table);
    return $datas;
}

function has_rlp_approved($rlp_id){
    global $conn;
    $table  =   "rlp_info";
    $sql = "SELECT * FROM $table WHERE id=$rlp_id";
    $result = $conn->query($sql);
    $is_approved   =   false;
    if ($result->num_rows > 0) {
        $is_approved   =   ($result->fetch_object()->rlp_status == 1 ? true : false);
    }
    return $is_approved;
}
function has_notesheet_approved($notesheet_id){
    global $conn;
    $table  =   "notesheets_master";
    $sql = "SELECT * FROM $table WHERE id=$notesheet_id";
    $result = $conn->query($sql);
    $is_approved   =   false;
    if ($result->num_rows > 0) {
        $is_approved   =   ($result->fetch_object()->notesheet_status == 1 ? true : false);
    }
    return $is_approved;
}

function has_wo_approved($wo_id){
    global $conn;
    $table  =   "workorders_master";
    $sql = "SELECT * FROM $table WHERE `wo_no`='$wo_id'";
    $result = $conn->query($sql);
    $is_approved   =   false;
    if ($result->num_rows > 0) {
        $is_approved   =   ($result->fetch_object()->status == 1 ? true : false);
    }
    return $is_approved;
}

function has_rrr_approved($rrr_id){
    global $conn;
    $table  =   "rrr_info";
    $sql = "SELECT * FROM $table WHERE id=$rrr_id";
    $result = $conn->query($sql);
    $is_approved   =   false;
    if ($result->num_rows > 0) {
        $is_approved   =   ($result->fetch_object()->rrr_status == 1 ? true : false);
    }
    return $is_approved;
}

function rlp_acknowledgement_is_pending($rlp_info_id, $ack_status){
    global $conn;    
    $table      =   "rlp_acknowledgement";
    $ack_status = implode(',', $ack_status);
    $sql        =   "SELECT * FROM $table WHERE rlp_info_id=$rlp_info_id AND ack_status IN($ack_status)";
    $result     =   $conn->query($sql);
    $is_pending =   true;
    if ($result->num_rows > 0) {
        $is_pending =   false;
    }    
    return $is_pending;
}

function rrr_acknowledgement_is_pending($rrr_info_id, $ack_status){
    global $conn;    
    $table      =   "rrr_acknowledgement";
    $ack_status = implode(',', $ack_status);
    $sql        =   "SELECT * FROM $table WHERE rrr_info_id=$rrr_info_id AND ack_status IN($ack_status)";
    $result     =   $conn->query($sql);
    $is_pending =   true;
    if ($result->num_rows > 0) {
        $is_pending =   false;
    }    
    return $is_pending;
}

function get_next_rlp_visible_user($rlp_info_id){
    $table  =   "rlp_acknowledgement WHERE rlp_info_id=$rlp_info_id AND ack_status=0 AND is_visible=0 ORDER BY ack_order ASC LIMIT 1";
    $datas  =    getDataRowIdAndTable($table);
    if(isset($datas) && !empty($datas)){
        return $datas->ack_order;
    }
    return false;
}

function set_rlp_visible_for_acknowledge($rlp_info_id){
    $ack_order                 =   get_next_rlp_visible_user($rlp_info_id);
    if($ack_order){
        $table          =   "rlp_acknowledgement";
        $dataParam      =   [
            'ack_request_date'  =>  date('Y-m-d H:i:s'),
            'is_visible'        =>  1
        ];
        $where      =   [
            'ack_order'    =>  $ack_order
        ];
        updateData($table, $dataParam, $where);
    }
}

function set_notesheet_visible_for_acknowledge($notesheet_id){
    $id                 =   get_next_notesheet_visible_user($notesheet_id);
    if($id){
        $table          =   "notesheet_acknowledgement";
        $dataParam      =   [
            'ack_request_date'  =>  date('Y-m-d H:i:s'),
            'is_visible'        =>  1
        ];
        $where      =   [
            'id'    =>  $id
        ];
        updateData($table, $dataParam, $where);
    }
}
function get_next_notesheet_visible_user($notesheet_id){
    $table  =   "notesheet_acknowledgement WHERE notesheet_id=$notesheet_id AND ack_status=0 AND is_visible=0 ORDER BY ack_order ASC LIMIT 1";
    $datas  =    getDataRowIdAndTable($table);
    if(isset($datas) && !empty($datas)){
        return $datas->id;
    }
    return false;
}

function get_next_rrr_visible_user($rrr_info_id){
    $table  =   "rrr_acknowledgement WHERE rrr_info_id=$rrr_info_id AND ack_status=0 AND is_visible=0 ORDER BY ack_order ASC LIMIT 1";
    $datas  =    getDataRowIdAndTable($table);
    if(isset($datas) && !empty($datas)){
        return $datas->id;
    }
    return false;
}
function set_rrr_visible_for_acknowledge($rrr_info_id){
    $id                 =   get_next_rrr_visible_user($rrr_info_id);
    if($id){
        $table          =   "rrr_acknowledgement";
        $dataParam      =   [
            'ack_request_date'  =>  date('Y-m-d H:i:s'),
            'is_visible'        =>  1
        ];
        $where      =   [
            'id'    =>  $id
        ];
        updateData($table, $dataParam, $where);
    }
}

function loadPageAccessPageBody($pagedetails){ ?>
    <?php
        if (isset($pagedetails) && !empty($pagedetails)) {
            foreach ($pagedetails as $data) {
                $data   =   (array)$data;
                ?>
                <tr>
                    <td style="text-align: right;"><?php echo $data['name']; ?></td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="add[]" value="<?php echo $data['page_id'] ?>" <?php if ($data['add']) { ?> checked <?php } ?>>
                            </label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="edit[]" value="<?php echo $data['page_id'] ?>" <?php if ($data['edit']) { ?> checked <?php } ?>></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="delete[]" value="<?php echo $data['page_id'] ?>" <?php if ($data['delete']) { ?> checked <?php } ?>></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="view[]" value="<?php echo $data['page_id'] ?>" <?php if ($data['view']) { ?> checked <?php } ?>></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="print[]" value="<?php echo $data['page_id'] ?>" <?php if ($data['print']) { ?> checked <?php } ?>></label>
                        </div>
                    </td>
                </tr>
                <?php
            }
        }
}
function loadDefaultPageAccessPageBody(){ ?>
    <?php
        $table = "page_details";
        $order = "ASC";
        $column = "show_order";
        $pagedetails = getTableDataByTableName($table, $order, $column);
        if (isset($pagedetails) && !empty($pagedetails)) {
            foreach ($pagedetails as $data) {
                ?>
                <tr>
                    <td style="text-align: right;"><?php echo $data->name ?></td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="add[]" value="<?php echo $data->id; ?>">
                            </label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="edit[]" value="<?php echo $data->id; ?>"></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="delete[]" value="<?php echo $data->id; ?>"></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="view[]" value="<?php echo $data->id; ?>"></label>
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <div class="checkbox">
                            <label><input type="checkbox" name="print[]" value="<?php echo $data->id; ?>"></label>
                        </div>
                    </td>
                </tr>
                <?php
            }
        }
}
function get_rlp_item_details($rlp_details){   
    $rlp_info       =   $rlp_details['rlp_info'];
    $rlp_details    =   $rlp_details['rlp_details'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
            <h2 class="page-header">
                <i class="fa fa-globe"></i> RLP Details.
                <small class="pull-right">Priority: <?php echo getPriorityName($rlp_info->priority) ?></small>
            </h2>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
        <div class="col-sm-8 invoice-col">
            From
            <address>
                <strong>Name:&nbsp;<?php echo $rlp_info->request_person ?></strong><br>
                Designation:&nbsp;<?php echo $rlp_info->designation ?><br>
                Department:&nbsp;<?php echo getNameByIdAndTable("department",$rlp_info->request_department) ?><br>
                Contact:&nbsp;<?php echo $rlp_info->contact_number ?><br>
                Email:&nbsp;Email: <?php echo $rlp_info->email ?>
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
            <div class="pull-right">
                <b>RLP NO: &nbsp;<span class="rlpno_style"><?php echo $rlp_info->rlp_no ?></span></b><br>
                <b>Request Date:</b> <?php echo human_format_date($rlp_info->created_at) ?><br>
            </div>            
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
    <div class="row">
        <div class="col-xs-12 table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Item Description</th>
                        <th>Purpose of Purchase</th>
                        <th>Quantity</th>
                        <th>Estimated Price</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sl =   1;
                        foreach($rlp_details as $data){
                    ?>
                    <tr>
                        <td><?php echo $sl++; ?></td>
                        <td><?php echo $data->item_des; ?></td>
                        <td><?php echo $data->purpose; ?></td>
                        <td><?php echo $data->quantity; ?></td>
                        <td><?php echo $data->estimated_price; ?></td>
                    </tr>
                        <?php } ?>
                </tbody>
            </table>
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->
<div class="clearfix"></div>
<?php }
function get_rrr_item_details($rrr_details){   
    $rrr_info       =   $rrr_details['rrr_info'];
    //$rrr_remarks    =   $rrr_details['rrr_remarks_history'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
			<table class="table table-bordered">
				<tr>
					<td class="">Recruitement Request No: <?php echo $rrr_info->rrr_no; ?></td>
					<td class="">Recruitement For: <?php echo getDesignationNameById($rrr_info->req_designation); ?>/<?php echo getDivisionNameById($rrr_info->request_division); ?></td>
					<td class="">Priority: <?php echo getPriorityName($rrr_info->priority) ?></td>
				</tr>
			</table>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <!-- /.row -->

    <!-- Table row -->
    <div class="box-footer box-comments">
        <?php
        $table = "rrr_remarks_history WHERE rrr_info_id=$rrr_info->id";
        $order = 'DESC';
        $column = 'remarks_date';
        $allRemarksHistory = getTableDataByTableName($table, $order, $column);
        if (isset($allRemarksHistory) && !empty($allRemarksHistory)) {
            foreach ($allRemarksHistory as $dat) {
                ?>
                <div class="box-comment">
                  <div class="comment-text" style="margin-left: 0;">
                      <span class="username">
                        By <?php echo getUserNameByUserId($dat->user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($dat->remarks_date) ?></span>
                      </span><!-- /.username -->
                  <?php echo $dat->remarks ?>
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
                <?php
            } // foreach
        }
            ?>
            <div class="box-comment">
                <div class="comment-text" style="margin-left: 0;">
                    <span class="username">
                        By <?php echo getUserNameByUserId($rrr_info->rrr_user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($rrr_info->created_at) ?></span>
                    </span><!-- /.username -->
                    <?php echo $rrr_info->user_remarks ?>
                </div>
                <!-- /.comment-text -->
            </div>
			<form id="rrr_dh_update_form">


				<input type="hidden" name="acknowledgement" value="<?php echo $rrr_info->rrr_status; ?>">			
				<div class="form-group">
					<label for="comment">Comments:</label>
					<textarea class="form-control" rows="5" id="remarks" name="remarks"></textarea>
				</div>
				<input type="hidden" name="rrr_info_id" value="<?php echo $rrr_info->id; ?>">
				<input type="hidden" name="created_by" value="<?php echo $rrr_info->rrr_user_id; ?>">
				<button type="button" class="btn btn-primary btn-block" onclick="execute_rrr_dh_update_form('rrr_dh_update_form', 'rrr_dh_update_execute');">Update</button>
			</form>
        </div>
    <!-- /.row -->
</section>
<!-- /.content -->
<div class="clearfix"></div>
<?php }
function get_notesheet_details($rrr_details){   
    $rrr_info       =   $rrr_details['rrr_info'];
    //$rrr_remarks    =   $rrr_details['rrr_remarks_history'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
			<table class="table table-bordered">
				<tr>
					<td class="">Notesheet No: <?php echo $rrr_info->rrr_no; ?></td>
					<td class="">Notesheet For: <?php echo getDesignationNameById($rrr_info->req_designation); ?>/<?php echo getDivisionNameById($rrr_info->request_division); ?></td>
					<td class="">Notesheet: <?php echo getPriorityName($rrr_info->priority) ?></td>
				</tr>
			</table>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <!-- /.row -->

    <!-- Table row -->
    <div class="box-footer box-comments">
        <?php
        $table = "notesheet_remarks_history WHERE rrr_info_id=$rrr_info->id";
        $order = 'DESC';
        $column = 'remarks_date';
        $allRemarksHistory = getTableDataByTableName($table, $order, $column);
        if (isset($allRemarksHistory) && !empty($allRemarksHistory)) {
            foreach ($allRemarksHistory as $dat) {
                ?>
                <div class="box-comment">
                  <div class="comment-text" style="margin-left: 0;">
                      <span class="username">
                        By <?php echo getUserNameByUserId($dat->user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($dat->remarks_date) ?></span>
                      </span><!-- /.username -->
                  <?php echo $dat->remarks ?>
                </div>
                <!-- /.comment-text -->
              </div>
              <!-- /.box-comment -->
                <?php
            } // foreach
        }
            ?>
            <div class="box-comment">
                <div class="comment-text" style="margin-left: 0;">
                    <span class="username">
                        By <?php echo getUserNameByUserId($rrr_info->rrr_user_id); ?>
                        <span class="text-muted pull-right"> at <?php echo human_format_date($rrr_info->created_at) ?></span>
                    </span><!-- /.username -->
                    <?php echo $rrr_info->user_remarks ?>
                </div>
                <!-- /.comment-text -->
            </div>
			<form id="rrr_dh_update_form">


				<input type="hidden" name="acknowledgement" value="<?php echo $rrr_info->rrr_status; ?>">			
				<div class="form-group">
					<label for="comment">Comments:</label>
					<textarea class="form-control" rows="5" id="remarks" name="remarks"></textarea>
				</div>
				<input type="hidden" name="rrr_info_id" value="<?php echo $rrr_info->id; ?>">
				<input type="hidden" name="created_by" value="<?php echo $rrr_info->rrr_user_id; ?>">
				<button type="button" class="btn btn-primary btn-block" onclick="execute_notesheet_dh_update_form('rrr_dh_update_form', 'notesheet_dh_update_execute');">Update</button>
			</form>
        </div>
    <!-- /.row -->
</section>
<!-- /.content -->
<div class="clearfix"></div>
<?php }
function get_rlp_chain_assign_user_view($data){
    $users      =   $data['users'];
    $formType   =   $data['formType'];
    if (isset($users) && !empty($users)){
        if($formType  != 'access_form'){
            foreach ($users as $data) {            
                include '../partial/rlp_chain_assign_user_common_checkbox_view.php';
            }
        }else{
            include '../partial/department_users_dropdown.php';
        } ?>
    <?php }else{ ?>
        <div class="alert alert-warning">
            <strong>Warning!</strong> No user found with the Division And Department.
      </div>
<?php }
}
/* function get_user_department_wise_rlp_chain_for_create(){
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rlp_chain_for_form.php';
} */
function get_type_wise_rlp_chain_for_create($division_id,$department_id,$type){
    /* $division_id    =   $_POST['division'];
    $department_id  =   $_POST['department'];
    $type  			=   $_POST['type']; */
	$division_id    =   $division_id;
    $department_id  =   $department_id;
    $type  			=   $type;
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id"
            . " AND rlp_type=$type";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rlp_chain_for_form.php';
}
function get_user_department_wise_rlp_chain_for_create($division_id,$department_id){
    $division_id    =   $_POST['division'];
    $department_id  =   $_POST['department'];
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rlp_chain_for_form.php';
}

function get_user_project_wise_equips_rlp_chain_for_create(){
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $project_id  =   $_SESSION['logged']['project_id'];
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id"
            . " AND project_id=$project_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/equips_rlp_chain_for_form.php';
}

function get_user_project_wise_rlp_chain_for_create(){
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $project_id  =   $_SESSION['logged']['project_id'];
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id"
            . " AND project_id=$project_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rlp_chain_for_form.php';
}

function get_user_project_wise_rental_rlp_chain_for_create(){
    $project_id  =   '23';
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND project_id=$project_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rental_rlp_chain_for_form.php';
}

function get_user_wise_notesheet_chain_for_create(){
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $table          =   "notesheet_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/notesheet_chain_for_form.php';
}

function get_user_department_wise_rrr_chain_for_create(){
    $division_id    =   $_SESSION['logged']['branch_id'];
    $department_id  =   $_SESSION['logged']['department_id'];
    $table          =   "rlp_access_chain"
            . " WHERE chain_type='default'"
            . " AND division_id=$division_id"
            . " AND department_id=$department_id";
    $defaultChain       =   getDataRowIdAndTable($table);
    $defaultChainUsers  =   (isset($defaultChain) && !empty($defaultChain) ? json_decode($defaultChain->users) : "");
    include 'partial/rrr_chain_for_form.php';
}

function is_password_changed(){
    if($_SESSION['logged']['is_password_changed']){
        return true;
    }else{
        return false;
    }
}

function get_role_group($name){
    $table  = "roles_group WHERE name = '$name'";
    $res    = getDataRowIdAndTable($table);
    $details    = json_decode($res->details);
    return $details;
}

function get_noteshet_role_group($name){
    $table  = "notesheet_roles_group WHERE name = '$name'";
    $res    = getDataRowIdAndTable($table);
    $details    = json_decode($res->details);
    return $details;
}

function get_division_select_box(){
    include 'partial/division_select_box.php';
}
function get_department_select_box(){
    include 'partial/department_select_box.php';
}
function get_supplier_id($prefix="SUP", $formater_length=4){
    global $conn;
    $sql        = "SELECT count('id') as total FROM suppliers";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    $nextsupplier    =   $total_row+1;
    $finalsupplierid = sprintf('%0' . $formater_length . 'd', $nextsupplier);
    return $prefix."-".$finalsupplierid;
}
function get_candidate_id($prefix="CAN", $formater_length=4){
    global $conn;
    $sql        = "SELECT count('id') as total FROM candidates";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    $nextsupplier    =   $total_row+1;
    $finalsupplierid = sprintf('%0' . $formater_length . 'd', $nextsupplier);
    return $prefix."-".$finalsupplierid;
}
function get_interview_id($prefix="INT", $formater_length=4){
    global $conn;
    $sql        = "SELECT count('id') as total FROM interviews";
    $result     = $conn->query($sql);
    $total_row  =   $result->fetch_object()->total;
    $nextsupplier    =   $total_row+1;
    $finalsupplierid = sprintf('%0' . $formater_length . 'd', $nextsupplier);
    return $prefix."-".$finalsupplierid;
}

function buildTreeCateogy(array $category_resize_data, $parentId = 0) {
    $branch = [];

    foreach ($category_resize_data as $element) {
        
        if ($element['parent_id'] == $parentId) {
            $children = buildTreeCateogy($category_resize_data, $element['id']);
            if ($children) {
                $element['children'] = $children;
            }
            $branch[] = $element;
        }
    }

    return $branch;
}


function category_tree(){
    global $conn;
    $category_resize_data  =   [];
    $sql = "SELECT * FROM inv_materialcategorysub order by _order ASC";
    $result_cat = $conn->query($sql);
    while ($row = $result_cat->fetch_assoc()) {
        $category_resize_data[] = $row;
    }

    $data =  buildTreeCateogy($category_resize_data);
    return $data;
}
function getTableDataListByTableName($sql) {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT $sql";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getTableDataByTableNameRlp($table, $order = 'asc', $column='name', $dataType = 'obj') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getTableDataByTableName($table, $order = 'DESC', $column='id', $dataType = '') {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table order by $column $order";
    $result = $conn->query($sql);

    // print_r($table);
    // exit();

    //Part Number Detail table data fetch
    $sql_partno = "SELECT * FROM inv_material_partno_detail WHERE status=0 AND part_no !='' ";
    $partno_result = $conn->query($sql_partno);
    
    $material_key_array=[];
     while ($part_row = $partno_result->fetch_assoc()) {
        $material_key_array[$part_row["inv_material_id"]][]=$part_row["part_no"];
     }



    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
               // print_r($row);
               // exit();
                if($row->id ){
                     $inv_material_id = $row->id;
                    $row->old_part_no = oldPartNumberString($material_key_array,$inv_material_id);
                }
               
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                 if($row["id"]){
                    $inv_material_id = $row["id"];
                    $row["old_part_no"] = oldPartNumberString($material_key_array,$inv_material_id);
                 }

                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}


function check_permission($url){
    $permissin_urls = $_SESSION['logged']['permissin_urls'];
    if(in_array($url, $permissin_urls)){
        return true;
    }else{
        return false;
    }

    

    
}

function oldPartNumberString($material_key_array,$inv_material_id){
        $part_no_string='';
        foreach ($material_key_array as $key => $value) {
            if($key==$inv_material_id){
               $part_no_string= implode(",", $value);
            }
        }
        return $part_no_string;
}
function getwarehouseinfo($table, $order = 'asc', $column = 'id', $dataType = '')
{
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE `short_name` !='CW' order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}
function getTableDataByTableNameWid($table, $order = 'asc', $column = 'id', $dataType = '', $date_filter = [])
{

    //issue_date
    global $conn;
    $warehouse_id    =    (isset($_SESSION['logged']['warehouse_id']) && !empty($_SESSION['logged']['warehouse_id']) ? $_SESSION['logged']['warehouse_id'] : false);
    $dataContainer  =   [];


    if ($warehouse_id) {

        $sql  = "SELECT * FROM $table WHERE warehouse_id=$warehouse_id AND ";
    } else {

        $sql  = "SELECT * FROM $table WHERE ";
    }


    if (isset($date_filter) && !empty($date_filter)) {

        $sql .= "issue_date >= '$date_filter->start_date' AND issue_date <= '$date_filter->end_date' ";
    }
    $sql .= "order by $column $order";

    // echo $sql; exit;

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function getTableDataByTableNameTid($table, $order = 'asc', $column = 'id', $dataType = '')
{
    global $conn;
    $warehouse_id    =    $_SESSION['logged']['warehouse_id'];
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE from_warehouse=$warehouse_id OR to_warehouse=$warehouse_id order by $column $order";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function saveData($table, $dataParam)
{
    global $conn;
    $fields_array   =   array_keys($dataParam);
    $fields         =   implode(',', array_keys($dataParam));
    $values         =   "'" . implode("', '", array_values($dataParam)) . "'";
    $sql            = "INSERT INTO $table ($fields) VALUES ($values)";

    if ($conn->query($sql) === TRUE) {
        $feedbackData   =   [
            'status'    =>  'success',
            'data'      =>  'Data have been successfully inserted',
            'last_id'   =>  $conn->insert_id,
        ];
        return $feedbackData;
    } else {
        $feedbackData   =   [
            'status'    =>  'error',
            'data'      =>  "Error: " . $sql . "<br>" . $conn->error,
            'last_id'   =>  '',
        ];
        return $feedbackData;
    }
}

function getMaterialNameByIdAndTable($table)
{
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->material_description;
    }
    return $name;
}

function getMaterialNameByIdAndTableandId($table,$id)
{
    global $conn;
    $sql = "SELECT * FROM $table WHERE id='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->material_description;
    }
    return $name;
}
function getInvoiceNoByID($id)
{
    global $conn;
    $sql = "SELECT `invoice_no` FROM `rent_invoice` WHERE `id`='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->invoice_no;
    }
    return $name;
}
function getMaterialPartNoByIdAndTableandId($table,$id)
{
    global $conn;
    $sql = "SELECT * FROM $table WHERE id='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->part_no;
    }
    return $name;
}
function getMaterialSpecByIdAndTableandId($table,$id)
{
    global $conn;
    $sql = "SELECT * FROM $table WHERE id='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->spec;
    }
    return $name;
}

function getProjectTypeByID($id)
{
    global $conn;
    $sql = "SELECT * FROM `projects` WHERE `id`='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->type;
    }
    return $name;
}

function getNameByIdAndTable($table,$id)
{
    global $conn;
    $sql = "SELECT * FROM $table WHERE id='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}

function getSupplierNameByIdAndTable($table,$id)
{
    global $conn;
    $sql = "SELECT * FROM $table WHERE id='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->vendor_name;
    }
    return $name;
}

function getEquipmentNameByEELCode($code)
{
    global $conn;
    $sql = "SELECT * FROM `equipments` WHERE `eel_code`='$code'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}

function getItemCodeByParam($table, $field)
{
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->{$field};
    }
    return $name;
}

function getDataRowIdAndTable($table)
{
    global $conn;
    $sql = "SELECT * FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->fetch_object();
    }
}

function getDataRowByTableAndId($table, $id)
{
    global $conn;
    $sql    = "SELECT * FROM $table where id=" . $id;
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->fetch_object();
    } else {
        return false;
    }
}

function getDetailByPriceId($table, $id)
{
    global $conn;
    $sql    = "SELECT * FROM $table where id=$id"  ;
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        return $result->fetch_object();
    } else {
        return false;
    }
}


function getDefaultCategoryCode($table, $fieldName, $modifier, $defaultCode, $prefix)
{
    global $conn;
    $sql    = "SELECT count($fieldName) as total_row FROM $table";
    $result = $conn->query($sql);
    $name   =   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix . sprintf('%' . $modifier, $number);
    return $defaultCode;
}

function getDefaultCategoryCodeByWarehouse($table, $fieldName, $modifier, $defaultCode, $prefix)
{
    global $conn;
    $warehouse_id    =    $_SESSION['logged']['warehouse_id'];
    $sql        = "SELECT count($fieldName) as total_row FROM $table WHERE warehouse_id=$warehouse_id";
    $result     = $conn->query($sql);
    $name       =   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix . sprintf('%' . $modifier, $number);
    return $defaultCode;
}

function getDefaultCategoryCodeByWarehouseT($table, $fieldName, $modifier, $defaultCode, $prefix)
{
    global $conn;
    $warehouse_id    =    $_SESSION['logged']['warehouse_id'];
    //$sql        = "SELECT count($fieldName) as total_row FROM $table WHERE from_warehouse=$warehouse_id";
    $sql        = "SELECT count($fieldName) as total_row FROM $table";
    $result     = $conn->query($sql);
    $name       =   '';
    $lastRows   = $result->fetch_object();
    $number     = intval($lastRows->total_row) + 1;
    $defaultCode = $prefix . sprintf('%' . $modifier, $number);
    return $defaultCode;
}

// function get_product_with_category($graterThanZero=0)
// {
//     $final_array = [];
//     global $conn;
//     $sql = "SELECT * FROM inv_materialcategorysub order by category_description asc";
//     $presult = $conn->query($sql);
//     if ($presult->num_rows > 0) {
//         // output data of each row
//         while ($cat = $presult->fetch_object()) {
//             $parent_id      = $cat->id;
//             $parent_name    = $cat->category_description;
//             $ssql           = "SELECT * FROM inv_materialcategory where category_id=$parent_id order by material_sub_description asc";
//             $sresult        = $conn->query($ssql);
//             if ($sresult->num_rows > 0) {
//                 while ($scat = $sresult->fetch_object()) {
//                     $sub_item_id    = $scat->id;
//                     $sub_item_name  = $scat->material_sub_description;
//                     $msql           = " SELECT * FROM inv_material where 1=1 AND material_id=$parent_id and material_sub_id=$sub_item_id ";
					
// 					if($graterThanZero > 0){
// 						$msql           .=" AND current_balance > 0 ";
// 					}

// 					$msql           .=" order by material_description asc ";
					
//                     $mresult = $conn->query($msql);
					
//                     if ($mresult->num_rows > 0) {
//                         while ($material    = $mresult->fetch_object()) {
//                             $final_array[]  = [
//                                 'id'                    => $material->id,
//                                 'parent_item_id'        => $material->material_id,
//                                 'sub_item_id'           => $material->material_sub_id,
//                                 'item_code'             => $material->material_id_code,
//                                 'part_no'                 => $material->part_no,
//                                 'spec'                     => $material->spec,
//                                 'material_name'         => $material->material_description . ' (' . $parent_name . ' - ' . $sub_item_name . ')',
//                             ];
//                         }
//                     }
//                 }
//             }
//         }
//     }
//     return $final_array;
// }
function get_op_product_with_category($graterThanZero=0)
{
    $final_array = [];
    global $conn;
	$warehouse_id    =    $_SESSION['logged']['warehouse_id'];
    $sql = "SELECT * FROM inv_materialcategorysub order by category_description asc";
    $presult = $conn->query($sql);
    if ($presult->num_rows > 0) {
		while ($cat = $presult->fetch_object()) {
			$parent_id      = $cat->id;
			$parent_name    = $cat->category_description;
			$msql           = " SELECT * FROM `inv_material` WHERE material_id_code NOT in ( SELECT material_id_code FROM `inv_material` a1 INNER JOIN `inv_materialbalance` a2 ON a1.material_id_code=a2.mb_materialid WHERE 1=1 AND a2.mbtype ='OP' AND a2.warehouse_id='$warehouse_id')";
			
			if($graterThanZero <= 0){
				//$msql           .=" AND op_balance_qty <= 0 ";
			}
			$msql           .=" order by material_id_code asc ";
			$mresult = $conn->query($msql);
			
			if ($mresult->num_rows > 0) {
				while ($material    = $mresult->fetch_object()) {
					$final_array[]  = [
						'id'             => $material->id,
						'parent_item_id' => $material->material_id,
						'item_code'      => $material->material_id_code,
						'part_no'        => $material->part_no,
						'spec'           => $material->spec,
						'material_name'  => $material->material_description,
					];
				}
			}
        }
    }
    return $final_array;
}

function get_product_with_category($graterThanZero=0)
{
    $final_array = [];
    global $conn;
    //$sql = "SELECT * FROM inv_materialcategorysub order by category_description asc";
    $sql = "SELECT * FROM inv_materialcategorysub where category_id != '09-00' order by category_description asc";
    $presult = $conn->query($sql);
    if ($presult->num_rows > 0) {
        // output data of each row
        // while ($cat = $presult->fetch_object()) {
        //     $parent_id      = $cat->id;
        //     $parent_name    = $cat->category_description;
        //     $ssql           = "SELECT * FROM inv_materialcategory where category_id=$parent_id order by material_sub_description asc";
        //     $sresult        = $conn->query($ssql);
        //     if ($sresult->num_rows > 0) {
                //while ($scat = $sresult->fetch_object()) {
                while ($cat = $presult->fetch_object()) {
                    $parent_id      = $cat->id;
                    $parent_name    = $cat->category_description;
                    $msql           = " SELECT * FROM inv_material where 1=1 AND material_id=$parent_id ";
                    
                    if($graterThanZero > 0){
                        $msql           .=" AND current_balance > 0 ";
                    }

                    $msql           .=" order by material_description asc ";
                    
                    $mresult = $conn->query($msql);
                    
                    if ($mresult->num_rows > 0) {
                        while ($material    = $mresult->fetch_object()) {
                            $final_array[]  = [
                                'id'             => $material->id,
                                'parent_item_id' => $material->material_id,
                                'item_code'      => $material->material_id_code,
                                'part_no'        => $material->part_no,
                                'spec'           => $material->spec,
                                'material_name'  => $material->material_description . ' (' . $parent_name . ')',
                            ];
                        }
                    }
            //     }
            // }
        }
    }
    return $final_array;
}

function get_conveyance_with_category($graterThanZero=0)
{
    $final_array = [];
    global $conn;
    $sql = "SELECT * FROM inv_materialcategorysub where category_id='09-00' order by category_description asc";
    $presult = $conn->query($sql);
    if ($presult->num_rows > 0) {
        // output data of each row
        // while ($cat = $presult->fetch_object()) {
        //     $parent_id      = $cat->id;
        //     $parent_name    = $cat->category_description;
        //     $ssql           = "SELECT * FROM inv_materialcategory where category_id=$parent_id order by material_sub_description asc";
        //     $sresult        = $conn->query($ssql);
        //     if ($sresult->num_rows > 0) {
                //while ($scat = $sresult->fetch_object()) {
                while ($cat = $presult->fetch_object()) {
                    $parent_id      = $cat->id;
                    $parent_name    = $cat->category_description;
                    $msql           = " SELECT * FROM inv_material where 1=1 AND material_id=$parent_id ";
                    
                    if($graterThanZero > 0){
                        $msql           .=" AND current_balance > 0 ";
                    }

                    $msql           .=" order by material_description asc ";
                    
                    $mresult = $conn->query($msql);
                    
                    if ($mresult->num_rows > 0) {
                        while ($material    = $mresult->fetch_object()) {
                            $final_array[]  = [
                                'id'             => $material->id,
                                'parent_item_id' => $material->material_id,
                                'item_code'      => $material->material_id_code,
                                'part_no'        => $material->part_no,
                                'spec'           => $material->spec,
                                'material_name'  => $material->material_description . ' (' . $parent_name . ')',
                            ];
                        }
                    }
            //     }
            // }
        }
    }
    return $final_array;
}

function isDuplicateData($table, $where, $notWhere=''){
    global $conn;
    $sql='';
    $sql.="SELECT * FROM $table where $where ";
    if(isset($notWhere) && !empty($notWhere)){
        $sql.=" And $notWhere";
    }
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $lastRows   = $result->fetch_object();
        return $lastRows->id;
    }
    return false;
}

// function isDuplicateData($table, $where, $notWhere = '')
// {
//     global $conn;
//     $sql = '';
//     $sql .= "SELECT * FROM $table where $where ";
//     if (isset($notWhere) && !empty($notWhere)) {
//         $sql .= " And $notWhere";
//     }
//     /* echo $sql;
// 	exit; */
//     $result = $conn->query($sql);
//     if ($result->num_rows > 0) {
//         return true;
//     }
//     return false;
// }

function stockReportCheck()
{
    $dataContainer = [];
    global $conn;
    $sql = "SELECT mb_materialid, (SUM(mbin_qty)-SUM(mbout_qty)) as BalanceQty, (SUM(mbin_val)-SUM(mbout_val)) as BalanceVal  FROM `inv_materialbalance` GROUP BY mb_materialid";

    /* $sql = "SELECT mb_materialid, (SUM(mbin_qty)-SUM(mbout_qty)) as BalanceQty, (SUM(mbin_val)-SUM(mbout_val)) as BalanceVal  FROM `inv_materialbalance` WHERE `approval_status`='1' GROUP BY mb_materialid"; */

    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_object()) {
            $dataContainer[] = $row;
        }
    }
    return $dataContainer;
}
function getTotalstockInOutQuantityCheck($mid, $type)
{
    $TOTAL = 0;
    global $conn;
    if ($type    ==  'in') {
        $sql = "SELECT SUM(mbin_qty) as Total  FROM `inv_materialbalance` WHERE mb_materialid='$mid'";
        /* $sql = "SELECT SUM(mbin_qty) as Total  FROM `inv_materialbalance` WHERE mb_materialid='$mid' AND `approval_status`='1'"; */
    }
    if ($type    ==  'out') {
        $sql = "SELECT SUM(mbout_qty) as Total  FROM `inv_materialbalance` WHERE mb_materialid='$mid'";
        /*  $sql = "SELECT SUM(mbout_qty) as Total  FROM `inv_materialbalance` WHERE mb_materialid='$mid' AND `approval_status`='1'"; */
    }
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $TOTAL = $result->fetch_object()->Total;
    }
    return $TOTAL;
}
function get_unit_price_by_material_id($param)
{
    //default value:
    //$unitPrice =   0;
    // opening quantity:
    $lastPrice     =   get_material_last_price($param);
    $lastPricea        =   (isset($lastPrice->price) && !empty($lastPrice->price) ? $lastPrice->price : 0);

    

    $unitPrice     =   $lastPricea;
    return $unitPrice;
}


function get_lot_price_by_material_id($code)
{
    global $conn;
    $project_id     = $_SESSION['logged']['project_id'];
    $warehouse_id   = $_SESSION['logged']['warehouse_id'];
	$sql = "SELECT `id`, `mrr_no`, `material_id`, `receive_details_id`, `qty`, `price`, `status`
	FROM `inv_product_price` WHERE project_id = $project_id AND warehouse_id = $warehouse_id AND material_id = '$code' AND `qty` > 0";
    $result = $conn->query($sql);
	$dataContainer ="<option value=''>-Select-</option>";
	 if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
                $dataContainer .="<option value='".$row["id"]."'>".$row["mrr_no"]."|".$row["qty"]."|".$row["price"]."</option>";
            }
    }
    return $dataContainer;
}
function get_material_last_price($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT material_name,"
        //. " sum(mbin_qty) as openingMbInTotal,"
        //. " sum(mbout_qty) as openingMbOutTotal,"
        //. " mbin_qty, mbin_val,"
        //. " mbout_qty,"
        //. " mbout_val,"
        //. " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " unit_price as price FROM inv_receivedetail WHERE material_id = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " ORDER BY id DESC";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }
    return $rowData;
}
function get_product_stock_by_material_id($param)
{
    //default value:
    $totalStock =   0;
    // opening quantity:
    $opeingQuantityData     =   get_material_balance_opening_quantity($param);
    $openingQuantity        =   (isset($opeingQuantityData->openingMbInTotal) && !empty($opeingQuantityData->openingMbInTotal) ? $opeingQuantityData->openingMbInTotal : 0);

    // recieving quantity:
    $receivingQuantityData  =   get_material_balance_receiving_quantity($param);
    $receivingQuantity      =   (isset($receivingQuantityData->receivingMbInTotal) && !empty($receivingQuantityData->receivingMbInTotal) ? $receivingQuantityData->receivingMbInTotal : 0);

    // issue quantity:
    $issueQuantityData      =   get_material_balance_issue_quantity($param);
    $issueQuantity          =   (isset($issueQuantityData->issueMbOutTotal) && !empty($issueQuantityData->issueMbOutTotal) ? $issueQuantityData->issueMbOutTotal : 0);

    // return quantity:
    $returnQuantityData      =   get_material_balance_return_quantity($param);
    $returnQuantity          =   (isset($returnQuantityData->returnMbInTotal) && !empty($returnQuantityData->returnMbInTotal) ? $returnQuantityData->returnMbInTotal : 0);

    // transfer_out quantity:
    $transfer_outQuantityData      =   get_material_balance_transfer_out_quantity($param);
    $transfer_outQuantity          =   (isset($transfer_outQuantityData->transferOutMbOutTotal) && !empty($transfer_outQuantityData->transferOutMbOutTotal) ? $transfer_outQuantityData->transferOutMbOutTotal : 0);

    // transfer_out quantity:
    $transfer_inQuantityData      =   get_material_balance_transfer_in_quantity($param);
    $transfer_inQuantity          =   (isset($transfer_inQuantityData->transferInMbInTotal) && !empty($transfer_inQuantityData->transferInMbInTotal) ? $transfer_inQuantityData->transferInMbInTotal : 0);

    $totalIn    =   ($openingQuantity + $receivingQuantity + $returnQuantity + $transfer_inQuantity);
    $totalOut   =   ($issueQuantity + $transfer_outQuantity);

    $totalStock     =   $totalIn - $totalOut;
    return $totalStock;
}
/*
 * Method for get opeing total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
 
 
 function getEmployeeNameByOfficeId($table, $id){
    global $conn;
    $sql = "SELECT * FROM $table WHERE `office_id`='$id'";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->name;
    }
    return $name;
}
function getUsersName($table) {
    global $conn;
    $dataContainer  =   [];
    $sql = "SELECT * FROM $table WHERE 1=1 order by name ASC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function get_material_balance_opening_quantity($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as openingMbInTotal,"
        . " sum(mbout_qty) as openingMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='OP'";
    $result = $conn->query($sql);
    if($result){
        if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }else{
        return $rowData;
      }

    }
    
    return $rowData;
}

/*
 * Method for get receiving total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
function get_material_balance_receiving_quantity($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as receivingMbInTotal,"
        . " sum(mbout_qty) as receivingMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='Receive'";
    $result = $conn->query($sql);
    if($result){
        if ($result->num_rows > 0) {
            $rowData = $result->fetch_object();
        }
    }
    return $rowData;
}
/*
 * Method for get return total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
function get_material_balance_return_quantity($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as returnMbInTotal,"
        . " sum(mbout_qty) as returnMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='Return'";
    $result = $conn->query($sql);
    if($result){
    if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }
}
    return $rowData;
}

/*
 * Method for get Issue total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
function get_material_balance_issue_quantity($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as issueMbInTotal,"
        . " sum(mbout_qty) as issueMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='Issue'";
    $result = $conn->query($sql);
    if($result){
    if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }
}
    return $rowData;
}

/*
 * Method for get Transfer Out total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
function get_material_balance_transfer_out_quantity($param)
{
    global $conn;
    $rowData        =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as transferOutMbInTotal,"
        . " sum(mbout_qty) as transferOutMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='Transfer Out'";
    $result = $conn->query($sql);
    if($result){
    if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }

}
    return $rowData;
}

/*
 * Method for get Transfer In total data
 * $param
 * 1. mb_materialid
 * 2. warehouse_id
 */
function get_material_balance_transfer_in_quantity($param)
{
    global $conn;
    $rowData    =   '';
    $mb_materialid  =   $param['mb_materialid'];
    $warehouse_id   =   $param['warehouse_id'];
    $sql            =   "SELECT mb_materialid,"
        . " sum(mbin_qty) as transferInMbInTotal,"
        . " sum(mbout_qty) as transferInMbOutTotal,"
        . " mbin_qty, mbin_val,"
        . " mbout_qty,"
        . " mbout_val,"
        . " mbprice FROM inv_materialbalance WHERE mb_materialid = '$mb_materialid'"
        . " AND warehouse_id='$warehouse_id'"
        /* . " AND `approval_status`='1'" */
        . " AND mbtype='Transfer In'";
    $result = $conn->query($sql);
    if($result){
    if ($result->num_rows > 0) {
        $rowData = $result->fetch_object();
    }
}
    return $rowData;
}

function convertNumberToWords(float $number,$currency)
{
    $decimal = round($number - ($no = floor($number)), 2) * 100;
    $decimal_part = $decimal;
    $hundred = null;
    $hundreds = null;
    $digits_length = strlen($no);
    $decimal_length = strlen($decimal);
    $i = 0;
    $str = array();
    $str2 = array();
    $words = array(0 => '', 1 => 'One', 2 => 'Two',
        3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six',
        7 => 'Seven', 8 => 'Eight', 9 => 'Nine',
        10 => 'Ten', 11 => 'Eleven', 12 => 'Twelve',
        13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen',
        16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
        19 => 'Nineteen', 20 => 'Twenty', 30 => 'Thirty',
        40 => 'Forty', 50 => 'Fifty', 60 => 'Sixty',
        70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety');
    $digits = array('', 'Hundred','Thousand','Lakh', 'Crore');

    while( $i < $digits_length ) {
        $divider = ($i == 2) ? 10 : 100;
        $number = floor($no % $divider);
        $no = floor($no / $divider);
        $i += $divider == 10 ? 1 : 2;
        if ($number) {
            $plural = (($counter = count($str)) && $number > 9) ? '' : null;
            $hundred = ($counter == 1 && $str[0]) ? ' ' : null;
            $str [] = ($number < 21) ? $words[$number].' '. $digits[$counter]. $plural.' '.$hundred:$words[floor($number / 10) * 10].' '.$words[$number % 10]. ' '.$digits[$counter].$plural.' '.$hundred;
        } else $str[] = null;
    }

    $d = 0;
    while( $d < $decimal_length ) {
        $divider = ($d == 2) ? 10 : 100;
        $decimal_number = floor($decimal % $divider);
        $decimal = floor($decimal / $divider);
        $d += $divider == 10 ? 1 : 2;
        if ($decimal_number) {
            $plurals = (($counter = count($str2)) && $decimal_number > 9) ? '' : null;
            $hundreds = ($counter == 1 && $str2[0]) ? ' ' : null;
            @$str2 [] = ($decimal_number < 21) ? $words[$decimal_number].' '. $digits[$decimal_number]. $plural.' '.$hundred:$words[floor($decimal_number / 10) * 10].' '.$words[$decimal_number % 10]. ' '.$digits[$counter].$plural.' '.$hundred;
        } else $str2[] = null;
    }
	$currency = $currency;
	if($currency == 'BDT'){
		$Taka = implode('', array_reverse($str));
		$Paysa = implode('', array_reverse($str2));
		$Paysa = ($decimal_part > 0) ? $Paysa . ' Paysa' : '';
		return ($Taka ? $Taka . 'Taka ' : '') . $Paysa;
	}else{
		$Taka = implode('', array_reverse($str));
		$Paysa = implode('', array_reverse($str2));
		$Paysa = ($decimal_part > 0) ? ' and '.$Paysa . ' Cent' : '';
		return ($Taka ? $Taka . 'Dollar ' : '') . $Paysa;
	}
    
}



function convertNumberToWords2(float $number)
{
    $decimal = round($number - ($no = floor($number)), 2) * 100;
    $decimal_part = $decimal;
    $hundred = null;
    $hundreds = null;
    $digits_length = strlen($no);
    $decimal_length = strlen($decimal);
    $i = 0;
    $str = array();
    $str2 = array();
    $words = array(0 => '', 1 => 'One', 2 => 'Two',
        3 => 'Three', 4 => 'Four', 5 => 'Five', 6 => 'Six',
        7 => 'Seven', 8 => 'Eight', 9 => 'Nine',
        10 => 'Ten', 11 => 'Eleven', 12 => 'Twelve',
        13 => 'Thirteen', 14 => 'Fourteen', 15 => 'Fifteen',
        16 => 'Sixteen', 17 => 'Seventeen', 18 => 'Eighteen',
        19 => 'Nineteen', 20 => 'Twenty', 30 => 'Thirty',
        40 => 'Forty', 50 => 'Fifty', 60 => 'Sixty',
        70 => 'Seventy', 80 => 'Eighty', 90 => 'Ninety');
    $digits = array('', 'Hundred','Thousand','Lakh', 'Crore');

    while( $i < $digits_length ) {
        $divider = ($i == 2) ? 10 : 100;
        $number = floor($no % $divider);
        $no = floor($no / $divider);
        $i += $divider == 10 ? 1 : 2;
        if ($number) {
            $plural = (($counter = count($str)) && $number > 9) ? '' : null;
            $hundred = ($counter == 1 && $str[0]) ? ' ' : null;
            $str [] = ($number < 21) ? $words[$number].' '. $digits[$counter]. $plural.' '.$hundred:$words[floor($number / 10) * 10].' '.$words[$number % 10]. ' '.$digits[$counter].$plural.' '.$hundred;
        } else $str[] = null;
    }

    $d = 0;
    while( $d < $decimal_length ) {
        $divider = ($d == 2) ? 10 : 100;
        $decimal_number = floor($decimal % $divider);
        $decimal = floor($decimal / $divider);
        $d += $divider == 10 ? 1 : 2;
        if ($decimal_number) {
            $plurals = (($counter = count($str2)) && $decimal_number > 9) ? '' : null;
            $hundreds = ($counter == 1 && $str2[0]) ? ' ' : null;
            @$str2 [] = ($decimal_number < 21) ? $words[$decimal_number].' '. $digits[$decimal_number]. $plural.' '.$hundred:$words[floor($decimal_number / 10) * 10].' '.$words[$decimal_number % 10]. ' '.$digits[$counter].$plural.' '.$hundred;
        } else $str2[] = null;
    }
	
		$Taka = implode('', array_reverse($str));
		$Paysa = implode('', array_reverse($str2));
		$Paysa = ($decimal_part > 0) ? ' and '.$Paysa . ' Paysa' : '';
		return ($Taka ? $Taka . 'Taka ' : '') . $Paysa;
	
    
}

function getmaterialbrand()
{
    global $conn;
    $sql = "SELECT brand_name FROM inv_material group by brand_name order by brand_name";
    $result = $conn->query($sql);
    $dataContainer   =   [];
    if ($result->num_rows > 0) {
        // output data of each row
        if (isset($dataType) && $dataType == 'obj') {
            while ($row = $result->fetch_object()) {
                $dataContainer[] = $row;
            }
        } else {
            while ($row = $result->fetch_assoc()) {
                $dataContainer[] = $row;
            }
        }
    }
    return $dataContainer;
}

function updateData($table, $dataParam, $where)
{
    global $conn;
    $valueSets = array();
    foreach ($dataParam as $key => $value) {
        if (isset($value) && !empty($value)) {
            $valueSets[] = $key . " = '" . $value . "'";
        }
    }

    $conditionSets = array();
    foreach ($where as $key => $value) {
        $conditionSets[] = $key . " = '" . $value . "'";
    }
    $sql = "UPDATE $table SET " . join(",", $valueSets) . " WHERE " . join(" AND ", $conditionSets);
    if ($conn->query($sql) === TRUE) {
        $feedbackData   =   [
            'status'    =>  'success',
            'message'   =>  'Data have been successfully Updated',
        ];
    } else {
        $feedbackData   =   [
            'status'    =>  'error',
            'message'   =>  "Error: " . $sql . "<br>" . $conn->error,
        ];
    }
    return $feedbackData;
}

function get_issue_details_data($date_filter)
{

    return getTableDataByTableNameWid('inv_issue', '', 'id', '', $date_filter);
}

function show_issue_details_data($item_details)
{ 
    global $conn;
    ?>

    <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>Issue Date</th>
                <th>Issue No</th>
                <th width="30%">Material Name</th>
                <th>Use in</th>
                <th>Project</th>
                <th>Ware House</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($item_details as $item) {
                if ($item['approval_status'] == 0) {
            ?>
                    <tr style="background-color: #FFC107;max-height:10px;">
                    <?php  } else { ?>
                    <tr style="background-color: #218838;max-height:10px;">
                    <?php  } ?>
                    <td style="width: 100px;"><?php echo date("j M y", strtotime($item['issue_date'])); ?></td>
                    <td style="width: 100px;"><?php echo $item['issue_id']; ?></td>


                    <td><?php
                        $issue_id = $item['issue_id'];
                        $sql = "select * from `inv_issuedetail` where `issue_id`='$issue_id'";
                        $result = mysqli_query($conn, $sql);
                        for ($i = 1; $row = mysqli_fetch_array($result); $i++) {
                            $dataresult =   getDataRowByTableAndId('inv_material', $row['material_name']);
                            echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : '') . ',';
                        }

                        ?></td>
                    <?php
                    $sql = "select * from `inv_issuedetail` where `issue_id`='$issue_id'";


                    $user_categories = mysqli_query($conn, "select `use_in` from `inv_issuedetail` where `issue_id`='$issue_id'");
                    $category_ids = mysqli_fetch_all($user_categories, MYSQLI_NUM);
                    $category_ids_imploded = implode(', ', array_map(function ($entry) {
                        return $entry['0'];
                    }, $category_ids));

                    ?>

                    <td><?php echo $category_ids_imploded; ?></td>
                    <td>
                        <?php
                        $dataresult =   getDataRowByTableAndId('projects', $item['project_id']);
                        echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : '');
                        ?>
                    </td>
                    <td>
                        <?php
                        $dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $item['warehouse_id']);
                        echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : '');
                        ?>
                    </td>
                    <td>
                        <span><a class="action-icons c-approve" href="issue-view.php?no=<?php echo $item['issue_id']; ?>" title="View"><i class="fas fa-eye text-success"></i></a></span>
                        <?php if(check_permission('material-issue-edit')){ ?>
                        <span><a class="action-icons c-delete" href="issue_edit.php?edit_id=<?php echo $item['id']; ?>" title="edit"><i class="fa fa-edit text-info mborder"></i></a></span>
                        <?php } ?>
                       <?php if(check_permission('material-issue-approve')){ ?>
                            <span><a class="action-icons c-delete" href="issue_approve.php?issue=<?php echo $item['issue_id']; ?>" title="approve"><i class="fa fa-check text-info mborder"></i></a></span>
                        <?php } ?>
                         <?php if(check_permission('material-issue-delete')){ ?>
                        <span><a class="action-icons c-delete" href="#" title="delete"><i class="fa fa-trash text-danger"></i></a></span>
                        <?php } ?>
                    </td>
                    </tr>
                <?php } ?>
        </tbody>
    </table>

<?php }
