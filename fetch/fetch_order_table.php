
<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("orders.id", "orders.sl_no", "orders.receive_date", "orders.delivery_date", "orders.amount", "orders.advance");
$query = "
 SELECT *,orders.id as orders_id FROM orders
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_delivery_date"]))
{
 $query .= "orders.delivery_date = '".$_POST["is_delivery_date"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(orders.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR orders.sl_no LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR orders.receive_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR orders.delivery_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR orders.amount LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR orders.advance LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY orders.id DESC ';
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

 $sub_array[] = $row["sl_no"];
 $sub_array[] = $row["receive_date"];
 $sub_array[] = $row["delivery_date"];
 $sub_array[] = $row["amount"];
 $sub_array[] = $row["advance"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_receive_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["mrr_no"];
    
		  $edit_url = 'receive_edit.php?edit_id='.$row["orders_id"];
	   
    $view_url = 'order-view.php?no='.$row["orders_id"];
    $approve_url = 'receive_approve.php?no='.$row["sl_no"];
    $action = "";
	
if(check_permission('material-receive-edit')){
    $action.='<span><a class="action-icons c-delete" href="'.$edit_url.'" title="edit"><i class="fa fa-edit text-info mborder"></i></a></span>';
}

						
	$action.='<span><a class="action-icons c-approve" href="'.$view_url.'" title="View"><i class="fas fa-eye text-success mborder"></i></a></span>';

if(check_permission('material-receive-approve')){
    $action.='<span><a class="action-icons c-delete" href="'.$approve_url.'" title="edit"><i class="fa fa-check text-info mborder"></i></a></span>';
}
							
							
	
											
    

    return $action;

}

function get_all_data($conn)
{
 $query = "SELECT * FROM orders";
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