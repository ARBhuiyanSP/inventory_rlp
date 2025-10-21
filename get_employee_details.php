<?php
include 'connection/connect.php';
$office_id = $_GET['office_id'] ?? '';

if($office_id){
    $stmt = $conn->prepare("SELECT * FROM inv_employee WHERE employeeid=?");
    $stmt->bind_param("s", $office_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if($result->num_rows){
        $emp = $result->fetch_assoc();
        echo json_encode([
            'success' => true,
            'name' => $emp['name'],
            'email' => $emp['email'],
            'contact_number' => $emp['contact_number'],
            'designation' => $emp['designation'],
            'company_id' => $emp['company_id'],
            'branch_id' => $emp['branch_id'],
            'department_id' => $emp['department_id'],
            'project_id' => $emp['project_id']
        ]);
        exit;
    }
}
echo json_encode(['success'=>false]);
?>
