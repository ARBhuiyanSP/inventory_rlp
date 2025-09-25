<?php include 'header.php';
?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <?php include 'operation_message.php'; ?>
        <h1>
            Home
            <small>Note Sheet Details</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="dashboard.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Note Sheet Details</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-xs-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title"></h3>
                        <div class="card-tools">
                            <ul class="pagination pagination-sm no-margin pull-right">
                                <?php //if(hasAccessPermission($user_id_session, 'crlp', 'view_access')){ ?>
                                <li><a href="notesheets_list.php"><i class="fa fa-list"></i> List</a></li>
                                <?php //} ?>
                            </ul>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="card-body">
                        <?php include 'partial/notesheets_view.php'; ?>
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
