<?php
include_once("connection/connect.php");



if (!empty($_POST["id"])) {
    $id = $_POST['id'];
    $query = "select * from rents where client_name=$id AND bill_status != 'Paid'";
    $result = mysqli_query($conn, $query);
    if ($result->num_rows > 0) {
        echo '<option value="">Select challan</option>';
        while ($row = mysqli_fetch_assoc($result)) {
            echo '<option value="' . $row['challan_no'] . '">' . $row['challan_no'] . '</option>';
        }
    }
}