<?php
include 'connection/connect.php';

if(isset($_POST['company_id'])){
    $company_id = $_POST['company_id'];
    $stmt = $conn->prepare("SELECT id, name FROM branch WHERE company_id=?");
    $stmt->bind_param("i", $company_id);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<option value=''>Select Branch</option>";
    while($row = $result->fetch_assoc()){
        echo "<option value='".$row['id']."'>".$row['name']."</option>";
    }
}
?>
