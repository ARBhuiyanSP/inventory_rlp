						
<table class="table table-bordered" id="dynamic_field">
    <thead>
    <th width="20%">Item Name<span class="reqfield"> ***</span></th>
    <th width="15%">Stock Lot</th>
    <th width="10%">Part No</th>
    <th width="10%">Unit</th>
    <th width="10%">In Stock</th>
    <th width="10%">Unit Price</th>
    <th width="10%">Qty<span class="reqfield"> ***</span></th>
    <th width="10%">Amount</th>
    <th width="5%"></th>
    </thead>
    <tbody>
        <tr>
            <td>
                <select class="form-control material_select_2" id="material_name" name="material_name[]" required onchange="getItemCodeByParam(this.value, 'inv_material', 'material_id_code', 'material_id0', 'qty_unit',$(this));">
                    <option value="">Select</option>
                    <?php
					$graterThanZero=1;
                    $projectsData = get_product_with_category($graterThanZero);
                    if (isset($projectsData) && !empty($projectsData)) {
                        foreach ($projectsData as $data) {
                            ?>
                            <option value="<?php echo $data['id']; ?>"><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?> - <?php echo $data['item_code']; ?></option>
                            <?php
                        }
                    }
                    ?>
                </select>
            </td>
            <td>
			<input type="hidden" name="material_id[]" id="material_id0" class="form-control" required readonly>
			<select class="form-control product_price_id material_select_2" id="product_price_id0" name="product_price_id[]">
				<option></option>
			</select>
			</td>
            <td><input type="text" name="part_no[]" id="part_no0" class="form-control" required readonly></td>
            <td>
                <select class="form-control" id="unit0" name="unit[]" required readonly>
                    <option value="">Select Unit</option>
                    <?php
                    $projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                    if (isset($projectsData) && !empty($projectsData)) {
                        foreach ($projectsData as $data) {
                            ?>
                            <option value="<?php echo $data['id']; ?>"><?php echo $data['unit_name']; ?></option>
                            <?php
                        }
                    }
                    ?>
                </select>
            </td>
            <td><input type="text" name="material_total_stock[]" id="material_total_stock0" class="form-control" readonly ></td>
			<td><input type="text" name="unit_price[]" id="unit_price0" class="form-control" readonly ></td>
            <td><input type="number" name="quantity[]" id="quantity0" onchange="sum(0)" onkeyup="check_stock_quantity_validation(0)" class="form-control common_issue_quantity" step="any" min="0" required></td>
			<td><input type="text" name="totalamount[]" id="sum0" class="form-control" readonly></td>
            <td><button type="button" name="add" id="add" class="btn" style="background-color:#007BFF;color:#ffffff;">+</button></td>
        </tr>
    </tbody>
</table>
<table class="table table-bordered">
	<tr>
		<td width="80%" style="text-align:right;">Total Amount</td>
		<td><input type="text" class="form-control" maxlength="30" name="sub_total_amount" id="allsum" readonly /></td>
	</tr>
</table>
<script>
    var i = 0;
    $(document).ready(function () {
        $('#add').click(function () {    
        var this_row_this = $(this);    
        console.log(this_row_this)    
            i++;
            $('#dynamic_field').append('<tr id="row' + i + '"><td><select class="form-control material_select_2" id="material_name' + i + '" name="material_name[]" required onchange="getAppendItemCodeByParam(' + i + ",'inv_material'," + "'material_id_code'," + "'material_id'," + "'qty_unit'" + ')"><option value="">Select</option><?php
                                    $projectsData = get_product_with_category();
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?><option value="<?php echo $data['id']; ?>"><?php echo $data['material_name']; ?> - <?php echo $data['part_no']; ?> - <?php echo $data['spec']; ?> - <?php echo $data['item_code']; ?></option><?php
                                        }
                                    }
                                    ?></select></td><td><input type="hidden" name="material_id[]" id="material_id' + i + '" class="form-control" required readonly><select class="form-control product_price_id material_select_2" id="product_price_id' + i + '" name="product_price_id[]"><option></option></select></td><td><input type="text" name="part_no[]" id="part_no' + i + '" class="form-control" required readonly></td><td><select class="form-control select2" id="unit' + i + '" name="unit[]' + i + '" required readonly onchange="getAppendItemCodeByParam(' + i + ",'inv_material'" + ",'material_id_code'" + ",'material_id''" + ",'qty_unit'" + ')"><option value="">Select</option><?php
                                    $projectsData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                                    if (isset($projectsData) && !empty($projectsData)) {
                                        foreach ($projectsData as $data) {
                                            ?><option value="<?php echo $data['id']; ?>"><?php echo $data['unit_name']; ?></option><?php
                                        }
                                    }
                                    ?></select></td><td><input type="text" name="material_total_stock[]" id="material_total_stock' + i + '" class="form-control" readonly></td><td><input type="text" name="unit_price[]" id="unit_price' + i + '" class="form-control" readonly></td><td><input type="number" name="quantity[]" id="quantity' + i + '" onchange="sum(0)"  onkeyup="check_stock_quantity_validation(' + i + ')" class="form-control common_issue_quantity" step="any" min="0" required></td><td><input type="text" name="totalamount[]" id="sum' + i + '" class="form-control" readonly></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td></tr>');
            
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