<?php
	$currentUserId  =   $_SESSION['logged']['user_id'];
    $wo_id         =   $_GET['id'];    
    $wo_details    =   getWorkordersDetailsDataNs($wo_id);   
    $wo_info       =   $wo_details['wo_info'];
    $wo_details    =   $wo_details['wo_details'];
?>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<!-- Main content -->
<section class="invoice">
    <form action="" method="POST" enctype="multipart/form-data">
    <!-- info row -->
  
    <!-- /.row -->

    <!-- Table row -->
        <div class="row" id="div1" style="">
			<div class="col-xs-1">
				<div class="form-group">
					<label>MRR Date</label>
					<input type="text" autocomplete="off" name="mrr_date" id="mrr_date" class="form-control datepicker" value="<?php echo date('Y-m-d'); ?>">
				</div>
			</div>
			<div class="col-xs-1">
				<div class="form-group">
					<label>MRR No</label>
					<?php if($_SESSION['logged']['user_type'] == 'whm')
						{
							$warehouse_id   =   $_SESSION['logged']['warehouse_id'];
							$sql    =   "SELECT * FROM inv_warehosueinfo WHERE `id`='$warehouse_id'";
							$result = mysqli_query($conn, $sql);
							$row=mysqli_fetch_array($result);
							$short_name = $row['short_name'];
							$mrrcode= 'MRR-'.$short_name;
						} else{
							$mrrcode= 'MRR-CW';
						}
					?>
					<input type="text" name="mrr_no" id="mrr_no" class="form-control" readonly="readonly" value="<?php echo getDefaultCategoryCodeByWarehouse('inv_receive', 'mrr_no', '03d', '001', $mrrcode) ?>">
					<input type="hidden" name="receive_no" id="receive_no" value="<?php echo getDefaultCategoryCodeByWarehouse('inv_receive', 'mrr_no', '03d', '001', $mrrcode) ?>">
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label>Workorder No</label>
					<input type="text" name="wo_no" value="<?php echo $wo_info->wo_no ?>" id="purchase_id" class="form-control" readonly>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Notesheet No.</label>
					<input type="text" name="ns_no" id="ns_no" value="<?php echo $wo_info->notesheet_no; ?>" class="form-control" readonly>
					<!-- <input type="text" id="requisition_no" name="requisition_no" class="form-control" onkeypress="return event.charCode > 47 && event.charCode < 58;" pattern="[0-9]{5}" required></input> -->
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">RLP No.</label>
					<input type="text" name="rlp_no" id="rlp_no" value="<?php echo $wo_info->rlp_no; ?>" class="form-control" readonly>
					<!-- <input type="text" id="requisition_no" name="requisition_no" class="form-control" onkeypress="return event.charCode > 47 && event.charCode < 58;" pattern="[0-9]{5}" required></input> -->
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Supplier Challan No</label>
					<input type="text" name="challan_no" id="challan_no" class="form-control">
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Challan Date</label>
					<input type="text" autocomplete="off" name="challan_date" id="challan_date" class="form-control datepicker" value="<?php echo date('Y-m-d'); ?>">
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Supplier</label><span class="reqfield"> ***required</span>
					<select class="form-control material_select_2" id="supplier_id" name="supplier_id" required >
						<option value="">Select</option>
						<?php
						$projectsData = getTableDataByTableName('suppliers');

						if (isset($projectsData) && !empty($projectsData)) {
							foreach ($projectsData as $data) {
									if($wo_info->supplier_name == $data['name']){
									$selected	= 'selected';
									}else{
									$selected	= 'disabled';
									}
								?>
								<option value="<?php echo $data['code']; ?>" <?php echo $selected; ?>><?php echo $data['name']; ?></option>
								<?php
							}
						}
						?>
					</select>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label>Project</label>
					<input type="text" class="form-control" name="" value="<?php echo getProjectNameById($wo_info->request_project) ?>" readonly />
					<input type="hidden" name="request_project" value="<?php echo $wo_info->request_project ?>" />
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label>Warehouse</label>
					<input type="text" class="form-control" name="" value="<?php echo getWarehouseNameById($wo_info->request_warehouse) ?>" readonly />
					<input type="hidden" name="request_warehouse" value="<?php echo $wo_info->request_warehouse ?>" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item Description</th>
                            <th>ns details id</th>
                            <th width="10%">Item Code</th>
                            <th width="10%">Part No</th>
                            <th width="5%">Unit</th>
                            <th width="5%">Qty</th>
                            <th width="5%">Rcv Qty</th>
                            <th width="10%">Unit Price</th>
                            <th width="10%">Total</th>
                            <th width="10%">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_posts_body">
                        <?php
                        $sl =   1;
                            foreach($wo_details as $key => $data){
                        ?>
                        <tr id="row<?php echo $data->id ?>">
                            <td><?php echo $sl++; ?></td>
							
							
                            <td><input type="text" class="form-control" name="" id="" value="<?php $dataresult =   getDataRowByTableAndId('inv_material', $data->item);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : ''); ?>" readonly ></td>
								<input type="hidden" class="form-control" name="material_name[]" id="" value="<?php echo (isset($data->item) && !empty($data->item) ? $data->item : ""); ?>" readonly >
							
							<td><input type="text" class="form-control" name="ns_details_id[]" id="" value="<?php echo $data->ns_details_id; ?>" readonly >
								</td>
								
							<td><input type="text" class="form-control" name="material_id[]" id="" value="<?php $dataresult =   getDataRowByTableAndId('inv_material', $data->item);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_id_code : ''); ?>" readonly >
								</td>
								
							<td><input type="text" class="form-control" name="part_no[]" id="" value="<?php $dataresult =   getDataRowByTableAndId('inv_material', $data->item);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->part_no : ''); ?>" readonly >
								</td>
								
							<td><input type="text" class="form-control" id="" value="<?php 
										$dataresults =   getDataRowByTableAndId('inv_material', $data->item);
										$dataresult =   getDataRowByTableAndId('inv_item_unit', $dataresults->qty_unit);
										echo (isset($dataresult) && !empty($dataresult) ? $dataresult->unit_name : '');
										?>" readonly ></td>
										<input type="hidden" name="unit[]" value="<?php $dataresults =   getDataRowByTableAndId('inv_material', $data->item); echo (isset($dataresults) && !empty($dataresults) ? $dataresults->qty_unit : ''); ?>" >
										
                            <td><input type="text" class="form-control" name="qty[]" id="qty_<?php echo $data->id; ?>" value="<?php echo (isset($data->quantity) && !empty($data->quantity) ? $data->quantity : ""); ?>" readonly ></td>
							
							<td><input type="text" class="form-control" onkeyup="caltotal(<?php echo $data->id; ?>)" name="quantity[]" id="quantity_<?php echo $data->id; ?>" value="<?php echo (isset($data->quantity) && !empty($data->quantity) ? $data->quantity : ""); ?>" required ></td>
							
                            <td><input type="text" class="form-control" onkeyup="caltotal(<?php echo $data->id; ?>)" name="unit_price[]" id="unit_price_<?php echo $data->id; ?>" value="" required ></td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control total_amount" name="totalamount[]" id="total_<?php echo $data->id; ?>" value="" readonly >
                                </div>
                            </td>
                            <?php if ($key == 0) { ?>
                            <td></td>
                    <?php } else { ?>
                            <td><button type="button" name="remove" id="<?php echo $data->id; ?>" class="btn btn-sm btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td>
                    <?php } ?>
                        </tr>                        
                            <?php } ?>
							
                        <?php //if(is_super_admin($currentUserId)){ ?>                       
					   <tr>
                            <td colspan="9" style="text-align:right">Sub Total : </td>
							<td>
								<input type="text" class="form-control" name="sub_total" value="" onchange="calculate_total_buy_amount()" id="allcur" readonly />
                            </td>
                            <td></td>
                        </tr>
						
                        <?php //}?>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
			<!-- <div class="col-md-4">
                <div class="form-group">
					<label>Attachment</label>
					<input type="file" id="remarks" name="sn_prt_file" class="form-control" />     
                </div>
            </div> --->
			<div class="col-md-12">
                <div class="form-group">
					<label>Remarks</label>
					<textarea id="remarks" name="remarks" class="form-control" required></textarea>     
                </div>
            </div>
        </div>
		<div class="row">
			<input type="submit" class="btn btn-primary btn-block" name="receive_submit" value="SAVE DATA">
		</div>
    </form>
    <!-- /.row -->
</section>

<!-- /.content -->
<div class="clearfix"></div>

<script>
function  caltotal(id){
	let quantity = parseFloat($('#quantity_'+id).val());
    let unit_price = parseFloat($('#unit_price_'+id).val());
	
	let myResult = parseFloat(quantity * unit_price).toFixed(2);
-
    $('#total_'+id).val(myResult);
	
	 calculate_total_buy_amount();
}

$(document).on('click', '.btn_remove', function () {
            var button_id = $(this).attr("id");
            $('#row' + button_id + '').remove();
            calculate_total_buy_amount();
        });

function calculate_total_buy_amount() {
        let subTotalAmount     =   $(".total_amount");
        let subBuyTotal     =   0;

        for(let mySubValue = 0;  mySubValue < subTotalAmount.length; mySubValue++){
            subBuyTotal+= parseFloat($("#" + subTotalAmount[mySubValue].id).val());
			
        }
        
        document.getElementById('allcur').value = subBuyTotal.toFixed(2);
		 
		
		$(function(){
    $('#allcur').on('input', function() {
      calculate();
    });
    $('#vat').on('input', function() {
     calculate();
    });
	$('#ait').on('input', function() {
     calculate();
    });
	$('#discount').on('input', function() {
     calculate();
    });
    function calculate(){
        let subTotal = parseFloat($('#allcur').val()).toFixed(2);

		// Discount
		let discount = parseFloat($('#discount').val()).toFixed(2);
        let discountPerc="";
		if(isNaN(subTotal) || isNaN(discount)){
            discountPerc=" ";
           }else{
           //discountPerc = ((subTotal*discount)/ 100).toFixed(2);
           discountPerc = parseFloat($('#discount').val()).toFixed(2);
           }
        
        $('#discountamount').val(discountPerc);
		let pDiscount = parseFloat($('#discountamount').val()).toFixed(2);
		
		let disTotal = (parseFloat(subTotal) - parseFloat(pDiscount)).toFixed(2);
		$('#allcur_after_discount').val(disTotal);
		// Discount end 
        let vat = parseFloat($('#vat').val()).toFixed(2);
        let ait = parseFloat($('#ait').val()).toFixed(2);
        let aitPerc="";
		if(isNaN(disTotal) || isNaN(ait)){
            aitPerc=" ";
           }else{
           aitPerc = ((disTotal*ait)/ 100).toFixed(2);
           }
        
        $('#aitamount').val(aitPerc);
		let pAit = parseFloat($('#aitamount').val()).toFixed(2);
			
        let vatPerc="";
        if(isNaN(disTotal) || isNaN(vat)){
            vatPerc=" ";
           }else{
           vatPerc = ((disTotal*vat)/ 100).toFixed(2);
           }
        
        $('#vatamount').val(vatPerc);
		let pVat = parseFloat($('#vatamount').val()).toFixed(2);
		
		let grandTotal = (parseFloat(disTotal) + parseFloat(pVat) + parseFloat(pAit)).toFixed(2);
		$('#grandTotal').val(grandTotal).toFixed(2);
		
		
		
    }
calculate();
});
                
    }
	





</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('.code_preview0').summernote({height: 150});
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
