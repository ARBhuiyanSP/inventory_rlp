<?php include 'header.php' ?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.navbar{
	border-radius:0px;
	margin-bottom:0px !important;
}
</style>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="emp_list" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Material Group</th>
                                    <th>Material Name</th>
                                    <th>Specifiacation</th>
                                    <th>Part No</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://markcell.github.io/jquery-tabledit/assets/js/tabledit.min.js"></script>
        <script type="text/javascript" language="javascript">
            $(document).ready(function () {
                var dataTable = $("#emp_list").DataTable({
                    processing: true,
                    serverSide: true,
                    order: [],
                    ajax: {
                        url: "fetch/fetch.php",
                        type: "POST",
                    },
                });

                $("#emp_list").on("draw.dt", function () {
                    $("#emp_list").Tabledit({
                        url: "fetch/edit.php",
                        dataType: "json",
                        columns: {
                            identifier: [0, "id"],
                            editable: [
                                [2, "material_description"],
                                [3, "spec"],
                                [4, "part_no"],
                            ],
                        },
                        restoreButton: false,
                        onSuccess: function (data, textStatus, jqXHR) {
                            if (data.action == "delete") {
                                $("#" + data.id).remove();
                                $("#emp_list").DataTable().ajax.reload();
                            }
                        },
                    });
                });
            });
        </script>
		<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    