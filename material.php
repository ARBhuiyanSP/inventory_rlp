




<?php include 'header.php' ?>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
.ui-widget-content {
    max-height: 500px; 

}
</style>
<?php
//Start of permission
/* if(!check_permission('material-list')){  
    include('404.php');
    exit();
 }  */ ?>

<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Material Setup
                <button class="btn btn-flat btn-info " style="text-align: right;" onclick="openModal('item_added_form');"><i class="fa fa-plus"></i> Material</button>     
            </div>
        <div class="card-body">
            <div class="div-center">
                    <div class="row">
                        
                        <div class='col-md-12'>
                            <div class="table-responsive data-table-wrapper">
                                <table id="example" class="table table-condensed table-hover table-bordered site_custome_table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Action</th>
                                            <th>Material Code</th>
                                            <th>Material</th>
                                            <th>Part no</th>
                                            <th>Unit</th>
                                        </tr>
                                    </thead>
                                    <tbody id="item_category_body">
                                        <?php
                                        $item_details = getTableDataByTableName('inv_material', '', 'id');
                                        if (isset($item_details) && !empty($item_details)) {
                                            foreach ($item_details as $item) {
                                                //echo "<pre>";
                                                //print_r($item);
                                                //echo "</pre>";
                                                ?>
                                                <tr>
                                                 
                        <td>
                            <?php echo $item['id']; ?>
                        </td>
    <td>
  <button title="Item Edit" type="button" class="btn btn-sm btn-default" onclick="openMaterialEditForm('<?php echo $item['id']; ?>');">
                                                            <i class="fa fa-edit" aria-hidden="true"></i>
                                                        </button>

        <button title="Add New Part No" type="button" class="btn btn-sm btn-info" onclick="addNewPartNumberModal('<?php echo $item['id']; ?>');">
           <i class="fa fa-plus" aria-hidden="true"></i>
        </button>
</td>

<td><?php echo $item['material_id_code']; ?></td>
<td><?php echo $item['material_description']; ?></td>
<td><?php echo $item['part_no']; ?></td>
<td><?php echo getDataRowByTableAndId('inv_item_unit', $item['qty_unit'])->unit_name; ?></td>
                                                   
                                                </tr>
                                                <?php
                                            }
                                        }else{ ?>
                                              <tr>
                                                  <td colspan="7">
                                                        <div class="alert alert-info" role="alert">
                                                            Sorry, no data found!
                                                        </div>
                                                    </td>
                                                </tr>  
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div><!--table-responsive-->
                        </div>
                        
                    </div>
            </div>
        </div>
    </div>
</div>

<!-- /.container-fluid -->
<?php include 'footer.php' ?>

<?php include 'modal/item_added_form.php'; ?>
<script>
	
	$(document).ready(function() {
		$('#example').DataTable();
	} );


	$(document).ready(function() {
		$('#example1').DataTable();
	} );
	
	
	$(document).ready(function() {
		$('#example2').DataTable();
	} );
	
	
	$(document).ready(function() {
		$('#example3').DataTable();
	} );
	
	
	$(document).ready(function() {
		$('#example4').DataTable();
	} );
	
</script>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>