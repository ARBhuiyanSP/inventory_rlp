<table class="table table-bordered" id="dynamic_field">
	<thead>
		<th width="24%">Equipment<span class="reqfield"> *</span></th>
		<th width="14%">Operator</th>
		<th width="11%">Rent Date<span class="reqfield"> *</span></th>
		<th width="11%">Return Date<span class="reqfield"> *</span></th>
		<th width="10%">Total Days</th>
		<th width="10%">Total Hrs</th>
		<th width="10%">Rate<span class="reqfield"> *</span></th>
		<th width="10%">Contract/Rent Amount</th>
		<th width="6%"></th>
	</thead>
	<tbody>
		<tr>
			<td>
				<select class="form-control select2" name="equipments[]" id="equipments0" required >
					<option value="">Select</option>
					<?php
					$projectsData = getRentableEquipments();
					if (isset($projectsData) && !empty($projectsData)) {
						foreach ($projectsData as $data) {
							?>
							<option value="<?php echo $data['eel_code']; ?>"><?php echo $data['name'].'-'.$data['eel_code']; ?></option>
							<?php
						}
					}
					?>
				</select>
			</td>
			<td>
				<input type="text" name="operator[]" id="operator0" class="form-control" autocomplete="off">
			</td>
			<td>
				<input type="text" name="rent_date[]" id="rent_date0" class="form-control datepicker rent-date" data-row="0" value="<?php echo date('Y-m-d'); ?>" autocomplete="off" required>
			</td>
			<td>
				<input type="text" name="return_date[]" id="return_date0" class="form-control datepicker return-date" data-row="0" autocomplete="off" required>
			</td>
			<td>
				<input type="text" name="total_days[]" id="total_days0" class="form-control" readonly>
				<input type="hidden" name="quantity[]" id="quantity0" value="0" class="form-control">
			</td>
			<td>
				<input type="number" name="total_hours[]" id="total_hours0" class="form-control" min="0" step="0.01">
			</td>
			<td><input type="number" name="unit_price[]" id="unit_price0" onkeyup="sum(0)" class="form-control" required></td>
			<td><input type="text" name="totalamount[]" id="sum0" class="form-control" readonly></td>
			<td><button type="button" name="add" id="add" class="btn btn-sm btn-success">+</button></td>
		</tr>
	</tbody>
</table>
<table class="table table-bordered">
	<tr>
		<td width="80%" style="text-align:right;">Total Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsum" readonly /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Discount</td>
		<td><input type="text" class="form-control" maxlength="30" name="discount" onkeyup="sum(0)" id="discount" /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Grand Total</td>
		<td><input type="text" class="form-control" maxlength="30" name="grandtotal" id="grandtotal" readonly /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Paid Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="paid_amount" onkeyup="due()" id="paidamount" /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Due Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="due_amount" id="dueamount" readonly /></td>
	</tr>
</table>
<script>
	var i = 0;
	$(document).ready(function () {
		$('#add').click(function () {
			i++;
			$('#dynamic_field').append('<tr id="row' + i + '"><td><select class="form-control material_select_2" name="equipments[]" id="equipments' + i + '" required ><option value="">Select</option><?php $projectsData = getTableDataByTableName('equipments', '', 'eel_code');if (isset($projectsData) && !empty($projectsData)) { foreach ($projectsData as $data) {?><option value="<?php echo $data['eel_code']; ?>"><?php echo $data['name'].'-'.$data['eel_code']; ?></option><?php }}?></select></td><td><input type="text" name="operator[]" id="operator' + i + '" class="form-control" autocomplete="off"></td><td><input type="text" name="rent_date[]" id="rent_date' + i + '" class="form-control datepicker rent-date" data-row="' + i + '" autocomplete="off" required></td><td><input type="text" name="return_date[]" id="return_date' + i + '" class="form-control datepicker return-date" data-row="' + i + '" autocomplete="off" required></td><td><input type="text" name="total_days[]" id="total_days' + i + '" class="form-control" readonly><input type="hidden" name="quantity[]" id="quantity' + i + '" value="0" class="form-control"></td><td><input type="number" name="total_hours[]" id="total_hours' + i + '" class="form-control" min="0" step="0.01"></td><td><input type="number" name="unit_price[]" id="unit_price' + i + '" onkeyup="sum(' + i + ')" class="form-control" required></td><td><input type="text" name="totalamount[]" id="sum' + i + '" class="form-control" readonly ></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove btn-warning">X</button></td></tr>');
			$(".material_select_2").select2();
			attachRowEvents(i);
		});

		$(document).on('click', '.btn_remove', function () {
			var button_id = $(this).attr("id");
			$('#row' + button_id + '').remove();
			sum_total();
		});
	});

	$(document).ready(function () {
		// initialize events for first row
		attachRowEvents(0);
		calculateDays(0);
		//this calculates values automatically 
		sum(0);
	});

	function sum(i) {
		var quantityField = document.getElementById('quantity' + i);
		var unitPriceField = document.getElementById('unit_price' + i);
		if (!quantityField || !unitPriceField) {
			return;
		}
		var quantity1 = parseFloat(quantityField.value);
		var unit_price1 = parseFloat(unitPriceField.value);
		if (isNaN(quantity1)) {
			quantity1 = 0;
		}
		if (isNaN(unit_price1)) {
			unit_price1 = 0;
		}
		var result = quantity1 * unit_price1;
		document.getElementById('sum' + i).value = isNaN(result) ? '' : result.toFixed(2);
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
		
		let allsum = parseFloat($('#allsum').val()).toFixed(2);
		let discount = parseFloat($('#discount').val());
		if (isNaN(discount)) {
			discount = 0;
		}
		
		let grandtotal = (parseFloat(allsum) - parseFloat(discount)).toFixed(2);
		$('#grandtotal').val(grandtotal).toFixed(2);
		
		
		
		

		
	
	}
	
	function due() {
				let paidamount = parseFloat($('#paidamount').val()).toFixed(2);
				let grandtotal = parseFloat($('#grandtotal').val()).toFixed(2);
				
				let dueamount = (parseFloat(grandtotal) - parseFloat(paidamount)).toFixed(2);
				$('#dueamount').val(dueamount).toFixed(2);
				
				
			}

	function attachRowEvents(rowIndex) {
		var rentSelector = '#rent_date' + rowIndex;
		var returnSelector = '#return_date' + rowIndex;
		$(rentSelector + ', ' + returnSelector).datepicker({
			dateFormat: 'yy-mm-dd'
		});
		$(rentSelector).off('change.calculateDays').on('change.calculateDays', function () {
			calculateDays(rowIndex);
		});
		$(returnSelector).off('change.calculateDays').on('change.calculateDays', function () {
			calculateDays(rowIndex);
		});
	}

	function calculateDays(rowIndex) {
		var rentVal = $('#rent_date' + rowIndex).val();
		var returnVal = $('#return_date' + rowIndex).val();
		var rentDate = parseDateString(rentVal);
		var returnDate = parseDateString(returnVal);
		var diffDays = 0;
		var hasValidDates = false;

		if (rentDate && returnDate) {
			var diffTime = returnDate.getTime() - rentDate.getTime();
			if (diffTime >= 0) {
				diffDays = Math.floor(diffTime / 86400000);
				hasValidDates = true;
			}
		}

		$('#total_days' + rowIndex).val(hasValidDates ? diffDays : '');
		$('#quantity' + rowIndex).val(hasValidDates ? diffDays : 0);
		sum(rowIndex);
	}

	function parseDateString(value) {
		if (!value) {
			return null;
		}
		var parts = value.split('-');
		if (parts.length !== 3) {
			return null;
		}
		var year = parseInt(parts[0], 10);
		var month = parseInt(parts[1], 10) - 1;
		var day = parseInt(parts[2], 10);
		if (isNaN(year) || isNaN(month) || isNaN(day)) {
			return null;
		}
		return new Date(year, month, day);
	}
</script>