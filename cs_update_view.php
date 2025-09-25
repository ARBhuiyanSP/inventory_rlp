<?php
    
	$rlp_id         =   $_GET['rlp_id'];
	$cs_id         =   getCsIDByRLPID($rlp_id);   
    $cs_details    =   getCsDetailsData($cs_id);   
    $cs_info       =   $cs_details['cs_info'];
    $cs_details    =   $cs_details['cs_details'];
?>


    <!-- Table row -->
	<div class="row" id="div1" style="">
		<div class="col-md-12">
			<div class="table">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th rowspan="2">Material Name</th>
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
								<input type="hidden" name="cs_details_id[]" value="<?php echo $editDatas->id ?? ''; ?>" >
								<select class="form-control select2" id="material_name<?php echo $key; ?>" name="material_name[]" required disabled>
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
							
							
							
							<td><input type="text" name="quantity[]" id="quantity<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->quantity ?? ''; ?>" readonly></td>
							
							<!-- Supplier 1 -->
							<td><input type="number" name="unit_price[]" id="unit_price<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_1 ?? ''; ?>" readonly></td>
							<td><input type="number" name="amount[]" id="sum<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_1 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name[]" disabled>
									<option value="">Select</option>
									<?php
									$vendors = getTableDataByTableName('vendors');
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_1) && $editDatas->supplier_id_1 == $data['vendor_name']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
											
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #138496;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="1" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_1) {echo 'checked';}  else {echo 'disabled';}?>></td>
							
							<!-- Supplier 2 -->
							<td><input type="number" name="unit_price_s2[]" id="unit_price_s2<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_2 ?? ''; ?>" readonly></td>
							<td><input type="number" name="amount_s2[]" id="sum_s2<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_2 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name_s2[]" disabled>
									<option value="">Select</option>
									<?php
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_2) && $editDatas->supplier_id_2 == $data['vendor_name']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #0b621f;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="2" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_2) {echo 'checked';} else {echo 'disabled';}?>></td>
							
							<!-- Supplier 3 -->
							<td><input type="number" name="unit_price_s3[]" id="unit_price_s3<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control" value="<?php echo $editDatas->unit_price_3 ?? ''; ?>" readonly></td>
							<td><input type="number" name="amount_s3[]" id="sum_s3<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->amount_3 ?? ''; ?>" readonly></td>
							<td>
								<select class="form-control select2" name="supplier_name_s3[]" disabled>
									<option value="">Select</option>
									<?php
									if (!empty($vendors)) {
										foreach ($vendors as $data) {
											?>
											<option value="<?php echo $data['id']; ?>" <?php if (isset($editDatas->supplier_id_3) && $editDatas->supplier_id_3 == $data['vendor_name']) {echo 'selected';} ?>>
												<?php echo $data['vendor_name']; ?>
											</option>
											<?php
										}
									}
									?>
								</select>
							</td>
							<td style="border-right:5px solid #C82333;"><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="3" <?php if (isset($editDatas->selected_supplier_id) && $editDatas->selected_supplier_id == $editDatas->supplier_id_3) {echo 'checked';}  else {echo 'disabled';}?> ></td>
						</tr>
						<?php }} ?>
						
						<tr>
							<td style="text-align:right;" colspan="3">Total Amount</td>
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
    <!-- /.row -->