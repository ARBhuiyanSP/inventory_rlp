<?php
include 'header.php';
$currentUser = $_SESSION['logged']['user_id'] ?? 1;

// upload folder
$upload_dir = __DIR__ . "/uploads/adjustments/";
if (!file_exists($upload_dir)) mkdir($upload_dir, 0777, true);

// ========== INSERT ==========
if (isset($_POST['add'])) {
    $adj_date   = $_POST['adj_date'];
    $rlp_id     = $_POST['rlp_id'];
    $rlp_adj_no = trim($_POST['rlp_adj_no']);
    $details    = trim($_POST['details']);
    $cr_amount  = floatval($_POST['cr_amount']);
    $dr_amount  = 0;
    $remarks    = trim($_POST['remarks']);
    $created_at = date("Y-m-d H:i:s");

    $attachment = null;
    if (!empty($_FILES['attachment']['name'])) {
        $ext = strtolower(pathinfo($_FILES['attachment']['name'], PATHINFO_EXTENSION));
        $allowed = ['jpg','jpeg','png','pdf'];
        if (in_array($ext, $allowed) && $_FILES['attachment']['size'] <= 5*1024*1024) {
            $filename = uniqid('adj_') . '.' . $ext;
            move_uploaded_file($_FILES['attachment']['tmp_name'], $upload_dir . $filename);
            $attachment = 'uploads/adjustments/' . $filename;
        }
    }

    $stmt = $conn->prepare("INSERT INTO rlp_adjustment (adj_date, rlp_id, rlp_adj_no, details, dr_amount, cr_amount, attachment, remarks, created_at, created_by) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sissddsssi", $adj_date, $rlp_id, $rlp_adj_no, $details, $dr_amount, $cr_amount, $attachment, $remarks, $created_at, $currentUser);
    if (!$stmt->execute()) {
        echo "<div class='alert alert-danger'>Insert Error: ".$stmt->error."</div>";
    }
}

// ========== DELETE ==========
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $stmt = $conn->prepare("DELETE FROM rlp_adjustment WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
}

// ========== LOAD RLP LIST ==========
$rlp_list = $conn->query("SELECT id, rlp_no, totalamount FROM rlp_info WHERE is_delete=0 ORDER BY id DESC");
?>

<div class="container-fluid">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
        <li class="breadcrumb-item active">RLP Adjustment</li>
    </ol>

    <div class="card mb-3">
        <div class="card-header"><i class="fas fa-edit"></i> RLP Adjustment Entry</div>
        <div class="card-body">
            <div class="row">
                <!-- Left Form -->
                <div class="col-md-4">
                    <form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Adjustment Date</label>
                            <input type="date" name="adj_date" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Select RLP</label>
                            <select name="rlp_id" id="rlp_id" class="form-control" required>
                                <option value="">Select RLP</option>
                                <?php while($r = $rlp_list->fetch_assoc()): ?>
                                    <option value="<?= $r['id'] ?>" data-total="<?= $r['totalamount'] ?>">
                                        <?= htmlspecialchars($r['rlp_no']) ?> (ID: <?= $r['id'] ?>)
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Total Amount (from RLP)</label>
                            <input type="text" id="total_amount" class="form-control" readonly placeholder="Select an RLP">
                        </div>

                        <div class="form-group">
                            <label>Total Adjusted Amount</label>
                            <input type="text" id="adjusted_amount" class="form-control" readonly placeholder="0.00">
                        </div>

                        <div class="form-group">
                            <label>RLP Adjustment No</label>
                            <input type="text" name="rlp_adj_no" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Details</label>
                            <textarea name="details" class="form-control" rows="3" required></textarea>
                        </div>

                        <div class="form-group">
                            <label>Credit Amount</label>
                            <input type="number" step="0.01" name="cr_amount" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label>Attachment (optional, JPG/PNG/PDF)</label>
                            <input type="file" name="attachment" class="form-control-file">
                        </div>

                        <div class="form-group">
                            <label>Remarks</label>
                            <textarea name="remarks" class="form-control" rows="2"></textarea>
                        </div>

                        <button type="submit" name="add" class="btn btn-success">Add Adjustment</button>
                    </form>
                </div>

                <!-- Right Table -->
                <div class="col-md-8">
                    <h5>RLP Adjustment Records</h5>
                    <table class="table table-bordered table-striped" id="adjustmentTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Date</th>
                                <th>Adj No</th>
                                <th>Details</th>
                                <th>DR Amount</th>
                                <th>CR Amount</th>
                                <th>Attachment</th>
                                <th>Remarks</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr><td colspan="9" class="text-center text-muted">Select an RLP to view adjustments</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- AJAX Script -->
<script>
document.getElementById('rlp_id').addEventListener('change', function() {
    var selected = this.options[this.selectedIndex];
    var rlpId = this.value;
    var total = selected.getAttribute('data-total') || '';
    document.getElementById('total_amount').value = total ? total : '';
    document.getElementById('adjusted_amount').value = '';

    // Clear current table
    const tbody = document.querySelector('#adjustmentTable tbody');
    tbody.innerHTML = '<tr><td colspan="9" class="text-center text-muted">Loading...</td></tr>';

    if (rlpId) {
        fetch('get_adjustments.php?rlp_id=' + rlpId)
        .then(response => response.json())
        .then(data => {
            tbody.innerHTML = '';
            if (data.adjustments.length > 0) {
                data.adjustments.forEach(row => {
                    tbody.innerHTML += `
                        <tr>
                            <td>${row.id}</td>
                            <td>${row.adj_date}</td>
                            <td>${row.rlp_adj_no}</td>
                            <td>${row.details}</td>
                            <td>${row.dr_amount}</td>
                            <td>${parseFloat(row.cr_amount).toFixed(2)}</td>
                            <td>${row.attachment ? `<a href="${row.attachment}" target="_blank">View</a>` : ''}</td>
                            <td>${row.remarks}</td>
                            <td><a href="?delete=${row.id}" class="btn btn-danger btn-sm" onclick="return confirm('Delete this entry?')">Delete</a></td>
                        </tr>
                    `;
                });
                document.getElementById('adjusted_amount').value = parseFloat(data.total_adjusted).toFixed(2);
            } else {
                tbody.innerHTML = '<tr><td colspan="9" class="text-center text-muted">No adjustments found for this RLP</td></tr>';
                document.getElementById('adjusted_amount').value = '0.00';
            }
        })
        .catch(() => {
            tbody.innerHTML = '<tr><td colspan="9" class="text-center text-danger">Error loading data</td></tr>';
        });
    }
});
</script>

<?php include 'footer.php'; ?>
