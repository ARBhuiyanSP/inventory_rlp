<?php include 'header.php';
?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <!-- Small cardes (Stat card) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
						<i class="fas fa-table"></i> Task Details View
						<a href="task_list.php" style="float:right"><i class="fas fa-plus"></i> Task List<a>
					</div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <?php include 'partial/task_details_view.php'; ?>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php include 'footer.php'; ?>
