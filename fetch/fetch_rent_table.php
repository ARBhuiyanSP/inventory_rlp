<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("rents.id", "rents.date","rents.client_name", "rents.project_name", "clients.name", "rents.challan_no", "rents.grandtotal", "rents.due_amount", "rents.status", "rents.bill_status");

$query = "SELECT *,rents.id as voucher_id FROM rents 
			INNER JOIN clients 
			ON clients.id = rents.client_name 
			";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_client_id"]))
	{
		$query .= "rents.client_name = '".$_POST["is_client_id"]."' AND ";
	}
if(isset($_POST["search"]["value"]))
	{
		$query .= '(rents.id LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.challan_no LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.date LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR clients.name LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.grandtotal LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.due_amount LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.status LIKE "%'.$_POST["search"]["value"].'%" ';
		$query .= 'OR rents.bill_status LIKE "%'.$_POST["search"]["value"].'%") ';
	}

if(isset($_POST["order"]))
	{
		$query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
	}
else
	{
		$query .= 'ORDER BY rents.id DESC ';
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

		$actionData     =   get_rent_list_action_data($row);
		$sub_array = array();

		$sub_array[] = $row["challan_no"];
		$sub_array[] = $row["date"];
		$sub_array[] = $row["name"];
		$sub_array[] = $row["grandtotal"];
		$sub_array[] = $row["due_amount"];
		$sub_array[] = $actionData;
		$data[] = $sub_array;
	}

function get_rent_list_action_data($row){
	//$view_url = 'logsheet_view.php?no='.$row["voucher_id"];
	$view_url = 'rent_view.php?id='.$row["voucher_id"];
    $invoice_url = 'rent_invoice.php?id='.$row["challan_no"];
    $gatepass_url = 'rent_gatepass.php?id='.$row["challan_no"];
    $status = $row["status"];
    //$status = $row['status'];
    $bill_status = $row['bill_status'];
    $collection_url = 'mr_create.php?id='.$row["voucher_id"];
    $details_url = 'rent_details.php?id='.$row["challan_no"];
		
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
	 return $action;

}

function get_allrent_data($conn)
	{
		$query = "SELECT * FROM rents";
		$result = mysqli_query($conn, $query);
		return mysqli_num_rows($result);
	}

$output = array(
	 "draw"    => intval($_POST["draw"]),
	 "recordsTotal"  =>  get_allrent_data($conn),
	 "recordsFiltered" => $number_filter_row,
	 "data"    => $data
	);

	echo json_encode($output);

?>