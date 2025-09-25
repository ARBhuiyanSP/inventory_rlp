<?php 
session_start();  
include '../helper/utilities.php';
include '../includes/user_process.php';
include '../function/user_management.php';
include '../includes/login_process.php';
 $conn = mysqli_connect("localhost", "root", "", "eel_equipment");  
 if(!empty($_POST))  
 {  
      $output = '';  
      $message = '';  
      $eel_code = mysqli_real_escape_string($conn, $_POST["ex_eel_code"]);  
      $return_date =mysqli_real_escape_string($conn, $_POST["return_date"]);  
      $ex_return_date = mysqli_real_escape_string($conn, $_POST["ex_return_date"]);  
      $ex_amount = mysqli_real_escape_string($conn, $_POST["ex_amount"]);  
      $ex_client_name = mysqli_real_escape_string($conn, $_POST["ex_client_name"]);  
      $ex_project_name = mysqli_real_escape_string($conn, $_POST["ex_project_name"]); 

			$return_dateCount = strtotime(mysqli_real_escape_string($conn, $_POST["return_date"]));  
			$ex_return_dateCount = strtotime(mysqli_real_escape_string($conn, $_POST["ex_return_date"])); 
			$days =  $ex_return_dateCount - $return_dateCount;
			$ex_days =  round($days / (60 * 60 * 24)); 
			
		$created_at		=  date('Y-m-d h:i:s');
		$created_by		=  $_SESSION['logged']['user_id'];	
      if($_POST["id"] != '')  
      {  
			$query = "UPDATE `rent_details` SET `extended_date`='$ex_return_date',`total_days`= `total_days` + '$ex_days',`amount`= `amount` + '$ex_amount' WHERE `id`='".$_POST["id"]."'";
			$conn->query($query);
			
			$query5 = "UPDATE `rents` SET `total_rent_amount`= `total_rent_amount` + '$ex_amount',`grandtotal`= `grandtotal` + '$ex_amount',`due_amount`= `due_amount` + '$ex_amount',`bill_status`='Pending' WHERE `challan_no`='".$_POST["ex_challan_no"]."'";
			$conn->query($query5);
		   
			$query2 = "insert into `rent_history` values('', '".$_POST["ex_challan_no"]."','".$_POST["id"]."','".$_POST["ex_eel_code"]."','$return_date','$ex_return_date','$ex_amount','Rented')";
			$conn->query($query2);
			
			/* $query3 = "insert into `client_balance` values('', '".$_POST["ex_challan_no"]."', '$ex_return_date', '$ex_client_name', '$ex_project_name', '', '$ex_amount', '', '', '', '', '', '', '$created_at', '$created_by', '', '')";
			$conn->query($query3); */
				
           $message = 'Data Updated';  
      }  
      else  
      {  
            
           $message = 'Data Inserted';  
      }  
      //if(mysqli_query($conn, $query))  
      //{  
           $output .= '<center><h5 class="text-success">' . $message . '</h5></center>';  
           $select_query = "SELECT * FROM rent_details WHERE id='".$_POST["id"]."'";  
           $result = mysqli_query($conn, $select_query);  
           $output .= '  
                <table class="table table-bordered">  
                     <tr>  
                          <th>EEL Code</th>  
                          <th style="width:10%;">Rent Date</th>  
                          <th style="width:10%;">Return Date</th>  
                          <th style="width:20%;text-align:right;">Action</th>  
                     </tr>  
           ';  
           while($row = mysqli_fetch_array($result))  
           {  
                $output .= '  
                     <tr>  
                          <td>' . $row["eel_code"] . '</td>  
                          <td>' . $row["rent_date"] . '</td>  
                          <td>' . $row["return_date"] . '</td>  
                          <td style="text-align:right;">
							<input type="button" name="edit" value="Extend Date" id="'.$row["id"] .'" class="btn btn-danger btn-sm edit_data" />
							<input type="button" name="view" value="Return" id="' . $row["id"] . '" class="btn btn-success btn-sm view_data" />
							</td>  
                     </tr>  
                ';  
           }  
           $output .= '</table>';  
      //}  
      echo $output;  
 }  
 ?>