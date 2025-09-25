<?php include 'header.php' ?>
<?php
//Start of permission
if(!check_permission('data-backup')){  
    include('404.php');
    exit();
 }  ?>

<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
             Backup System   
            </div>
        <div class="card-body">
            <div class="div-center">
                    <div class="row">
                        <div class="col-xs-12">
                                <div class="page-title-box">
                                    <h4 class="page-title"> Data Backup</h4>
                                </div>
                                <div>
                                    <button class="btn btn-success" onclick="location.href='backup.php';">Click To Take Backup</button>
                                </div>
                            </div>
                    </div>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->
<?php include 'footer.php' ?>
