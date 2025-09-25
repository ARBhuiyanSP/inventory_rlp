<?php  
include '../helper/utilities.php';
 $conn = mysqli_connect("localhost", "root", "", "eel_equipment");  
 if(!empty($_POST))  
 {  
    $output = '';  
    $message = '';  
    $eel_code = mysqli_real_escape_string($conn, $_POST["eel_code"]); 
    $rent_date = mysqli_real_escape_string($conn, $_POST["rent_date"]); 
    $project_name = mysqli_real_escape_string($conn, $_POST["in_project"]); 
	$present_location_type = getProjectTypeByID($_POST["in_project"]);
	
	
			$select_assign = "SELECT * FROM `equipment_assign` WHERE `eel_code`='".$_POST["eel_code"]."' ORDER BY `id` DESC";  
			$resultassign = mysqli_query($conn, $select_assign);
			$rowassign = mysqli_fetch_array($resultassign);
			$assign_id = $rowassign["id"];
		   
		if($_POST["rentid"] != '')  
			{  
				$query	= "UPDATE `rent_details` SET `return_date`='$rent_date',`status`='Returned' WHERE `id`='".$_POST["rentid"]."'";
				$conn->query($query);
				
				$query2 = "UPDATE `equipments` SET `present_location`='$project_name',`present_location_type`='$present_location_type',`status`='' WHERE `eel_code` = '".$_POST["eel_code"]."'";
				$conn->query($query2);
				
				$query3 = "UPDATE `rent_history` SET `status`='Returned' WHERE `rent_details_id` = '".$_POST["rentid"]."'";
				$conn->query($query3);
				
				$query5 = "UPDATE `equipment_assign` set `refund_date`='$rent_date' where `id`='$assign_id'";
				$conn->query($query5);
				
				$query4 = "insert into `equipment_assign` values('','".$_POST["eel_code"]."','$project_name','$rent_date','','')";
				$conn->query($query4);
				
				$message = 'Data Updated';
			}  
		else  
			{  
				
				$message = 'Data Inserted';  
			}  
      if(mysqli_query($conn, $query))  
      {  
			
		   $output .= '<center><h5 class="text-success">' . $message . '</h5></center>';  
           $select_query = "SELECT * FROM `rent_details` WHERE `id`='".$_POST["rentid"]."'";  
           $result = mysqli_query($conn, $select_query);
					
					$queryCount	= "select `status` FROM `rent_details` WHERE `challan_no`='".$_POST["challan_no"]."' AND `status`='Rented'";
					$resultCount = $conn->query($queryCount);
					echo $rowcount=mysqli_num_rows($resultCount);
					//$conn->query($queryCount); $rowcount=mysqli_num_rows($result)
					if($rowcount < 1 ){
						$queryStUp = "UPDATE `rents` SET `status`='Returned' WHERE `challan_no`='".$_POST["challan_no"]."'";
						$conn->query($queryStUp);
					}
				
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
                          <td>' . $row["rent_date"] . '</td>  
                          <td style="text-align:right;">
							<input type="button" name="edit" value="Extend Date" id="'.$row["id"] .'" class="btn btn-danger btn-sm edit_data" />
							<input type="button" name="view" value="Return" id="' . $row["id"] . '" class="btn btn-success btn-sm view_data" />
							</td>  
                     </tr>  
                ';  
           }  
           $output .= '</table>';  
      }  
      echo $output;  
 }  
 ?>