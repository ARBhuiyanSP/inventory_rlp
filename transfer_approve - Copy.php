<?php
include 'header.php';
if (isset($_GET['no']) && !empty($_GET['no'])) {
    $edit_id            = $_GET['no'];
    $data               = getTransferDataDetailsById($edit_id);
    $transferData          = $data['transferData'];
    $transferDetailsData   = $data['transferDetailsData'];
}
?>
<div class="container-fluid">
    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            Transfer Approval Form</div>
        <div class="card-body">
            <!--here your code will go-->
            <div class="form-group">
                <form action="" method="post" name="add_issue" id="add_issue">
                    <div class="row" id="div1" style="">
                        <div class="col-xs-1">
                            <div class="form-group">
                                <label>Transfer Date</label>
                                <input type="text" name="transfer_date" id="" class="form-control" value="<?php echo date('Y-m-d', strtotime($transferData->transfer_date)); ?>" readonly >
                            </div>
                        </div>
						<div class="col-xs-1">
                            <div class="form-group">
                                <label>Receive Date</label>
                                <input type="text" autocomplete="off" name="receive_date" id="issue_date" class="form-control datepicker" value="<?php echo date('Y-m-d'); ?>">
                            </div>
                        </div>
                        <div class="col-xs-2">
                            <div class="form-group">
                                <label>Transfer No</label>
                                <input type="text" name="issue_id" id="issue_id" class="form-control" readonly="readonly" value="<?php echo $transferData->transfer_id; ?>">
                                <input type="hidden" name="transfer_id" id="transfer_id" value="<?php echo $transferData->transfer_id; ?>">
                            </div>
                        </div>

                        <div class="col-xs-2">
                            <div class="form-group">
                                <label>From Warehouse</label>
								
								<?php  
									$warehouse_id = $transferData->from_warehouse;								
									$dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $warehouse_id);
								?>
								<input type="text" class="form-control" readonly="readonly" value="<?php echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : ''); ?>">
								
								<input type="hidden" name="from_warehouse" id="from_warehouse" class="form-control" readonly="readonly" value="<?php echo $transferData->from_warehouse; ?>">
								
                            </div>
                        </div>
						
						<div class="col-xs-2">
                            <div class="form-group">
                                <label>From Project</label>
								
								<?php  
									$project_id = $transferData->from_project;								
									$dataresult =   getDataRowByTableAndId('projects', $project_id);
								?>
								<input type="text" class="form-control" readonly="readonly" value="<?php echo (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); ?>">
								
								<input type="hidden" name="from_project" id="from_project" class="form-control" readonly="readonly" value="<?php echo $transferData->from_project; ?>">
								
                            </div>
                        </div>
						
                        <div class="col-xs-2">
                            <div class="form-group">
                                <label>To Warehouse</label>
								
								<?php  
									$warehouse_id = $transferData->to_warehouse;								
									$dataresult =   getDataRowByTableAndId('inv_warehosueinfo', $warehouse_id);
								?>
								<input type="text" class="form-control" readonly="readonly" value="<?php echo (isset($dataresult) && !empty($dataresult) ? $dataresult->name : ''); ?>">
								
								<input type="hidden" name="to_warehouse" id="to_warehouse" class="form-control" readonly="readonly" value="<?php echo $transferData->to_warehouse; ?>">
								
                            </div>
                        </div>
						
						<div class="col-xs-2">
                            <div class="form-group">
                                <label>To Project</label>
								
								<?php  
									$project_id = $transferData->to_project;								
									$dataresult =   getDataRowByTableAndId('projects', $project_id);
								?>
								<input type="text" class="form-control" readonly="readonly" value="<?php echo (isset($dataresult) && !empty($dataresult) ? $dataresult->project_name : ''); ?>">
								
								<input type="hidden" name="to_project" id="to_project" class="form-control" readonly="readonly" value="<?php echo $transferData->to_project; ?>">
								
                            </div>
                        </div>
                    </div>
                    <div class="row" id="div1"  style="">
                        <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dynamic_field">
                                
								
								<thead>
                                <th width="20%">Material Name<span class="reqfield"> ***required</span></th>
                                <th width="15%">Material ID</th>
                                <th width="10%">Part No</th>
                                <th width="10%">Unit</th>
                                <th width="10%">Unit Price</th>
                                <th width="10%">Act Qty<span class="reqfield"> ***</span></th>
                                <th width="10%">Receive Qty<span class="reqfield"> ***</span></th>
                                <th width="10%">Amount</th>
                                </thead>
                                <tbody>
                                    <?php
                                    $productSerial = 0;
                                    if (isset($transferDetailsData) && !empty($transferDetailsData)) {
                                        foreach ($transferDetailsData as $key => $editDatas) {
                                            $productSerial++;
                                            ?>
                                            <tr id="row<?php echo $key; ?>">
                                                <td>
                                                    <input type="hidden" name="id[]" id="id<?php echo $key; ?>" class="form-control"  value="<?php echo (isset($editDatas->id) && !empty($editDatas->id) ? $editDatas->id : ''); ?>" readonly >
													
													<input type="hidden" name="material_name[]" id="material_name<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->material_name) && !empty($editDatas->material_name) ? $editDatas->material_name : ''); ?>">
													
													<input type="text" name="" id="" class="form-control" value="<?php $dataresult =   getDataRowByTableAndId('inv_material', $editDatas->material_name);
													echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : ''); ?>" readonly >
													
                                                </td>
                                                <td><input type="text" name="material_id[]" id="material_id<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->material_id) && !empty($editDatas->material_id) ? $editDatas->material_id : ''); ?>" readonly ></td>
												<td><input type="text" name="part_no[]" id="part_no<?php echo $key; ?>" value="<?php echo (isset($editDatas->part_no) && !empty($editDatas->part_no) ? $editDatas->part_no : ''); ?>" class="form-control" required readonly></td>
                                                
												<td>
													<input type="text" name="unit[]" id="" class="form-control" value="<?php $dataresult =   getDataRowByTableAndId('inv_item_unit', $editDatas->unit);
													echo (isset($dataresult) && !empty($dataresult) ? $dataresult->unit_name : ''); ?>" readonly >
                                                </td>
												
												<td><input type="text" name="unit_price[]" id="unit_price<?php echo $key; ?>" class="form-control"  value="<?php echo (isset($editDatas->unit_price) && !empty($editDatas->unit_price) ? $editDatas->unit_price : ''); ?>" readonly ></td>
                                            
											
                                                <td><input type="text" name="" value="<?php echo (isset($editDatas->transfer_qty) && !empty($editDatas->transfer_qty) ? $editDatas->transfer_qty : ''); ?>" class="form-control"readonly ></td>
											
                                                <td><input type="text" name="quantity[]" value="<?php echo (isset($editDatas->transfer_qty) && !empty($editDatas->transfer_qty) ? $editDatas->transfer_qty : ''); ?>" id="quantity<?php echo $key; ?>" onkeyup="sum(<?php echo $key; ?>)" class="form-control"></td>
												
												
												<td><input type="text" name="totalamount[]" id="sum<?php echo $key; ?>" class="form-control" value="<?php echo (isset($editDatas->unit_price) && !empty($editDatas->unit_price) ? ($editDatas->transfer_qty * $editDatas->unit_price) : ''); ?>" class="form-control" readonly ></td>
                                            </tr>
        <?php
    }//End of foreach
} else {
    ?>
                                        
<?php } ?>
                                </tbody>
                            </table>
							
                        </div>
                        </div>
                    </div>
                    <div class="row" style="">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <label>Remarks</label>
                                <textarea id="remarks" name="remarks" class="form-control"><?php
								if (isset($transferData->remarks)) {
									echo $transferData->remarks;
								}
								?></textarea>
                            </div>
                        </div>
                        <input type="hidden" name="edit_id" value="<?php echo $transferData->id; ?>">
                        <div class="col-xs-6"></div>
                        <div class="col-xs-4">
                            <div class="form-group">
                                <input type="submit" name="transfer_receive_submit" id="submit" class="btn btn-block btn-success" value="Receive Approve" />
                            </div>
                        </div>
                       <!--- <div class="col-xs-2">
                            <div class="form-group">
                                <input type="submit" name="transfer_reject_submit" id="submit" class="btn btn-block btn-danger" value="Receive Reject" />
                            </div>
                        </div>  --->
                    </div>


                </form>
            </div>
            <!--here your code will go-->
        </div>
    </div>

</div>
<!-- /.container-fluid -->
<script>
    var i = 0;
    $(document).ready(function () {
        $('#add').click(function () {            
            i++;
            
			$(".material_select_2").select2();
			$('#quantity' + i + ', #unit_price' + i).change(function () {
                sum(i)
            });
        });

        $(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
            sum_total();
        });
    });


 $(document).ready(function () {
        //this calculates values automatically 
        sum(0);
    });

    function sum(i) {
        var quantity1 = document.getElementById('quantity' + i).value;
        var unit_price1 = document.getElementById('unit_price' + i).value;
        var result = parseFloat(quantity1) * parseFloat(unit_price1);
        if (!isNaN(result)) {
            document.getElementById('sum' + i).value = result;
        }
        sum_total();
    }
    function sum_total() {
        var newTot = 0;
        for (var a = 0; a <= i; a++) {
            aVal = $('#sum' + a);
            if (aVal && aVal.length) {
                newTot += aVal[0].value ? parseFloat(aVal[0].value) : 0;
            }
        }
        document.getElementById('allsum').value = newTot.toFixed(2);
    }
</script>
<script>
    $(function () {
        $("#issue_date").datepicker({
            inline: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-50:+10",
            changeYear: true,
            changeMonth: true
        });
    });
</script>
<?php include 'footer.php' ?>