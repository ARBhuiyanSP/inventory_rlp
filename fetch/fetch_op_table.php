
<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
$column = array("inv_op.id", "inv_op.op_no", "inv_op.op_date", "inv_warehosueinfo.name", "inv_op.receive_total");
$query = "
 SELECT *,inv_op.id as voucher_id FROM inv_op 
 INNER JOIN inv_warehosueinfo 
 ON inv_warehosueinfo.id = inv_op.warehouse_id 
";
$query .= " WHERE 1=1 AND  ";
if(isset($_POST["is_warehouse"]))
{
 $query .= "inv_op.warehouse_id = '".$_POST["is_warehouse"]."' AND ";
}
if(isset($_POST["search"]["value"]))
{
 $query .= '(inv_op.id LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_op.op_no LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_op.op_date LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_warehosueinfo.name LIKE "%'.$_POST["search"]["value"].'%" ';
 $query .= 'OR inv_op.receive_total LIKE "%'.$_POST["search"]["value"].'%") ';
}

if(isset($_POST["order"]))
{
 $query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
}
else
{
 $query .= 'ORDER BY inv_op.id DESC ';
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

 $sub_array[] = $row["op_no"];
 $sub_array[] = $row["op_date"];
 $sub_array[] = $row["name"];
 $sub_array[] = $row["no_of_material"];
 $sub_array[] = $row["receive_total"];
 $sub_array[] = $actionData;
 $data[] = $sub_array;
}

function get_receive_list_action_data($row){
	//$edit_url = 'receive_edit.php?edit_id='.$row["op_no"];
    
		  $edit_url = 'receive_edit.php?edit_id='.$row["voucher_id"];
	   
    $view_url = 'op-view.php?no='.$row["op_no"];
    $approve_url = 'receive_approve.php?no='.$row["op_no"];
    $action = "";
	
/* if(check_permission('material-receive-edit')){
    $action.='<span><a class="action-icons c-delete" href="'.$edit_url.'" title="edit"><i class="fa fa-edit text-info mborder"></i></a></span>';
} */

						
	$action.='<span><a class="action-icons c-approve" href="'.$view_url.'" title="View"><i class="fas fa-eye text-success mborder"></i></a></span>';

/* if(check_permission('material-receive-approve')){
    $action.='<span><a class="action-icons c-delete" href="'.$approve_url.'" title="edit"><i class="fa fa-check text-info mborder"></i></a></span>';
} */
							
							
	
											
    

    return $action;

}

function get_all_data($conn)
{
 $query = "SELECT * FROM inv_op";
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