<?php
include 'connection/connect.php';

if(isset($_POST['branch_id'])){
    $branch_id = $_POST['branch_id'];
    $stmt = $conn->prepare("SELECT id, name FROM department WHERE branch_id=?");
    $stmt->bind_param("i", $branch_id);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<option value=''>Select Department</option>";
    while($row = $result->fetch_assoc()){
        echo "<option value='".$row['id']."'>".$row['name']."</option>";
    }
}
?>
