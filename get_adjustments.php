<?php
include 'connection/connect.php';
header('Content-Type: application/json');

$rlp_id = isset($_GET['rlp_id']) ? intval($_GET['rlp_id']) : 0;
$response = ['adjustments' => [], 'total_adjusted' => 0.00];

if ($rlp_id > 0) {
    $stmt = $conn->prepare("SELECT id, adj_date, rlp_adj_no, details, dr_amount, cr_amount, attachment, remarks 
                            FROM rlp_adjustment WHERE rlp_id=? ORDER BY id DESC");
    $stmt->bind_param("i", $rlp_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $total = 0;
    while ($row = $result->fetch_assoc()) {
        $response['adjustments'][] = $row;
        $total += floatval($row['cr_amount']);
    }
    $response['total_adjusted'] = $total;
}

echo json_encode($response);
