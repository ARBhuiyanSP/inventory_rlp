<?php 
include 'header.php';
?>
<!-- Left Sidebar End -->
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="dashboard.php">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Rental Invoice List</li>
    </ol>
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i> Rental Invoices
            <a href="rental-invoice.php" style="float:right"><i class="fas fa-plus"></i> Create Rental Invoice<a>
        </div>
        <div class="card-body">
            <?php include 'partial/rental_invoice_list.php'; ?>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<?php include 'footer.php'; ?>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script>
$(document).ready(function () {
    $('#rental_invoice_table').DataTable();
});
</script>
