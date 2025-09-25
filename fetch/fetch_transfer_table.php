
<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("inv_transfermaster.id", "inv_transfermaster.transfer_id", "inv_transfermaster.transfer_date", "inv_transfermaster.no_of_material", "inv_transfermaster.transfer_total", "inv_warehosueinfo.name", "inv_transfermaster.status");
$query = "
 SELECT *,inv_transfermaster.id as voucher_id FROM inv_transfermaster 
 INNER JOIN inv_warehosueinfo 
 ON inv_warehosueinfo.id = inv_transfermaster.to_warehouse 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_towarehouse"]))
{
 $query .= "inv_transfermaster.to_warehouse = '".$_POST["is_towarehouse"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(inv_transfermaster.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_transfermaster.transfer_id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_transfermaster.transfer_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_transfermaster.no_of_material LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_transfermaster.transfer_total LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_warehosueinfo.name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_transfermaster.status LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY inv_transfermaster.id DESC ';
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

 $sub_array[] = $row["transfer_id"];
 $sub_array[] = $row["transfer_date"];
 $sub_array[] = $row["name"];
 $sub_array[] = $row["no_of_material"];
 $sub_array[] = $row["transfer_total"];
 $sub_array[] = $row["status"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_receive_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["transfer_id"];
    
	$edit_url = 'receive_edit.php?edit_id='.$row["voucher_id"]; 
    $view_url = 'transfer-view.php?no='.$row["transfer_id"];
    $approve_url = 'transfer_approve.php?no='.$row["voucher_id"];
    $action = "";
	


						
	$action.='<span><a class="btn btn-sm btn-info" href="'.$view_url.'" title="View"><i class="fas fa-eye"> View</i></a></span>';


	
if($row["status"]=='Pending'){
    $action.='<span><a class="btn btn-sm btn-success" href="'.$approve_url.'" title="approve"><i class="fa fa-edit"> Approve</i></a></span>';
}	
	
    return $action;

}

function get_all_data($conn)
{
 $query = "SELECT * FROM inv_transfermaster";
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