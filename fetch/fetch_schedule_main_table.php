
<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("maintenance.id", "maintenance.equipment_id", "maintenance.lastseervice_date", "maintenance.lastservice_hrkm", "maintenance.schedule_hrkm", "inv_warehosueinfo.name", "maintenance.nextservice_date", "maintenance.warehouse_id");
$query = "
 SELECT *,maintenance.id as voucher_id FROM maintenance 
 INNER JOIN inv_warehosueinfo 
 ON inv_warehosueinfo.id = maintenance.warehouse_id 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_towarehouse"]))
{
 $query .= "maintenance.warehouse_id = '".$_POST["is_towarehouse"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(maintenance.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR maintenance.equipment_id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR maintenance.lastseervice_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR maintenance.lastservice_hrkm LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR maintenance.schedule_hrkm LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_warehosueinfo.name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR maintenance.nextservice_date LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY maintenance.id DESC ';
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

	$actionData     =   get_receive_list_action_data($row);
 $sub_array = array();

 $sub_array[] = $row["equipment_id"];
 $sub_array[] = $row["name"];
 $sub_array[] = $row["lastseervice_date"];
 $sub_array[] = $row["lastservice_hrkm"];
 $sub_array[] = $row["schedule_hrkm"];
 $sub_array[] = $row["nextservice_date"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_receive_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["equipment_id"];
    
	$edit_url = 'receive_edit.php?edit_id='.$row["voucher_id"]; 
    $view_url = 'schedule_main_view.php?id='.$row["voucher_id"];
    $approve_url = 'transfer_approve.php?no='.$row["voucher_id"];
    $action = "";
	


						
	$action.='<span><a class="btn btn-sm btn-info" href="'.$view_url.'" title="details"><i class="fas fa-eye"> Details</i></a></span>';

	
	
    return $action;

}

function get_all_data($conn)
{
 $query = "SELECT * FROM maintenance";
 $result = mysqli_query($conn, $query);
 return mysqli_num_rows($result);
}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_all_data($conn),
 "recordsFiltered" => $number_filter_row,
 "data"    => $data
);

echo json_encode($output);

?>