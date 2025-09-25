<?php
//fetch.php
session_start();
include('../connection/connect.php');
include('../helper/utilities.php');
	$column = array("rlp_info.id", "rlp_info.rlp_no", "rlp_info.request_date", "projects.project_name", "rlp_info.totalamount");
	$query = "
	 SELECT *,rlp_info.id as voucher_id FROM rlp_info 
	 INNER JOIN projects 
	 ON projects.id = rlp_info.request_project 
	";
	$query .= " WHERE 1=1 AND rlp_type='Rental' AND ";
	if(isset($_POST["is_projects"]))
		{
			$query .= "rlp_info.request_project = '".$_POST["is_projects"]."' AND ";
		}
	if(isset($_POST["search"]["value"]))
		{
			$query .= '(rlp_info.id LIKE "%'.$_POST["search"]["value"].'%" ';
			$query .= 'OR rlp_info.rlp_no LIKE "%'.$_POST["search"]["value"].'%" ';
			$query .= 'OR rlp_info.request_date LIKE "%'.$_POST["search"]["value"].'%" ';
			$query .= 'OR projects.project_name LIKE "%'.$_POST["search"]["value"].'%" ';
			$query .= 'OR rlp_info.totalamount LIKE "%'.$_POST["search"]["value"].'%") ';
		}

	if(isset($_POST["order"]))
		{
			$query .= 'ORDER BY '.$column[$_POST['order']['0']['column']].' '.$_POST['order']['0']['dir'].' ';
		}
	else
		{
			$query .= 'ORDER BY rlp_info.id DESC ';
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
			$actionData     =   get_rental_rlp_list_action_data($row);
			$sub_array = array();

			$sub_array[] = $row["rlp_no"];
			$sub_array[] = $row["request_date"];
			$sub_array[] = $row["project_name"];
			$sub_array[] = $row["totalamount"];
			$sub_array[] = $actionData;
			$data[] = $sub_array;
		}

	function get_rental_rlp_list_action_data($row){
			$edit_url = 'receive_edit.php?edit_id='.$row["voucher_id"];

			$view_url = 'receive-view.php?no='.$row["rlp_no"];
			$approve_url = 'receive_approve.php?no='.$row["rlp_no"];
			$action = "";
			
		/* if(check_permission('material-receive-edit')){
			$action.='<span><a class="action-icons c-delete" href="'.$edit_url.'" title="edit"><i class="fa fa-edit text-info mborder"></i></a></span>';
		} */

								
			$action.='<span><a class="action-icons c-approve" href="'.$view_url.'" title="View"><i class="fas fa-eye text-success mborder"></i></a></span>';
			return $action;

		}

	function get_all_data($conn)
		{
			$query = "SELECT * FROM rlp_info";
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