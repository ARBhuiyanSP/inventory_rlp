<?php 


if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTablelogsheetList'){
	
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";
  
    
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'd_date',
            1   =>  'equipment_code',
            2   =>  'project_id',
            3   =>  'workdetails',
            4   =>  'runninghrkm',
            5   =>  'closehrkm',
            6   =>  'totalhrkm',
           
            9   =>  'action'
        );  //create column like table in database
                //rlp_utilities.php
    $totalData= getDataRowByTable('tb_logsheet');
    
    $totalFilter=$totalData;
    //Search
    $sql ="SELECT * FROM tb_logsheet WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND d_date Like '%".$request['search']['value']."%' ";
        $sql.=" OR equipment_code Like '%".$request['search']['value']."%' ";
        $sql.=" OR project_id Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_user_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->slno; //id
			
            $subdata[] = (isset($adata->d_date) && !empty($adata->d_date) ? $adata->d_date : 'No data');
            $subdata[] = (isset($adata->equipment_code) && !empty($adata->equipment_code) ? $adata->equipment_code : 'No data');
            $subdata[] = (isset($adata->project_id) && !empty($adata->project_id) ? $adata->project_id : 'No data');
            $subdata[] = (isset($adata->workdetails) && !empty($adata->workdetails) ? $adata->workdetails : 'No data');
            $subdata[] = (isset($adata->runninghrkm) && !empty($adata->runninghrkm) ? $adata->runninghrkm : 'No data');
$subdata[] = (isset($adata->closehrkm) && !empty($adata->closehrkm) ? $adata->closehrkm : 'No data');
$subdata[] = (isset($adata->totalhrkm) && !empty($adata->totalhrkm) ? $adata->closehrkm : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}


function get_user_list_action_data($data){
    $edit_url = 'patient_edit.php?id='.$data->slno;
    $action = "";
    $action.='<span><a class="action-icons c-approve" href="'.$edit_url.'" title="Edit">
        <i class="fas fa-edit text-info"></i>
    </a></span>';

											
    $action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';

    return $action;

}

/////////////////////
if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTableequipmentList'){
	
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";
  
    
   $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'name',
            1   =>  'eel_code',
            2   =>  'capacity',
            3   =>  'makeby',
            4   =>  'model',
            5   =>  'present_location',
            6   =>  'present_condition'
        );  
		//create column like table in database
        //rlp_utilities.php
    $totalData= getDataRowByTable('equipments');
    
    $totalFilter=$totalData;
    //Search
    $sql ="SELECT * FROM equipments WHERE 1=1";
    //$sql ="SELECT equipments.name,equipments.eel_code,equipments.capacity,equipments.makeby,equipments.model, projects.project_name,equipments.present_condition FROM equipments INNER JOIN projects ON equipments.project_id=projects.id WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND name Like '%".$request['search']['value']."%' ";
        $sql.=" OR eel_code Like '%".$request['search']['value']."%' ";
        $sql.=" OR capacity Like '%".$request['search']['value']."%' ";
        $sql.=" OR makeby Like '%".$request['search']['value']."%' ";
        $sql.=" OR model Like '%".$request['search']['value']."%' ";
        $sql.=" OR present_location Like '%".$request['search']['value']."%' ";
        $sql.=" OR present_condition Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_equipment_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->name) && !empty($adata->name) ? $adata->name : 'No data');
            $subdata[] = (isset($adata->eel_code) && !empty($adata->eel_code) ? $adata->eel_code : 'No data');
            $subdata[] = (isset($adata->capacity) && !empty($adata->capacity) ? $adata->capacity : 'No data');
            $subdata[] = (isset($adata->makeby) && !empty($adata->makeby) ? $adata->makeby : 'No data');
            $subdata[] = (isset($adata->model) && !empty($adata->model) ? $adata->model : 'No data');
                /* $dataresult =   getDataRowByTableAndId('projects', $adata->project_id);
            $subdata[] = (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); */

            $subdata[] = (isset($adata->present_location) && !empty($adata->present_location) ? $adata->present_location : 'No data');



$subdata[] = (isset($adata->present_condition) && !empty($adata->present_condition) ? $adata->present_condition : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}


function get_equipment_list_action_data($data){
   $history_url = 'history.php?id='.$data->eel_code;
   $shifting_url = 'equipment_shifting.php?id='.$data->id;
   $view_url = 'equipment_view.php?id='.$data->id;
    $edit_url = 'equipment_edit.php?id='.$data->id;
    $action = "";
    $action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-warning" href="'.$edit_url.'">
                                <span class="fa fa-edit"> <b>Edit</b></span>
                            </a></span>';
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-success" href="'.$view_url.'">
                                <span class="fa fa-edit"> <b>Details</b></span>
                            </a></span>';
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-info" href="'.$shifting_url.'">
                                <span class="fa fa-edit"> <b>Shifting</b></span>
                            </a></span>';
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-success" href="'.$history_url.'">
                                <span class="fa fa-edit"> <b>History</b></span>
                            </a></span>';

    return $action;

}

/***Rlp Approved List***/
/***Rlp Approved List***/
if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTableRlpApproveList'){
    include "../connection/connect.php";
    include "../helper/utilities.php";
    
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'rlp_no',
            1   =>  'request_person',
            2   =>  'rlp_status'
        );  
		//create column like table in database
        //rlp_utilities.php
    $totalData= getDataRowByTable('rlp_info');
    
    $totalFilter=$totalData;
    //Search
    $sql ="SELECT * FROM rlp_info WHERE 1=1";
    //$sql ="SELECT equipments.name,equipments.eel_code,equipments.capacity,equipments.makeby,equipments.model, projects.project_name,equipments.present_condition FROM equipments INNER JOIN projects ON equipments.project_id=projects.id WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND rlp_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR request_person Like '%".$request['search']['value']."%' ";
        $sql.=" OR rlp_status Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_approved_rlp_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->rlp_no) && !empty($adata->rlp_no) ? $adata->rlp_no : 'No data');
            $subdata[] = (isset($adata->request_person) && !empty($adata->request_person) ? $adata->request_person : 'No data');
            $subdata[] = (isset($adata->rlp_status) && !empty($adata->rlp_status) ? get_status_name($adata->rlp_status) : 'No data');
                /* $dataresult =   getDataRowByTableAndId('projects', $adata->project_id);
            $subdata[] = (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); */


            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}


function get_approved_rlp_list_action_data($data){
   $edit_url = 'rlp_update.php?rlp_id='.$data->id;
   $shifting_url = 'equipment_shifting.php?id='.$data->id;
   $view_url = 'equipment_view.php?id='.$data->id;
    $history_url = '#';
    $action = "";
	
	if($data->rlp_status != 1)
	{
    $action.='<span><a title="Edit RLP Data" class="btn btn-sm btn-warning" href="'.$edit_url.'">
                                <span class="fa fa-edit"> <b>Edit</b></span>
	</a></span>'; 
	}
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-success" href="'.$view_url.'">
                                <span class="fa fa-edit"> <b>Details</b></span>
                            </a></span>';
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-info" href="'.$shifting_url.'">
                                <span class="fa fa-edit"> <b>Shifting</b></span>
                            </a></span>';
	$action.='<span><a title="Edit Equipment Data" class="btn btn-sm btn-success" href="'.$history_url.'">
                                <span class="fa fa-edit"> <b>History</b></span>
                            </a></span>';

    return $action;

}
/***Rlp Approved List End***/
/***Rlp Approved List End***/
/////////////////////
if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTablenotesheetsList'){
	
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";
  
    
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'notesheet_no',
            1   =>  'rlp_no',
            2   =>  'supplier_name',
            3   =>  'notesheet_status',
            4   =>  'id'
        );  
		//create column like table in database
        //rlp_utilities.php
    $totalData= getDataRowByTable('notesheets_master');
    
    $totalFilter=$totalData;
    //Search
    $sql ="SELECT * FROM notesheets_master WHERE 1=1 GROUP BY notesheet_no";
    //$sql ="SELECT equipments.name,equipments.eel_code,equipments.capacity,equipments.makeby,equipments.model, projects.project_name,equipments.present_condition FROM equipments INNER JOIN projects ON equipments.project_id=projects.id WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND notesheet_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR rlp_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR supplier_name Like '%".$request['search']['value']."%' ";
        $sql.=" OR notesheet_status Like '%".$request['search']['value']."%' ";
        $sql.=" OR id Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_notesheets_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->notesheet_no) && !empty($adata->notesheet_no) ? $adata->notesheet_no : 'No data');
            $subdata[] = (isset($adata->rlp_no) && !empty($adata->rlp_no) ? $adata->rlp_no : 'No data');
            $subdata[] = (isset($adata->supplier_name) && !empty($adata->supplier_name) ? $adata->supplier_name : 'No data');
            //$subdata[] = (isset($adata->notesheet_status) && !empty($adata->notesheet_status) ? $adata->notesheet_status : 'No data');

            //$subdata[] = (isset($adata->project_id) && !empty($adata->project_id) ? $adata->project_id : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}
function get_notesheets_list_action_data($data){
    $workorder_url = 'create_workorder.php?id='.$data->id;
    $approve_url = 'notesheet_update.php?id='.$data->id;
    $view_url = 'notesheets_view.php?id='.$data->id;
    $action = "";
	$action.='<span><a title="Details View" class="btn btn-sm btn-success" href="'.$view_url.'">
                                <span class="fa fa-eye"> <b> Details</b></span>
                            </a></span>';
	$action.='<span><a title="Approval View" class="btn btn-sm btn-warning" href="'.$approve_url.'">
                                <span class="fa fa-hand"> <b> Approval</b></span>
                            </a></span>';
	if($data->notesheet_status == 1)
	{
	$action.='<span><a title="Make Work Order" class="btn btn-sm btn-info" href="'.$workorder_url.'">
							<span class="fa fa-exchange"> <b> Workorder</b></span>
						</a></span>';
	}	 								
    //$action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';
	
	

    return $action;

}

/////////////////////
if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTableWorkordersList'){
	 session_start(); 
	
	
	global $conn;
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";

  
  
  $warehouse_id 	=   $_SESSION['logged']['warehouse_id'];
	$role_id		=   $_SESSION['logged']['role_id'];    
    $role_name		=   get_role_shortcode_by_role_id($role_id);
	
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'created_at',
            1   =>  'wo_no',
            2   =>  'notesheet_no',
            3   =>  'rlp_no',
            4   =>  'request_warehouse',
            5   =>  'supplier_name'
        );  
		//create column like table in database
        //rlp_utilities.php
    $totalData= getDataRowByTable('workorders_master');
    
    $totalFilter=$totalData;
	 //Search
	if($role_name == 'sa' || $role_name == 'ab'){
		$sql ="SELECT * FROM workorders_master WHERE 1=1";
	}else{
		$sql ="SELECT * FROM workorders_master WHERE 1=1 AND request_warehouse=$warehouse_id";
	}
    //Search
   //$sql ="SELECT * FROM workorders_master WHERE 1=1 AND request_warehouse=$warehouse_id";
    //$sql ="SELECT equipments.name,equipments.eel_code,equipments.capacity,equipments.makeby,equipments.model, projects.project_name,equipments.present_condition FROM equipments INNER JOIN projects ON equipments.project_id=projects.id WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND wo_no Like '%".$request['search']['value']."%' ";
        $sql.=" AND notesheet_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR rlp_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR supplier_name Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
	
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_workorders_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->created_at) && !empty($adata->created_at) ? human_format_date($adata->created_at) : 'No data');
            $subdata[] = (isset($adata->wo_no) && !empty($adata->wo_no) ? $adata->wo_no : 'No data');
            $subdata[] = (isset($adata->notesheet_no) && !empty($adata->notesheet_no) ? $adata->notesheet_no : 'No data');
            $subdata[] = (isset($adata->rlp_no) && !empty($adata->rlp_no) ? $adata->rlp_no : 'No data');
            $subdata[] = (isset($adata->request_warehouse) && !empty($adata->request_warehouse) ? getWarehouseNameById($adata->request_warehouse) : 'No data');
            $subdata[] = (isset($adata->supplier_name) && !empty($adata->supplier_name) ? $adata->supplier_name : 'No data');

            //$subdata[] = (isset($adata->project_id) && !empty($adata->project_id) ? $adata->project_id : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}
function get_workorders_list_action_data($data){
    $view_url = 'workorders_view.php?id='.$data->wo_no;
    $approve_url = 'workorders_approve.php?id='.$data->wo_no;
    $receive_url = 'receive_from_wo.php?id='.$data->wo_no;
    $action = "";
	$action.='<span><a title="Details View" class="btn btn-sm btn-success" href="'.$view_url.'">
                                <span class="fa fa-eye"> <b> Details</b></span>
                            </a></span>';
							
	$action.='<span><a title="Details View" class="btn btn-sm btn-danger" href="'.$receive_url.'">
                                <span class="fa fa-eye"> <b> Receive</b></span>
                            </a></span>';
							
	$action.='<span><a title="Make Work Order" class="btn btn-sm btn-info" href="'.$approve_url.'">
							<span class="fa fa-exchange"> <b> Approval</b></span>
						</a></span>';
	

											
    //$action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';

    return $action;

}

function get_role_shortcode_by_role_id($role_id){
    global $conn;
    $table  = "roles";
    $sql    = "SELECT short_name FROM $table WHERE id=$role_id";
    $result = $conn->query($sql);
    $name   =   '';
    if ($result->num_rows > 0) {
        $name   =   $result->fetch_object()->short_name;
    }
    return $name;
}

///////////////////////

if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTableinsList'){
	
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";
  
    
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'name',
            1   =>  'eel_code',
            2   =>  'capacity',
            3   =>  'makeby',
            4   =>  'model',
            5   =>  'project_id',
            6   =>  'present_condition'
        );  //create column like table in database
                //rlp_utilities.php
    $totalData= getDataRowByTable('equipments');
    
    $totalFilter=$totalData;
    //Search
    $sql ="SELECT * FROM equipments WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND name Like '%".$request['search']['value']."%' ";
        $sql.=" OR eel_code Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    $sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
        $request['start']."  ,".$request['length']."  ";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_ins_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->name) && !empty($adata->name) ? $adata->name : 'No data');
            $subdata[] = (isset($adata->eel_code) && !empty($adata->eel_code) ? $adata->eel_code : 'No data');
            $subdata[] = (isset($adata->capacity) && !empty($adata->capacity) ? $adata->capacity : 'No data');
            $subdata[] = (isset($adata->makeby) && !empty($adata->makeby) ? $adata->makeby : 'No data');
            $subdata[] = (isset($adata->model) && !empty($adata->model) ? $adata->model : 'No data');
			$subdata[] = (isset($adata->project_id) && !empty($adata->project_id) ? $adata->project_id : 'No data');
			$subdata[] = (isset($adata->present_condition) && !empty($adata->present_condition) ? $adata->present_condition : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}


function get_ins_list_action_data($data){
    $edit_url = 'take_inspection.php?id='.$data->id;
    $action = "";
    $action.='<span><a title="Details View" class="btn btn-sm btn-info" href="'.$edit_url.'">
                                <span class="fa fa-exchange"> <b>Take Action</b></span>
                            </a></span>';

											
    //$action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';

    return $action;

}




/////////////////////
if(isset($_GET['process_type']) && $_GET['process_type'] == 'getDataTableRentList'){
	
//getDataTablelogsheetList call from  footer.php var url getDataTablePatientList
    include "../connection/connect.php";
    include "../helper/utilities.php";
  
    
    $request    =   $_REQUEST;
    $col        =   array(
            0   =>  'challan_no',
            1   =>  'name',
            2   =>  'ref_no',
            3   =>  'grandtotal',
            4   =>  'due_amount'
        );  
		//create column like table in database
        //rlp_utilities.php
    $totalData= getDataRowByTable('rents');
    
    $totalFilter=$totalData;
    //Search
    //$sql ="SELECT * FROM rents WHERE 1=1";
    $sql ="SELECT rents.id as voucher_id,rents.challan_no,rents.client_name,rents.ref_no,rents.grandtotal,rents.due_amount,rents.status,rents.bill_status,clients.id,clients.name FROM rents INNER JOIN clients ON rents.client_name=clients.id WHERE 1=1";
    if(!empty($request['search']['value'])){
        $sql.=" AND rents.id Like '%".$request['search']['value']."%' ";
        $sql.=" AND rents.challan_no Like '%".$request['search']['value']."%' ";
        $sql.=" AND clients.name Like '%".$request['search']['value']."%' ";
        $sql.=" OR rents.ref_no Like '%".$request['search']['value']."%' ";
        $sql.=" OR rents.grandtotal Like '%".$request['search']['value']."%' ";
        $sql.=" OR rents.due_amount Like '%".$request['search']['value']."%' ";
        $sql.=" OR rents.bill_status Like '%".$request['search']['value']."%' ";
        $sql.=" OR rents.status Like '%".$request['search']['value']."%' ";
  
    }

    $totalData=getTotalRowBySQL($sql);
    //Order
    //$sql.=" ORDER BY ".$col[$request['order'][0]['column']]."   ".$request['order'][0]['dir']."  LIMIT ".
    $sql.=" ORDER BY rents.id DESC  LIMIT ".
        $request['start']."  ,".$request['length']."";
    
    $userData   = getDataRowIdAndTableBySQL($sql);
    
    $data=[];
    
    
    $slno   =   1;
    if (isset($userData) && !empty($userData)) {
        foreach ($userData as $adata) {
            $actionData     =   get_rent_list_action_data($adata);

           
            $subdata = array();
            $subdata[] = $adata->id; //id
			
            $subdata[] = (isset($adata->challan_no) && !empty($adata->challan_no) ? $adata->challan_no : '');
            $subdata[] = (isset($adata->name) && !empty($adata->name) ? $adata->name : '');
            $subdata[] = (isset($adata->ref_no) && !empty($adata->ref_no) ? $adata->ref_no : '');
            $subdata[] = (isset($adata->grandtotal) && !empty($adata->grandtotal) ? $adata->grandtotal : '');
            $subdata[] = (isset($adata->due_amount) && !empty($adata->due_amount) ? $adata->due_amount : '');

            //$subdata[] = (isset($adata->project_id) && !empty($adata->project_id) ? $adata->project_id : 'No data');

            $subdata[] = $actionData;
            $data[] = $subdata;
        }
    }
    $json_data=array(
        "draw"              =>  intval($request['draw']),
        "recordsTotal"      =>  intval($totalData),
        "recordsFiltered"   =>  intval($totalFilter),
        "data"              =>  $data
    );
    
    echo json_encode($json_data);


}
function get_rent_list_action_data($data){
    $view_url = 'rent_view.php?id='.$data->voucher_id;
    $gatepass_url = 'rent_gatepass.php?id='.$data->challan_no;
    $invoice_url = 'rent_invoice.php?id='.$data->challan_no;
    $status = $data->status;
    $bill_status = $data->bill_status;
    $collection_url = 'mr_create.php?id='.$data->voucher_id;
    $details_url = 'rent_details.php?id='.$data->challan_no;
    //$extend_url = 'extend_date.php?id='.$data->challan_no;
    //$approve_url = 'workorders_approve.php?id='.$data->challan_no;
    //$receive_url = 'receive_from_wo.php?id='.$data->challan_no;
    $action = "";
							
	$action.='<span><a title="Details View" class="btn btn-sm btn-success" href="'.$gatepass_url.'">
                                <span class="fa fa-eye"> <b> Gatepass</b></span>
       
                     </a></span>';
	
	if($status == 'Rented'){
		$action.='<a title="Collection" class="btn btn-sm btn-danger" href="'.$details_url.'">
									<i class="fa fa-money"> Return/Extend</i>
								</a>';	
	}
			
		
	
	if($bill_status != 'Paid'){						
	$action.='<a title="Collection" class="btn btn-sm btn-warning" href="'.$collection_url.'">
                                <i class="fa fa-money"> Collection</i>
                            </a>';
							
	}										
    //$action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';

    return $action;

}
?>