<?php  
 //fetch.php  
 $conn = mysqli_connect("localhost", "root", "", "eel_equipment");  
 if(isset($_POST["id"]))  
 {  
      $query = "SELECT * FROM rent_details WHERE id = '".$_POST["id"]."'";  
      $result = mysqli_query($conn, $query);  
      $row = mysqli_fetch_array($result);  
      echo json_encode($row);  
 }  
 ?>