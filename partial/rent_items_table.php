<?php
$detailRowCount = isset($detailRowCount) ? (int)$detailRowCount : 1;
$invoiceDetails = isset($invoiceDetails) ? $invoiceDetails : [];
$billDaysValue = isset($billDaysValue) ? (int)$billDaysValue : 0;
$subTotalDisplay = isset($subTotalDisplay) ? $subTotalDisplay : '';
$discountDisplay = isset($discountDisplay) ? $discountDisplay : '';
$grandTotalDisplay = isset($grandTotalDisplay) ? $grandTotalDisplay : '';
$paidDisplay = isset($paidDisplay) ? $paidDisplay : '';
$dueDisplay = isset($dueDisplay) ? $dueDisplay : '';
$equipmentsOptions = getTableDataByTableName('equipments', '', 'eel_code');
$equipmentOptionsHtml = '<option value="">Select</option>';
if (!empty($equipmentsOptions)) {
    foreach ($equipmentsOptions as $data) {
        $eqCode = $data['eel_code'];
        $eqLabel = $data['name'].'-'.$data['eel_code'];
        $equipmentOptionsHtml .= '<option value="'.htmlspecialchars($eqCode).'">'.htmlspecialchars($eqLabel).'</option>';
    }
}

if (empty($invoiceDetails)) {
    $invoiceDetails[] = [
        'equipment_code'  => '',
        'operator_name'   => '',
        'full_time_hours' => '',
        'rate'            => '',
        'amount'          => '',
        'total_days'      => $billDaysValue,
    ];
    $detailRowCount = 1;
}
?>
<table class="table table-bordered" id="dynamic_field">
	<thead>
		<th width="35%">Equipment<span class="reqfield"> *</span></th>
		<th width="25%">Operator</th>
		<th width="12%">Full Time Hrs<span class="reqfield"> *</span></th>
		<th width="12%">Rate<span class="reqfield"> *</span></th>
		<th width="12%">Amount</th>
		<th width="4%"></th>
	</thead>
	<tbody>
		<?php foreach ($invoiceDetails as $index => $detailRow) {
			$equipmentValue = $detailRow['equipment_code'] ?? '';
			$operatorValue = $detailRow['operator_name'] ?? '';
			$hoursValue = $detailRow['full_time_hours'] ?? '';
			$rateValue = $detailRow['rate'] ?? '';
			$amountValue = $detailRow['amount'] ?? '';
			$rowDays = isset($detailRow['total_days']) ? (int)$detailRow['total_days'] : $billDaysValue;
			$hoursDisplay = ($hoursValue === '' || $hoursValue === null) ? '' : rtrim(rtrim(number_format((float)$hoursValue, 2, '.', ''), '0'), '.');
			$rateDisplay = ($rateValue === '' || $rateValue === null) ? '' : number_format((float)$rateValue, 2, '.', '');
			$amountDisplay = ($amountValue === '' || $amountValue === null) ? '' : number_format((float)$amountValue, 2, '.', '');
		?>
		<tr id="row<?php echo $index; ?>">
			<td>
				<select class="form-control select2" name="equipments[]" id="equipments<?php echo $index; ?>" data-selected="<?php echo htmlspecialchars($equipmentValue); ?>" required>
					<?php echo $equipmentOptionsHtml; ?>
				</select>
			</td>
			<td>
				<input type="text" name="operator[]" id="operator<?php echo $index; ?>" class="form-control" autocomplete="off" value="<?php echo htmlspecialchars($operatorValue); ?>">
			</td>
			<td>
				<input type="number" name="full_time_hours[]" id="full_time_hours<?php echo $index; ?>" class="form-control" min="0" step="0.01" value="<?php echo htmlspecialchars($hoursDisplay); ?>" <?php echo ($equipmentValue || $hoursDisplay !== '') ? '' : 'required'; ?>>
				<input type="hidden" name="quantity[]" id="quantity<?php echo $index; ?>" value="<?php echo htmlspecialchars(($hoursDisplay === '') ? '0' : $hoursDisplay); ?>" class="form-control">
				<input type="hidden" name="total_days[]" id="total_days<?php echo $index; ?>" value="<?php echo htmlspecialchars((string)$rowDays); ?>">
			</td>
			<td><input type="number" name="unit_price[]" id="unit_price<?php echo $index; ?>" onkeyup="sum(<?php echo $index; ?>)" class="form-control" min="0" step="0.01" value="<?php echo htmlspecialchars($rateDisplay); ?>" <?php echo ($equipmentValue || $rateDisplay !== '') ? '' : 'required'; ?>></td>
			<td><input type="text" name="totalamount[]" id="sum<?php echo $index; ?>" class="form-control" readonly value="<?php echo htmlspecialchars($amountDisplay); ?>"></td>
			<td>
				<?php if ($index === 0) { ?>
				<button type="button" name="add" id="add" class="btn btn-sm btn-success">+</button>
				<?php } else { ?>
				<button type="button" name="remove" id="<?php echo $index; ?>" class="btn btn_remove btn-warning">X</button>
				<?php } ?>
			</td>
		</tr>
		<?php } ?>
	</tbody>
</table>
<table class="table table-bordered">
	<tr>
		<td width="80%" style="text-align:right;">Total Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsum" value="<?php echo htmlspecialchars($subTotalDisplay); ?>" readonly /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Discount</td>
		<td><input type="text" class="form-control" maxlength="30" name="discount" id="discount" value="<?php echo htmlspecialchars($discountDisplay); ?>" /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Grand Total</td>
		<td><input type="text" class="form-control" maxlength="30" name="grandtotal" id="grandtotal" value="<?php echo htmlspecialchars($grandTotalDisplay); ?>" readonly /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Paid Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="paid_amount" id="paidamount" value="<?php echo htmlspecialchars($paidDisplay); ?>" /></td>
	</tr>
	<tr>
		<td width="80%" style="text-align:right;">Due Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="due_amount" id="dueamount" value="<?php echo htmlspecialchars($dueDisplay); ?>" readonly /></td>
	</tr>
</table>
<script>
	var i = <?php echo max($detailRowCount - 1, 0); ?>;
	var equipmentOptions = '<?php echo addslashes($equipmentOptionsHtml); ?>';

	$(document).ready(function () {
		$('#add').click(function () {
			i++;
			var newRow = '' +
				'<tr id="row' + i + '">' +
					'<td><select class="form-control select2" name="equipments[]" id="equipments' + i + '" data-selected="" required>' + equipmentOptions + '</select></td>' +
					'<td><input type="text" name="operator[]" id="operator' + i + '" class="form-control" autocomplete="off"></td>' +
					'<td><input type="number" name="full_time_hours[]" id="full_time_hours' + i + '" class="form-control" min="0" step="0.01" required><input type="hidden" name="quantity[]" id="quantity' + i + '" value="0" class="form-control"><input type="hidden" name="total_days[]" id="total_days' + i + '" value=""></td>' +
					'<td><input type="number" name="unit_price[]" id="unit_price' + i + '" onkeyup="sum(' + i + ')" class="form-control" min="0" step="0.01" required></td>' +
					'<td><input type="text" name="totalamount[]" id="sum' + i + '" class="form-control" readonly ></td>' +
					'<td><button type="button" name="remove" id="' + i + '" class="btn btn_remove btn-warning">X</button></td>' +
				'</tr>';
			$('#dynamic_field tbody').append(newRow);
			$('#equipments' + i).select2();
			attachRowEvents(i);
			updateRowDays(i, getSelectedMonthDays());
		});

		$(document).on('click', '.btn_remove', function () {
			var button_id = $(this).attr("id");
			$('#row' + button_id + '').remove();
			sum_total();
		});
	});

	$(document).ready(function () {
		for (var idx = 0; idx <= i; idx++) {
			var selectEl = $('#equipments' + idx);
			if (selectEl.length) {
				if (!selectEl.hasClass('select2-hidden-accessible')) {
					selectEl.select2();
				}
				var preset = selectEl.data('selected');
				if (typeof preset !== 'undefined') {
					if (preset) {
						selectEl.val(preset).trigger('change');
					} else {
						selectEl.val('').trigger('change');
					}
				}
			}
			attachRowEvents(idx);
			if ($('#full_time_hours' + idx).val() !== '' || $('#unit_price' + idx).val() !== '') {
				sum(idx);
			}
		}
		updateAllMonthDays();
		sum_total();
	});

	$(document).on('input', '#discount', function () {
		sum_total();
	});

	$(document).on('input', '#paidamount', function () {
		due();
	});

	$(document).on('change', '#bill_month_global, #bill_year_global', function () {
		updateAllMonthDays();
	});

	function sum(i) {
		var hoursField = document.getElementById('full_time_hours' + i);
		var unitPriceField = document.getElementById('unit_price' + i);
		var quantityField = document.getElementById('quantity' + i);
		if (!hoursField || !unitPriceField || !quantityField) {
			return;
		}
		var hours = parseFloat(hoursField.value);
		var unit_price1 = parseFloat(unitPriceField.value);
		if (isNaN(hours)) {
			hours = 0;
		}
		if (isNaN(unit_price1)) {
			unit_price1 = 0;
		}
		quantityField.value = hours;
		var result = hours * unit_price1;
		document.getElementById('sum' + i).value = isNaN(result) ? '' : result.toFixed(2);
		sum_total();
	}

	function sum_total() {
		var newTot = 0;
		for (var a = 0; a <= i; a++) {
			var aVal = $('#sum' + a);
			if (aVal && aVal.length) {
				newTot += aVal[0].value ? parseFloat(aVal[0].value) : 0;
			}
		}
		document.getElementById('allsum').value = newTot.toFixed(2);

		let allsumVal = parseFloat($('#allsum').val());
		if (isNaN(allsumVal)) {
			allsumVal = 0;
		}
		let discountVal = parseFloat($('#discount').val());
		if (isNaN(discountVal)) {
			discountVal = 0;
		}

		let grandtotal = (allsumVal - discountVal).toFixed(2);
		$('#grandtotal').val(grandtotal);

		due();
	}

	function due() {
		let paidamount = parseFloat($('#paidamount').val());
		if (isNaN(paidamount)) {
			paidamount = 0;
		}
		let grandtotal = parseFloat($('#grandtotal').val());
		if (isNaN(grandtotal)) {
			grandtotal = 0;
		}

		let dueamount = (grandtotal - paidamount).toFixed(2);
		$('#dueamount').val(dueamount);
	}

	function attachRowEvents(rowIndex) {
		var hoursSelector = '#full_time_hours' + rowIndex;
		var rateSelector = '#unit_price' + rowIndex;

		$(hoursSelector + ',' + rateSelector).off('input.sum change.sum').on('input.sum change.sum', function () {
			sum(rowIndex);
		});
	}

	function getSelectedMonthDays() {
		var selectedMonth = parseInt($('#bill_month_global').val(), 10);
		var selectedYear = parseInt($('#bill_year_global').val(), 10);

		if (isNaN(selectedMonth) || selectedMonth < 1 || selectedMonth > 12 || isNaN(selectedYear)) {
			return '';
		}

		return new Date(selectedYear, selectedMonth, 0).getDate();
	}

	function updateRowDays(rowIndex, monthDays) {
		var totalDaysField = $('#total_days' + rowIndex);
		if (!totalDaysField.length) {
			return;
		}
		totalDaysField.val(monthDays || '');
	}

	function updateAllMonthDays() {
		var monthDays = getSelectedMonthDays();
		if (monthDays !== '') {
			$('#bill_days_global').val(monthDays);
		}

		for (var idx = 0; idx <= i; idx++) {
			updateRowDays(idx, monthDays);
		}
	}
</script>
