<?php
//fetch.php
session_start();
include('connection/connect.php');
include 'helper/utilities.php';
$done_by = $_SESSION['logged']['office_id'];

$column = array("tasks.id", "tasks.task_assign_date","tasks.project_id", "tasks.task_details", "projects.project_name", "tasks.status");
$query = "
 SELECT tasks.id,tasks.task_assign_date,tasks.working_hrs,tasks.project_id,tasks.task_assign_by_office_id,tasks.task_assign_by_name,tasks.task_done_by_office_id,tasks.task_done_by_name,projects.project_name,tasks.task_assign_date,tasks.task_details, tasks.status FROM tasks 
 INNER JOIN projects 
 ON projects.id = tasks.project_id
";
$query .= " WHERE ";
if(isset($_POST["is_project"]))
{
	$query .= "tasks.project_id = '".$_POST["is_project"]."' AND tasks.task_done_by_office_id = '".$done_by."' OR tasks.task_assign_by_office_id = '".$done_by."' AND";
}else{ 
	$query .= "tasks.task_done_by_office_id = '".$done_by."' OR tasks.task_assign_by_office_id = '".$done_by."' AND";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(tasks.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_assign_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_details LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR projects.project_name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.working_hrs LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_assign_by_office_id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_assign_by_name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_done_by_office_id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.task_done_by_name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tasks.status LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY tasks.id DESC ';
}

$query1 = '';

if($_POST["length"] != 1)
{
 $query1 .= 'LIMIT ' . $_POST['start'] . ', ' . $_POST['length'];
}

$number_filter_row = mysqli_num_rows(mysqli_query($conn, $query));

$result = mysqli_query($conn, $query . $query1);

$data = array();

while($row = mysqli_fetch_array($result))
{
	$actionData     =   get_task_list_action_data($row);
 $sub_array = array();
 $sub_array[] = $row["task_assign_date"];
 $sub_array[] = $row["task_details"];
 $sub_array[] = $row["project_name"];
 $sub_array[] = $row["task_assign_by_name"];
 $sub_array[] = $row["task_done_by_name"];
 $sub_array[] = $row["status"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_all_data($conn)
{
 $query = "SELECT * FROM tasks";
 $result = mysqli_query($conn, $query);
 return mysqli_num_rows($result);
}

function get_task_list_action_data($row){
    $edit_url = 'task_details.php?id='.$row["id"];
	//$done_by = $_SESSION['logged']['office_id'];
    $action = "";
	if($row["status"]=="Pending"){
		$action.='<span><a title="Take Action" class="btn btn-sm btn-danger" href="'.$edit_url.'">
                                <span class="fa fa-exchange"> <b>Take Action</b></span>
                            </a></span>';
	}else{
    $action.='<span><a title="View Details" class="btn btn-sm btn-success" href="'.$edit_url.'">
                                <span class="fa fa-exchange"> <b>View Details</b></span>
                            </a></span>';
	}
											
    //$action.='<a href="#"><i class="fa fa-trash text-danger"></i></a>';

    return $action;

}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_all_data($conn),
 "recordsFiltered" => $number_filter_row,
"data"    => $data
);

echo json_encode($output);

?>