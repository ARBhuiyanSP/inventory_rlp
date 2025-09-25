<form action="" method="post" enctype="multipart/form-data">
<style>
.table-bordered th, .table-bordered td{
	border: 1px solid #000 !important;
}
</style>
<?php $vendors = getTableDataByTableName('vendors'); ?>
<!-- Top Supplier Selection -->
<div class="row" style="background-color:#E3F2FD;margin-bottom:15px;padding:10px;">
    <div class="col-sm-4">
        <label>Supplier 1:</label>
        <select class="form-control select2" name="supplier_top[1]" required>
            <option value="">Select Supplier 1</option>
            <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
        </select>
    </div>
    <div class="col-sm-4">
        <label>Supplier 2:</label>
        <select class="form-control select2" name="supplier_top[2]" required>
            <option value="">Select Supplier 2</option>
            <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
        </select>
    </div>
    <div class="col-sm-4">
        <label>Supplier 3:</label>
        <select class="form-control select2" name="supplier_top[3]" required>
            <option value="">Select Supplier 3</option>
            <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
        </select>
    </div>
</div>

<!-- Product Table -->
<!-- Table Header with Supplier Selection -->
<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>Material Name</th>
            <th>Unit</th>
            <th>Qty</th>
            <th colspan="5" class="text-center" style="background-color:#138496;color:#fff;">
                Supplier 1
                <br>
                <input type="radio" name="selected_supplier_heading" value="1" class="supplier_heading_radio">
            </th>
            <th colspan="5" class="text-center" style="background-color:#0b621f;color:#fff;">
                Supplier 2
                <br>
                <input type="radio" name="selected_supplier_heading" value="2" class="supplier_heading_radio">
            </th>
            <th colspan="5" class="text-center" style="background-color:#C82333;color:#fff;">
                Supplier 3
                <br>
                <input type="radio" name="selected_supplier_heading" value="3" class="supplier_heading_radio">
            </th>
        </tr>
        <tr>
            <th>Unit Price</th><th>Amount</th><th>Selected</th><th>Supplier Name</th><th>Attachment</th>
            <th>Unit Price</th><th>Amount</th><th>Selected</th><th>Supplier Name</th><th>Attachment</th>
            <th>Unit Price</th><th>Amount</th><th>Selected</th><th>Supplier Name</th><th>Attachment</th>
        </tr>
    </thead>
    <tbody>
    <?php foreach($rlp_details as $key => $editDatas){ ?>
        <tr>
            <td>
                <select class="form-control select2" name="material_name[]" required>
                    <option value="">Select</option>
                    <?php foreach($products as $p){ $selected = ($editDatas->material_id==$p['id'])?'selected':''; echo "<option value='{$p['id']}' {$selected}>{$p['material_name']}</option>"; } ?>
                </select>
            </td>
            <td>
                <select class="form-control" name="unit[]" required>
                    <?php foreach($units as $u){ $selected = ($editDatas->unit==$u['id'])?'selected':''; echo "<option value='{$u['id']}' {$selected}>{$u['unit_name']}</option>"; } ?>
                </select>
            </td>
            <td><input type="text" class="form-control" name="quantity[]" value="<?php echo $editDatas->quantity; ?>" readonly></td>

            <!-- Supplier 1 -->
            <td><input type="number" name="unit_price[]" class="form-control" onchange="sum(<?php echo $key; ?>)"></td>
            <td><input type="number" name="amount[]" class="form-control" readonly></td>
            <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="1" class="row_selected_radio"></td>
            <td><input type="text" name="supplier_name[]" class="form-control" readonly></td>
            <td><input type="file" name="attachment_s1_<?php echo $key; ?>" class="form-control"></td>

            <!-- Supplier 2 -->
            <td><input type="number" name="unit_price_s2[]" class="form-control" onchange="sum(<?php echo $key; ?>)"></td>
            <td><input type="number" name="amount_s2[]" class="form-control" readonly></td>
            <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="2" class="row_selected_radio"></td>
            <td><input type="text" name="supplier_name_s2[]" class="form-control" readonly></td>
            <td><input type="file" name="attachment_s2_<?php echo $key; ?>" class="form-control"></td>

            <!-- Supplier 3 -->
            <td><input type="number" name="unit_price_s3[]" class="form-control" onchange="sum(<?php echo $key; ?>)"></td>
            <td><input type="number" name="amount_s3[]" class="form-control" readonly></td>
            <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="3" class="row_selected_radio"></td>
            <td><input type="text" name="supplier_name_s3[]" class="form-control" readonly></td>
            <td><input type="file" name="attachment_s3_<?php echo $key; ?>" class="form-control"></td>
        </tr>
    <?php } ?>
    </tbody>
</table>

<script>
// When heading supplier is chosen, mark all row radios automatically
$('.supplier_heading_radio').change(function(){
    var selected = $(this).val();
    $('.row_selected_radio').each(function(){
        if($(this).val() == selected){
            $(this).prop('checked', true);
        } else {
            $(this).prop('checked', false);
        }
    });
});
</script>


<script>
// Update amount calculation
function sum(idx){
    var qty = parseFloat($('input[name="quantity[]"]').eq(idx).val())||0;
    var price1 = parseFloat($('input[name="unit_price[]"]').eq(idx).val())||0;
    $('input[name="amount[]"]').eq(idx).val((qty*price1).toFixed(2));
    var price2 = parseFloat($('input[name="unit_price_s2[]"]').eq(idx).val())||0;
    $('input[name="amount_s2[]"]').eq(idx).val((qty*price2).toFixed(2));
    var price3 = parseFloat($('input[name="unit_price_s3[]"]').eq(idx).val())||0;
    $('input[name="amount_s3[]"]').eq(idx).val((qty*price3).toFixed(2));
}

// Set Supplier Names in header & row automatically
$('select[name="supplier_top[1]"], select[name="supplier_top[2]"], select[name="supplier_top[3]"]').change(function(){
    var sup1 = $('select[name="supplier_top[1]"] option:selected').text() || 'Supplier 1';
    var sup2 = $('select[name="supplier_top[2]"] option:selected').text() || 'Supplier 2';
    var sup3 = $('select[name="supplier_top[3]"] option:selected').text() || 'Supplier 3';

    // Update table headers
    $('#th_supplier1').text(sup1);
    $('#th_supplier2').text(sup2);
    $('#th_supplier3').text(sup3);

    // Update row supplier name fields
    $('input[name^="supplier_name"]').each(function(i){ $(this).val(sup1); });
    $('input[name^="supplier_name_s2"]').each(function(i){ $(this).val(sup2); });
    $('input[name^="supplier_name_s3"]').each(function(i){ $(this).val(sup3); });
});

$(document).ready(function(){
    $('select[name="supplier_top[1]"]').trigger('change');
});
</script>
