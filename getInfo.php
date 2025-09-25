<?php
include('connection/connect.php');

if(isset($_POST['companyId'])){
    $companyId = intval($_POST['companyId']);
    $result = $conn->query("SELECT * FROM branch WHERE company_id = $companyId ORDER BY name ASC");
    echo '<option value="">Select Division</option>';
    while($row = $result->fetch_assoc()){
        echo '<option value="'.$row['id'].'">'.htmlspecialchars($row['name']).'</option>';
    }
}
elseif(isset($_POST['divisionId'])){
    $divisionId = intval($_POST['divisionId']);
    $result = $conn->query("SELECT * FROM department WHERE branch_id = $divisionId ORDER BY name ASC");
    echo '<option value="">Select Department</option>';
    while($row = $result->fetch_assoc()){
        echo '<option value="'.$row['id'].'">'.htmlspecialchars($row['name']).'</option>';
    }
}
elseif(isset($_POST['departmentId'])){
    $departmentId = intval($_POST['departmentId']);
    $result = $conn->query("SELECT * FROM projects WHERE department_id = $departmentId ORDER BY project_name ASC");
    echo '<option value="">Select Project/Location</option>';
    while($row = $result->fetch_assoc()){
        echo '<option value="'.$row['id'].'">'.htmlspecialchars($row['project_name']).'</option>';
    }
}
?>
