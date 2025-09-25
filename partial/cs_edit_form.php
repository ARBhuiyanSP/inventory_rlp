<style>
.table-bordered th, .table-bordered td{
	border : 1px solid #000 !important;
}
</style>
<form action="" method="post">
   <div class="row" style="background-color:#CDEFF7;">
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Division:</label>
				<input type="text" class="form-control" value="<?php echo getDivisionNameById($cs_info->request_division) ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $cs_info->request_division; ?>" />
				
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Department:</label>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($cs_info->request_department) ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $cs_info->request_department; ?>" />
				
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Project:</label>
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($cs_info->request_project) ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $cs_info->request_project; ?>" />
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Warehouse:</label>
				 <input type="text" class="form-control" value="<?php echo getWarehouseNameById($cs_info->request_warehouse) ?>" readonly />
				 <input name="request_warehouse" type="hidden" value="<?php echo $cs_info->request_warehouse; ?>" />
				 
			</div>
		</div>
		<div class="col-sm-2">
            <div class="form-group">
                <label for="exampleId">RLP Type</label>
                
				<input type="text" class="form-control" name=""  value="<?php 
									echo "---";
								
							?>" readonly>
				
                <input type="hidden" class="form-control" name="rlp_type"  value="" readonly>
				
            </div>
		</div>
	
		<div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="date" type="text" class="form-control" id="rlpdate" value="<?php echo $cs_info->request_date; ?>" size="30" autocomplete="off" required />
            </div>
        </div>
        <div class="col-sm-4">
           
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">RLP No</label>
                <div class="rlpno_style" style="background-color:green;color:#fff;padding:2px;"><?php echo $cs_info->rlp_no; ?></div>
                <input type="hidden" name="rlp_no" value="<?php echo $cs_info->rlp_no; ?>">
                <input type="hidden" name="rlp_info_id" value="<?php echo $cs_info->rlp_info_id; ?>">
                <input type="hidden" name="cs_id" value="<?php echo $cs_info->id; ?>">
            </div>
        </div>
    </div>
	
	    <!-- Table row -->
	<div class="row" id="div1" style="">
		<div class="col-md-12">
			<div class="table">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th rowspan="2">Material Name</th>
							<th rowspan="2">Unit</th>
							<th rowspan="2">Qty</th>
							<th colspan="4" class="text-center" style="background-color:#138496;color:#fff;">Supplier 1</th>
							<th colspan="4" class="text-center" style="background-color: #0b621f;color:#fff;">Supplier 2</th>
							<th colspan="4" class="text-center" style="background-color: #C82333;color:#fff;">Supplier 3</th>
						</tr>
						<tr>
							<th>Unit Price</th>
							<th>Amount</th>
							<th>Supplier</th>
							<th style="border-right:5px solid #138496;">Select</th>
							
							<th>Unit Price</th>
							<th>Amount</th>
							<th>Supplier</th>
							<th style="border-right:5px solid #0b621f;">Select</th>
							
							<th>Unit Price</th>
							<th>Amount</th>
							<th>Supplier</th>
							<th style="border-right:5px solid #C82333;">Select</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$productSerial = 0;
						$sub_total_amount_s1 = 0;
						$sub_total_amount_s2 = 0;
						$sub_total_amount_s3 = 0;
						if (isset($cs_details) && !empty($cs_details)) {
							foreach ($cs_details as $key => $editDatas) {
								$productSerial++;
								$sub_total_amount_s1 += $editDatas->amount_1;
								$sub_total_amount_s2 += $editDatas->amount_2;
								$sub_total_amount_s3 += $editDatas->amount_3;
						?>
						<tr id="row<?php echo $key; ?>">
							<td>
								<input type="hidden" name="rlp_details_id[]" value="<?php echo $editDatas->rlp_details_id ?? ''; ?>" >
								<select class="form-control select2" id="material_name<?php echo $key; ?>" name="material_name[]" required >
									<option value="">Select</option>
									<?php
									$projectsData = get_product_with_category();
									if (!empty($projectsData)) {
										foreach ($projectsData as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" 
												<?php if (isset($editDatas->material_id) && $editDatas->material_id == $data['item_code']) {echo 'selected';} ?>>
												<?php echo $data['material_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							<input type="hidden" name="material_id[]" value="<?php echo $editDatas->material_id ?? ''; ?>">
							
							<td>
								<select class="form-control" name="unit[]" required>
									<option value="">Select</option>
									<?php
									$projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
									if (!empty($projectsData)) {
										foreach ($projectsData as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" 
												<?php if (isset($editDatas->unit) && $editDatas->unit == $data['id']) {echo 'selected';} ?>>
												<?php echo $data['unit_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							
							<td><input type="text" name="quantity[]" id="quantity<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->quantity ?? ''; ?>" readonly></td>
							
							<!-- Supplier 1 -->
							<td><input type="number" name="unit_price[]" id="unit_price<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_1 ?? ''; ?>"></td>
							<td><input type="number" name="amount[]" id="sum<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_1 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name[]">
									<option value="">Select</option>
									<?php
									$vendors = getTableDataByTableName('vendors');
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_1) && $editDatas->supplier_id_1 == $data['id']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
											
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #138496;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="1" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_1) {echo 'checked';} ?>></td>
							
							<!-- Supplier 2 -->
							<td><input type="number" name="unit_price_s2[]" id="unit_price_s2<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_2 ?? ''; ?>"></td>
							<td><input type="number" name="amount_s2[]" id="sum_s2<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_2 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name_s2[]">
									<option value="">Select</option>
									<?php
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_2) && $editDatas->supplier_id_2 == $data['id']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #0b621f;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="2" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_2) {echo 'checked';}?>></td>
							
							<!-- Supplier 3 -->
							<td><input type="number" name="unit_price_s3[]" id="unit_price_s3<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_3 ?? ''; ?>"></td>
							<td><input type="number" name="amount_s3[]" id="sum_s3<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_3 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name_s3[]">
									<option value="">Select</option>
									<?php
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_3) && $editDatas->supplier_id_3 == $data['id']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #C82333;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="3" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_3) {echo 'checked';}?> ></td>
						</tr>
						<?php }} ?>
						
						<tr>
							<td style="text-align:right;" colspan="4">Total Amount</td>
							<td><input type="text" class="form-control" name="sub_total_amount" id="allsum" readonly value="<?php echo $sub_total_amount_s1; ?>"/></td>
							<td></td><td></td><td></td>
							<td><input type="text" class="form-control" name="sub_total_amount_s2" id="allsum_s2" readonly  value="<?php echo $sub_total_amount_s2; ?>"/></td>
							<td></td><td></td><td></td>
							<td><input type="text" class="form-control" name="sub_total_amount_s3" id="allsum_s3" readonly  value="<?php echo $sub_total_amount_s3; ?>"/></td>
							<td></td><td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<script>
	var i = <?php echo $productSerial; ?>;
	function sum(idx) {
		var qty = parseFloat($('#quantity'+idx).val()) || 0;
		var price1 = parseFloat($('#unit_price'+idx).val()) || 0;
		var result1 = qty * price1;
		$('#sum'+idx).val(result1.toFixed(2));

		var price2 = parseFloat($('#unit_price_s2'+idx).val()) || 0;
		var result2 = qty * price2;
		$('#sum_s2'+idx).val(result2.toFixed(2));

		var price3 = parseFloat($('#unit_price_s3'+idx).val()) || 0;
		var result3 = qty * price3;
		$('#sum_s3'+idx).val(result3.toFixed(2));

		sum_total();
	}
	function sum_total() {
		var total1 = 0, total2 = 0, total3 = 0;
		for (var a = 0; a <= i; a++) {
			total1 += parseFloat($('#sum'+a).val()) || 0;
			total2 += parseFloat($('#sum_s2'+a).val()) || 0;
			total3 += parseFloat($('#sum_s3'+a).val()) || 0;
		}
		$('#allsum').val(total1.toFixed(2));
		$('#allsum_s2').val(total2.toFixed(2));
		$('#allsum_s3').val(total3.toFixed(2));
	}
	$(document).ready(function () {
		for (var a = 0; a <= i; a++) {
			sum(a);
		}
	});
	</script>
	
	<div class="row" style="background-color:#CDEFF7;">
		<div class="col-md-12">
			<div class="form-group">
				<label for="exampleId">Remarks</label>
				<textarea class="form-control" id="remarks" name="remarks"><?php echo $cs_info->remarks; ?></textarea>
			</div>
		</div>
		<div class="col-sm-12">
			
			<?php if (getRLPStatusBYID($cs_info->rlp_info_id)==1){ ?>
			<center><span style="color:red;font-weight:bold;">This RLP is Alredy Approved</span></center>
			<?php }else{ ?>
				<input type="submit" name="cs_update" id="submit" class="btn btn-block btn-primary" value="CS UPDATE" />
			<?php }?>
		</div>
	</div>
</form>
