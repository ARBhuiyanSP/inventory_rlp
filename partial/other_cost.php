<table class="table table-bordered" id="dynamic_fieldoc">
	<thead>
		<th width="55%">Other Cost Name<span class="reqfield"> *</span></th>
		<th width="15%">Qty<span class="reqfield"> *</span></th>
		<th width="15%">Rate<span class="reqfield"> *</span></th>
		<th width="15%">Amount</th>
		<th></th>
	</thead>
	<tbody>
		<tr>
			<td><input type="text" name="oc_name[]" id="oc_name0" class="form-control" required ></td>
			<td><input type="number" name="quantityoc[]" id="quantityoc0" value="1" onkeyup="sumoc(0)" class="form-control" required></td>
			<td><input type="number" name="unit_priceoc[]" id="unit_priceoc0" onkeyup="sumoc(0)" class="form-control" required></td>
			<td><input type="text" name="totalamountoc[]" onkeyup="sumoc(0)" id="sumoc0" class="form-control" readonly></td>
			<td><button type="button" name="addoc" id="addoc" class="btn btn-success">+</button></td>
		</tr>
	</tbody>
</table>
<table class="table table-bordered">
	<tr>
		<td colspan="3" style="text-align:right;">Total Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsumoc" readonly /></td>
	</tr>
</table>
<script>
	var i = 0;
	$(document).ready(function () {
		$('#addoc').click(function () {
			i++;
			$('#dynamic_fieldoc').append('<tr id="row' + i + '"><td><input type="text" name="oc_name[]" id="oc_name' + i + '" class="form-control" required ></td><td><input type="number" name="quantityoc[]" id="quantityoc' + i + '"  value="1" onkeyup="sumoc(' + i + ')" class="form-control" required></td><td><input type="number" name="unit_priceoc[]" id="unit_priceoc' + i + '" onkeyup="sumoc(' + i + ')" class="form-control" required></td><td><input type="text" name="totalamountoc[]" onkeyup="sumoc(' + i + ')" id="sumoc' + i + '" class="form-control" readonly ></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove btn-warning">X</button></td></tr>');
			$(".material_select_2").select2();
			$('#quantityoc' + i + ', #unit_priceoc' + i).change(function () {
				sumoc(i)
			});
		});

		$(document).on('click', '.btn_remove', function () {
			var button_id = $(this).attr("id");
			$('#row' + button_id + '').remove();
			sumoc_total();
		});
	});

	$(document).ready(function () {
		//this calculates values automatically 
		sumoc(0);
	});

	function sumoc(i) {
		var quantityoc1 = document.getElementById('quantityoc' + i).value;
		var unit_priceoc1 = document.getElementById('unit_priceoc' + i).value;
		var result = parseFloat(quantityoc1) * parseFloat(unit_priceoc1);
		if (!isNaN(result)) {
			document.getElementById('sumoc' + i).value = result;
		}
		sumoc_total();
	}
	function sumoc_total() {
		var newTot = 0;
		for (var a = 0; a <= i; a++) {
			aVal = $('#sumoc' + a);
			if (aVal && aVal.length) {
				newTot += aVal[0].value ? parseFloat(aVal[0].value) : 0;
			}
		}
		document.getElementById('allsumoc').value = newTot.toFixed(2);
	}
</script>