<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("tb_logsheet.slno", "tb_logsheet.d_date", "tb_logsheet.equipment_code", "tb_logsheet.project_id", "projects.project_name", "tb_logsheet.workdetails", "tb_logsheet.standby");
$query = "
 SELECT *,tb_logsheet.slno as voucher_id FROM tb_logsheet 
 INNER JOIN projects 
 ON projects.id = tb_logsheet.project_id 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_project_id"]))
{
 $query .= "tb_logsheet.project_id = '".$_POST["is_project_id"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(tb_logsheet.slno LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tb_logsheet.equipment_code LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tb_logsheet.d_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tb_logsheet.workdetails LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR projects.project_name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR tb_logsheet.standby LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY tb_logsheet.slno DESC ';
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

	$actionData     =   get_logsheet_list_action_data($row);
 $sub_array = array();

 $sub_array[] = $row["equipment_code"];
 $sub_array[] = $row["d_date"];
 $sub_array[] = $row["project_name"];
 $sub_array[] = $row["workdetails"];
 $sub_array[] = $row["standby"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_logsheet_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["transfer_id"];
    
    $view_url = 'logsheet_view.php?no='.$row["voucher_id"];
    $action = "";
	


						
	$action.='<span><a class="btn btn-sm btn-info" href="'.$view_url.'" title="View"><i class="fas fa-eye"> View</i></a></span>';

	
	
    return $action;

}

function get_allsd_data($conn)
{
 $query = "SELECT * FROM tb_logsheet";
 $result = mysqli_query($conn, $query);
 return mysqli_num_rows($result);
}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_allsd_data($conn),
 "recordsFiltered" => $number_filter_row,
 "data"    => $data
);

echo json_encode($output);

?>