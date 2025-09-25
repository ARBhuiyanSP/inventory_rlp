<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("rent_bill.id", "rent_bill.bill_no", "rent_bill.challan_no","rent_bill.bill_date", "rent_bill.project_name", "projects.project_name", "rent_bill.amount", "rent_bill.payment_type");

$query = "
 SELECT *,rent_bill.id as voucher_id FROM rent_bill 
 INNER JOIN projects 
 ON projects.id = rent_bill.project_name 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_project_id"]))
{
 $query .= "rent_bill.project_name = '".$_POST["is_project_id"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(rent_bill.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_bill.bill_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_bill.bill_no LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_bill.amount LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR projects.project_name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_bill.payment_type LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY rent_bill.id DESC ';
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

 $sub_array[] = $row["bill_date"];
 $sub_array[] = $row["challan_no"];
 $sub_array[] = $row["bill_no"];
 $sub_array[] = $row["project_name"];
 $sub_array[] = $row["amount"];
 $sub_array[] = $row["payment_type"];
 
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_logsheet_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["transfer_id"];
    
    $view_url = 'mr_view.php?no='.$row["voucher_id"];
    $action = "";
	


						
	$action.='<span><a class="btn btn-sm btn-info" href="'.$view_url.'" title="View"><i class="fas fa-eye"> View</i></a></span>';

	
	
    return $action;

}

function get_allsd_data($conn)
{
 $query = "SELECT * FROM rent_bill";
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