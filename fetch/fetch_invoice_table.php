<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("rent_invoice.id", "rent_invoice.invoice_no", "rent_invoice.invoice_date", "rent_invoice.client_name", "clients.name", "rent_invoice.amount","rent_invoice.deposit_amount", "rent_invoice.due_amount");

$query = "
 SELECT *,rent_invoice.id as voucher_id FROM rent_invoice 
 INNER JOIN clients 
 ON clients.id = rent_invoice.client_name 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_client_id"]))
{
 $query .= "rent_invoice.client_name = '".$_POST["is_client_id"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(rent_invoice.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_invoice.invoice_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_invoice.invoice_no LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_invoice.amount LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR clients.name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_invoice.deposit_amount LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR rent_invoice.due_amount LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY rent_invoice.id DESC ';
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

	$actionData     =   get_invoice_list_action_data($row);
 $sub_array = array();

 $sub_array[] = $row["invoice_date"];
 $sub_array[] = $row["invoice_no"];
 $sub_array[] = $row["name"];
 $sub_array[] = $row["amount"];
 $sub_array[] = $row["deposit_amount"];
 $sub_array[] = $row["due_amount"];
 
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_invoice_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["transfer_id"];
    
    $view_url = 'bill_view.php?no='.$row["voucher_id"];
    $collection_url = 'mr_create.php?no='.$row["voucher_id"];
    $action = "";
	


						
	$action.='<span><a class="btn btn-sm btn-info" href="'.$view_url.'" title="View"><i class="fas fa-eye"> View</i></a></span>';
	$action.='<span><a class="btn btn-sm btn-success" href="'.$collection_url.'" title="Collection"><i class="fas fa-money"> Collection</i></a></span>';

	
	
    return $action;

}

function get_allinvoice_data($conn)
{
 $query = "SELECT * FROM rent_invoice";
 $result = mysqli_query($conn, $query);
 return mysqli_num_rows($result);
}

$output = array(
 "draw"    => intval($_POST["draw"]),
 "recordsTotal"  =>  get_allinvoice_data($conn),
 "recordsFiltered" => $number_filter_row,
 "data"    => $data
);

echo json_encode($output);

?>