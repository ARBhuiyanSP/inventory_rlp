<?php
include 'connection/connect.php';
$department_id = $_POST['department_id'];
$q = $conn->query("SELECT id, project_name FROM projects WHERE department_id='$department_id'");
echo '<option value="">Select Project</option>';
while($r = $q->fetch_assoc()){
    echo '<option value="'.$r['id'].'">'.$r['project_name'].'</option>';
}
?>
