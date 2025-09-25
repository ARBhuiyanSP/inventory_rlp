<?php
//Task Entry:
if (isset($_POST['task_entry']) && !empty($_POST['task_entry'])) {
    $task_assign_date          = (isset($_POST['task_assign_date']) && !empty($_POST['task_assign_date']) ? mysqli_real_escape_string($conn, $_POST['task_assign_date']) : '');
    /*
        *  Update Data Into inv_receive Table:
    */
    $table          = 'tasks';
    if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
        $id             = $_POST['edit_id'];
        $where          = "id!=$id";
    } else {
        $where          = 'id=' . "'$id'";
    }
    if (!isDuplicateData($table, $where)) {
        if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
            $res    =   update_task();
            $_SESSION['success']    =   "Data have been successfully Updated.";
        } else {
            $res    =  tasks_entry();
            $_SESSION['success']    =   "Data have been successfully Saved.";
        }
    } else {
        $_SESSION['error']                  =   "Duplicate data found!.";
    }
    header("location: task_list.php");
    exit();
}
function tasks_entry()
{
    global $conn;
    for($count 		= 0; $count<count($_POST['task_details']); $count++){
        
        $task_assign_date	= (isset($_POST['task_assign_date']) && !empty($_POST['task_assign_date']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_date'])) : date("Y-m-d h:i:s"));
        $task_assign_by_office_id	= (isset($_POST['task_assign_by_office_id']) && !empty($_POST['task_assign_by_office_id']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_by_office_id'])) : '');
        $task_assign_by_name	= (isset($_POST['task_assign_by_name']) && !empty($_POST['task_assign_by_name']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_by_name'])) : '');
        $task_details	= (isset($_POST['task_details'][$count]) && !empty($_POST['task_details'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['task_details'][$count])) : '');
        $project_id	= (isset($_POST['project_id'][$count]) && !empty($_POST['project_id'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'][$count])) : '');
        $working_hrs	= (isset($_POST['working_hrs'][$count]) && !empty($_POST['working_hrs'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['working_hrs'][$count])) : '');        
        $working_mins	= (isset($_POST['working_mins'][$count]) && !empty($_POST['working_mins'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['working_mins'][$count])) : '');        
        $dataParam     =   [
            'task_assign_date'	=>  $task_assign_date,
            'task_details'   	=>  $task_details,
            'project_id'  		=>  $project_id,
            'working_hrs'   	=>  $working_hrs,
            'working_mins'   	=>  $working_mins,
            'priority'   		=>  '2',
            'task_assign_by_office_id'   	=>  $task_assign_by_office_id,
            'task_assign_by_name'   	=>  $task_assign_by_name,
            'task_done_date'   	=>  date('Y-m-d h:i:s', strtotime($task_assign_date)),
            'task_done_by_office_id'   	=>  $task_assign_by_office_id,
            'task_done_by_name'   	=>  $task_assign_by_name,
            'status'   	=>  'Completed',
        ];
    
        saveData("tasks", $dataParam);
    }
}

/// Task Assign/Create
if (isset($_POST['task_assign']) && !empty($_POST['task_assign'])) {
    $task_assign_date          = (isset($_POST['task_assign_date']) && !empty($_POST['task_assign_date']) ? mysqli_real_escape_string($conn, $_POST['task_assign_date']) : '');
    /*
        *  Update Data Into inv_receive Table:
    */
    $table          = 'tasks';
    if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
        $id             = $_POST['edit_id'];
        $where          = "id!=$id";
    } else {
        $where          = 'id=' . "'$id'";
    }
    if (!isDuplicateData($table, $where)) {
        if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
            $res    =   update_task();
            $_SESSION['success']    =   "Data have been successfully Updated.";
        } else {
            $res    =  tasks_assign();
            $_SESSION['success']    =   "Data have been successfully Saved.";
        }
    } else {
        $_SESSION['error']                  =   "Duplicate data found!.";
    }
    header("location: task_list.php");
    exit();
}
function tasks_assign($file_path = "uploads/files/")
{
    global $conn;
    for($count 		= 0; $count<count($_POST['task_details']); $count++){
        
        $task_assign_date	= (isset($_POST['task_assign_date']) && !empty($_POST['task_assign_date']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_date'])) : date("Y-m-d h:i:s"));
		
        $priority	= (isset($_POST['priority']) && !empty($_POST['priority']) ? trim(mysqli_real_escape_string($conn,$_POST['priority'])) : '');
		
        $project_id	= (isset($_POST['project_id']) && !empty($_POST['project_id']) ? trim(mysqli_real_escape_string($conn,$_POST['project_id'])) : '');
		
       $task_assign_by_office_id	= (isset($_POST['task_assign_by_office_id']) && !empty($_POST['task_assign_by_office_id']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_by_office_id'])) : '');
        $task_assign_by_name	= (isset($_POST['task_assign_by_name']) && !empty($_POST['task_assign_by_name']) ? trim(mysqli_real_escape_string($conn,$_POST['task_assign_by_name'])) : '');
		
        $assign_to	= (isset($_POST['assign_to']) && !empty($_POST['assign_to']) ? trim(mysqli_real_escape_string($conn,$_POST['assign_to'])) : '');
		
        $task_details	= (isset($_POST['task_details'][$count]) && !empty($_POST['task_details'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['task_details'][$count])) : '');
		
        $working_hrs	= (isset($_POST['working_hrs'][$count]) && !empty($_POST['working_hrs'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['working_hrs'][$count])) : '');        
        $working_mins	= (isset($_POST['working_mins'][$count]) && !empty($_POST['working_mins'][$count]) ? trim(mysqli_real_escape_string($conn,$_POST['working_mins'][$count])) : '');
		
		$file     =   file_upload($file_path);
		
        $dataParam     =   [
            'task_assign_date'	=>  $task_assign_date,
            'task_details'   	=>  $task_details,
            'project_id'  		=>  $project_id,
            'working_hrs'   	=>  $working_hrs,
            'working_mins'   	=>  $working_mins,
            'priority'   		=>  $priority,
            'task_assign_by_office_id'   	=>  $task_assign_by_office_id,
            'task_assign_by_name'   	=>  $task_assign_by_name,
            'task_done_by_office_id'   	=>  $assign_to,
            'task_done_by_name'   	=>  getEmployeeNameByOfficeId("users",$assign_to),
            'file'   			=>  $file,
            'status'   			=>  'Pending',
        ];
    
        saveData("tasks", $dataParam);
    }
}

function file_upload($file_path){

    if (is_uploaded_file($_FILES['sn_prt_cv']['tmp_name'])) {
        $temp_file = $_FILES['sn_prt_cv']['tmp_name'];
        $file = time() . $_FILES['sn_prt_cv']['name'];
        move_uploaded_file($temp_file, $file_path . $file);
    } else {
        $file = $_POST["sn_prt_cv"];
    }

    return $file;
}
/// Task Update
if (isset($_POST['task_update']) && !empty($_POST['task_update'])) {
    $edit_id          = (isset($_POST['edit_id']) && !empty($_POST['edit_id']) ? mysqli_real_escape_string($conn, $_POST['edit_id']) : '');
    /*
        *  Update Data Into inv_receive Table:
    */
    $table          = 'tasks';
    if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
        $id             = $_POST['edit_id'];
        $where          = "id!=$id";
    } else {
        $where          = 'id=' . "'$id'";
    }
  
        if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
            $res    =   update_task();
            $_SESSION['success']    =   "Data have been successfully Updated.";
        } else {
            $res    =  tasks_entry();
            $_SESSION['success']    =   "Data have been successfully Saved.";
        }
    
    header("location: task_list.php");
    exit();
}
if (isset($_POST['task_complete']) && !empty($_POST['task_complete'])) {
    $edit_id          = (isset($_POST['edit_id']) && !empty($_POST['edit_id']) ? mysqli_real_escape_string($conn, $_POST['edit_id']) : '');
    /*
        *  Update Data Into inv_receive Table:
    */
    $table          = 'tasks';
    if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
        $id             = $_POST['edit_id'];
        $where          = "id!=$id";
    } else {
        $where          = 'id=' . "'$id'";
    }
  
        if (isset($_POST['edit_id']) && !empty($_POST['edit_id'])) {
            $res    =   complete_task();
            $_SESSION['success']    =   "Data have been successfully Updated.";
        } else {
            $res    =  tasks_entry();
            $_SESSION['success']    =   "Data have been successfully Saved.";
        }
    
    header("location: task_list.php");
    exit();
}
function update_task()
{
    global $conn;
    $remarks	= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? mysqli_real_escape_string($conn, $_POST['remarks']) : '');
    $status	= (isset($_POST['status']) && !empty($_POST['status']) ? mysqli_real_escape_string($conn, $_POST['status']) : '');



    $param['fields'] = [
        'remarks'		=>  $remarks,
    ];
    $param['where'] = [
        'id'    =>  $_POST['edit_id']
    ];
    $res     =   updateData('tasks', $param['fields'], $param['where']);
    return $res;
}
function complete_task()
{
    global $conn;
    $remarks	= (isset($_POST['remarks']) && !empty($_POST['remarks']) ? mysqli_real_escape_string($conn, $_POST['remarks']) : '');
    $status	= (isset($_POST['status']) && !empty($_POST['status']) ? mysqli_real_escape_string($conn, $_POST['status']) : '');



    $param['fields'] = [
        'remarks'		=>  $remarks,
        'status'		=>  $status,
    ];
    $param['where'] = [
        'id'    =>  $_POST['edit_id']
    ];
    $res     =   updateData('tasks', $param['fields'], $param['where']);
    return $res;
}
if (isset($_GET['process_type']) && $_GET['process_type'] == "task_delete") {
    include '../connection/connect.php';
    include '../helper/utilities.php';
    $id         =   $_GET['delete_id'];
    $table      =   "tasks";
    $fieldName  =   "id";
    deleteRecordByTableAndId($table, $fieldName, $id);

    $feedback   =   [
        'status'    => "success",
        'message'   => "Data have been successfully deleted",
    ];

    echo json_encode($feedback);
}

if (isset($_GET['process_type']) && $_GET['process_type'] == "task_done") {
    include '../connection/connect.php';
    include '../helper/utilities.php';
    $id         =   $_GET['approve_id'];
    $table      =   "tasks";
    $fieldName  =   "id";
	$task_done_date   	=  date('Y-m-d h:i:s');
    updateStatusByTableAndId($table, $task_done_date, $fieldName, $id);

    $feedback   =   [
        'status'    => "success",
        'message'   => "Data have been successfully updated",
    ];

    echo json_encode($feedback);
}

function getTaskDataByid($id)
{
    $data   = getDataRowByTableAndId("tasks", $id);
    return $data;
}

function getTaskDetailsData($task_id){
    $table      =   "tasks WHERE id=$task_id";
    $task_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "tasks WHERE id=$task_id";
    $task_details   = getTableDataByTableName($table, $order, $column);
    
    $feedbackData   =   [
        'task_info'      =>  $task_info,
        'task_details'   =>  $task_details
    ];
    return $feedbackData;
}

function getTaskDataByDate($todaysdate){
    $table      =   "`tasks` WHERE `task_assign_date`='$todaysdate'";
    $task_info   = getDataRowIdAndTable($table);
    
    $order = 'asc';
    $column='id';
    $table         =   "`tasks` WHERE `task_assign_date`='$todaysdate'";
    $task_details   = getTableDataByTableName($table, $order, $column);
    
    $feedbackData   =   [
        'task_info'      =>  $task_info,
        'task_details'   =>  $task_details
    ];
    return $feedbackData;
}


?>
