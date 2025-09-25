<?php include 'header.php';
?>

<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                       <a href="cs_list.php"><i class="fa fa-list"></i> List</a>
                       
                            
                        
                    </div>
                    <!-- /.box-header -->
                    <div class="card-body">
                        <?php include 'partial/cs_view.php'; ?>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<?php include 'footer.php'; ?>
