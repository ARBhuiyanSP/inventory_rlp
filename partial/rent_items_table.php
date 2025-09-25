<table class="table table-bordered" id="dynamic_field">
	<thead>
		<th width="65%">Equipment<span class="reqfield"> *</span></th>
		<th width="15%">Rate<span class="reqfield"> *</span></th>
		<th width="15%">Contract/Rent Amount</th>
		<th></th>
	</thead>
	<tbody>
		<tr>
			<td>
				<select class="form-control material_select_2" name="equipments[]" id="equipments0" required >
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
			<input type="hidden" name="quantity[]" id="quantity0" onkeyup="sum(0)" value="1" class="form-control" readonly>
			
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
			$('#dynamic_field').append('<tr id="row' + i + '"><td><select class="form-control material_select_2" name="equipments[]" id="equipments' + i + '" required ><option value="">Select</option><?php $projectsData = getTableDataByTableName('equipments', '', 'eel_code');if (isset($projectsData) && !empty($projectsData)) { foreach ($projectsData as $data) {?><option value="<?php echo $data['eel_code']; ?>"><?php echo $data['name'].'-'.$data['eel_code']; ?></option><?php }}?></select></td><input type="hidden" name="quantity[]" id="quantity' + i + '" value="1" onkeyup="sum(' + i + ')" class="form-control" required><td><input type="number" name="unit_price[]" id="unit_price' + i + '" onkeyup="sum(' + i + ')" class="form-control" required></td><td><input type="text" name="totalamount[]" id="sum' + i + '" class="form-control" readonly ></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove btn-warning">X</button></td></tr>');
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
		
		let allsum = parseFloat($('#allsum').val()).toFixed(2);
		let discount = parseFloat($('#discount').val()).toFixed(2);
		
		let grandtotal = (parseFloat(allsum) - parseFloat(discount)).toFixed(2);
		$('#grandtotal').val(grandtotal).toFixed(2);
		
		
		
		

		
	
	}
	
	function due() {
				let paidamount = parseFloat($('#paidamount').val()).toFixed(2);
				let grandtotal = parseFloat($('#grandtotal').val()).toFixed(2);
				
				let dueamount = (parseFloat(grandtotal) - parseFloat(paidamount)).toFixed(2);
				$('#dueamount').val(dueamount).toFixed(2);
				
				
			}
</script>