<?php
include_once("connection/connect.php");
if (!empty($_POST["id"])) {
    $id = $_POST['id'];
    $query = "select * from projects where client_id=$id";
    $result = mysqli_query($conn, $query);
    if ($result->num_rows > 0) {
        echo '<option value="">Select Project</option>';
        while ($row = mysqli_fetch_assoc($result)) {
            echo '<option value="' . $row['id'] . '">' . $row['project_name'] . '</option>';
        }
    }
}