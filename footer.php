<!-- Sticky Footer -->
<footer class="sticky-footer">
  <div class="container my-auto">
    <div class="copyright text-center my-auto">
      <span>Copyright © Saif ERP <?php echo date('Y') ?></span>
    </div>
  </div>
</footer>

</div>
<!-- /.content-wrapper -->

</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        <a class="btn btn-primary" href="login.html">Logout</a>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="js/jquery.easing.min.js"></script>
<script src="js/Chart.min.js"></script>
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap4.min.js"></script>
<script src="js/sweetalert.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>

<script type="text/javascript" src="js/site_url.js?v=2"></script>
<script type="text/javascript" src="js/site_js.js?v=2"></script>
<script src="js/demo/chart-area-demo.js"></script> <!--for handling all general js and ajax operation use the following link-->
<script src="js/general_operation.js"></script>
<!--for handling rlp create form operation use the following link-->
<script src="js/rlp_create_handle.js"></script>
<script>
$(document).ready(function() {
    $('.select2').select2({
        placeholder: "Search and select",
        allowClear: true,
        width: '100%'
    });
});
</script>
<script>
$(function () {    
  get_ins_data_table();
})

function get_ins_data_table(){

  let division_id   = '';
  let department_id   = '';
    //getDataTablelogsheetList call from  grid_management.php
    var url       =   baseUrl + "function/grid_management.php?process_type=getDataTableinsList";
//logsheet_list_table  reference logsheet-list.php
    var userListDataTable   =   $('#ins_list_table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url:url,
                type:'POST',
                dataType:'json',
                data: {
                    division_id     : division_id,
                    department_id   : department_id
                }
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ -1, 2, 3 ] }
            ],
            "lengthMenu": [[10, 100, 250, 500, -1], [10,100, 250, 500, "All"]]
        });


}

 
</script>

<script type="text/javascript" type="text/javascript">
  jQuery(document).ready(function($) {
    $('#dataTable').DataTable();
    $("#item_information").accordion();
    if ($('#material_receive_list')) {
      $('#material_receive_list').DataTable();
    }
  });

  function getSupplierIdBySupplierName(supplier_id) {
    if (supplier_id) {
      var url = baseUrl + "function/supplier_ajax_info.php?process_type=getSupplierIdBySupplierName";
      $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        data: "supplier_id=" + supplier_id,
        success: function(response) {
          if (response.status == 'success') {
            $('#supplier_id').val(response.data.code);
          }
        }
      });
    } else {
      $('#supplier_id').val('');
    }
  }


  function getIssueListDataByDate() {

      var url = baseUrl + "function/issue_data_ajax_info.php?process_type=get_issue_data_by_date";
      $.ajax({
        url: url,
        type: "POST",
        dataType: "html",
        data: $("#get_issue_filter_form").serialize(),
        success: function(response) {
            $('#show_issue_details_data').html(response);
        }
      });
  }
</script>
<script>
$(function () {    
  get_workorders_data_table();
})

function get_workorders_data_table(){

  let project_id   = '';
  let sub_project_id   = '';
    //getDataTablelogsheetList call from  grid_management.php
    var url       =   baseUrl + "function/grid_management.php?process_type=getDataTableWorkordersList";
//logsheet_list_table  reference logsheet-list.php
    var userListDataTable   =   $('#workorders_list_table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url:url,
                type:'POST',
                dataType:'json',
                data: {
                    project_id		: project_id,
                    sub_project_id	: sub_project_id
                }
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ -1, 2, 3 ] }
            ],
            "lengthMenu": [[10, 100, 250, -1], [10,100, 250,"All"]]
        });


}
</script>
<script>
$(function () {    
  get_equipment_data_table();
})

function get_equipment_data_table(){

  let project_id   = '';
  let sub_project_id   = '';
    //getDataTablelogsheetList call from  grid_management.php
    var url       =   baseUrl + "function/grid_management.php?process_type=getDataTableequipmentList";
//logsheet_list_table  reference logsheet-list.php
    var userListDataTable   =   $('#equipment_list_table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url:url,
                type:'POST',
                dataType:'json',
                data: {
                    project_id		: project_id,
                    sub_project_id	: sub_project_id
                }
            },
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ -1, 2, 3 ] }
            ],
            "lengthMenu": [[10, 100, 250, -1], [10,100, 250,"All"]]
        });


}
</script>
<script>
  $(".material_select_2").select2();

  $("#start_date").datepicker({
    dateFormat: "yy-mm-dd"
  });
  $("#end_date").datepicker({
    dateFormat: "yy-mm-dd"
  });
</script>
</body>

</html>
<?php include 'modal/parent_item_added_form.php'; ?>
<?php include 'modal/level3_added_form.php'; ?>
<?php include 'modal/level4_added_form.php'; ?>
<?php include 'modal/sub_item_added_form.php'; ?>
<?php include 'modal/item_edit_form.php'; ?>
<?php include 'modal/sub_item_edit_form.php'; ?>
<?php include 'modal/parent_item_edit_form.php'; ?>