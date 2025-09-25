<?php  
 if(isset($_POST["employee_id"]))  
 {  
      $output = '';  
      $conn = mysqli_connect("localhost", "root", "", "eel_equipment");  
      $query = "SELECT * FROM rent_details WHERE id = '".$_POST["id"]."'";  
      $result = mysqli_query($conn, $query);  
      $output .= '  
      <div class="table-responsive">  
           <table class="table table-bordered">';  
      while($row = mysqli_fetch_array($result))  
      {  
           $output .= '  
                <tr>  
                     <td width="30%"><label>return_date</label></td>  
                     <td width="70%">'.$row["return_date"].'</td>  
                </tr>   
           ';  
      }  
      $output .= '  
           </table>  
      </div>  
      ';  
      echo $output;  
 }  
 ?>