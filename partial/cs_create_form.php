<style>
.table-bordered th, .table-bordered td{
    border : 1px solid #000 !important;
}
</style>

<form action="" method="post" enctype="multipart/form-data">
   <!-- RLP Info -->
   <div class="row" style="background-color:#CDEFF7;">
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Division:</label>
				<input type="text" class="form-control" value="<?php echo getDivisionNameById($rlp_info->request_division) ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $rlp_info->request_division; ?>" />
				
			</div>
		</div>
		<div class="col-sm-3">
			<div class="form-group">
				<label for="sel1">Department:</label>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($rlp_info->request_department) ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $rlp_info->request_department; ?>" />
				
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Project:</label>
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($rlp_info->request_project) ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $rlp_info->request_project; ?>" />
			</div>
		</div>
		
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1">Warehouse:</label>
				 <input type="text" class="form-control" value="<?php echo getWarehouseNameById($rlp_info->request_warehouse) ?>" readonly />
				 <input name="request_warehouse" type="hidden" value="<?php echo $rlp_info->request_warehouse; ?>" />
				 
			</div>
		</div>
		<div class="col-sm-2">
            <div class="form-group">
                <label for="exampleId">RLP Type</label>
                
				<input type="text" class="form-control" name=""  value="<?php 
								if($rlp_info->rlp_type=='1')
								{
									echo "General RLP";
								}else if($rlp_info->rlp_type=='2'){
									echo "Stationary RLP";
								}else if($rlp_info->rlp_type=='4'){ 
									echo "Battery Stationary RLP";
								}else if($rlp_info->rlp_type=='3'){
									echo "EHS RLP";
								} else {
									echo "---";
								}
							?>" readonly>
				
                <input type="hidden" class="form-control" name="rlp_type"  value="<?php echo $rlp_info->rlp_type; ?>" readonly>
				
            </div>
		</div>
	
		<div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="date" type="text" class="form-control" id="rlpdate" value="<?php echo $rlp_info->request_date; ?>" size="30" autocomplete="off" required />
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Priority</label>
                <div class="radio">
                    <?php
                        $priorities     =   get_priorities();
                        if(isset($priorities) && !empty($priorities)){
                            foreach($priorities as $priority){
                    ?>
                            <label><input type="radio" name="priority" value="<?php echo $priority->id; ?>" required <?php if($priority->id == $rlp_info->priority){echo 'checked';} ?>>                                
                                <span class="label btn-sm btn-<?php echo $priority->color_code; ?>"><?php echo $priority->name; ?></span>
                            </label>
                    <?php
                    } 
                        }
                    ?>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">RLP No</label>
                <div class="rlpno_style" style="background-color:green;color:#fff;padding:2px;"><?php echo $rlp_info->rlp_no; ?></div>
                <input type="hidden" name="rlp_no" value="<?php echo $rlp_info->rlp_no; ?>">
                <input type="hidden" name="rlp_info_id" value="<?php echo $rlp_info->id; ?>">
            </div>
        </div>
    </div>

   <?php $vendors = getTableDataByTableName('vendors'); ?>

   <!-- Top Supplier Selection + Attachments -->
  

   <!-- Items Table -->
   <div class="row" id="div1">
      <div class="col-md-12">
         <div class="table-responsive">
            <table class="table table-bordered table-striped">
               <thead>
                  <tr>
                      <th rowspan="2">Material Name</th>
                      <th rowspan="2">Unit</th>
                      <th rowspan="2">Qty</th>
                      <th colspan="4" class="text-center" style="background-color:#138496;color:#fff;">
                          <span id="th_supplier1">Supplier 1</span>
						  <select class="form-control select2" name="supplier_top[1]" required>
							   <option value="">Select Supplier 1</option>
							   <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
						   </select>
						   <input type="file" name="attachment_s1" class="form-control">
                          
                          <input type="radio" name="selected_supplier_heading" value="1" class="supplier_heading_radio">
                      </th>
                      <th colspan="4" class="text-center" style="background-color:#0b621f;color:#fff;">
                          <span id="th_supplier2">Supplier 2</span>
						  <select class="form-control select2" name="supplier_top[2]" required>
							   <option value="">Select Supplier 2</option>
							   <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
						   </select>
						   <input type="file" name="attachment_s2" class="form-control">
                          
                          <input type="radio" name="selected_supplier_heading" value="2" class="supplier_heading_radio">
                      </th>
                      <th colspan="4" class="text-center" style="background-color:#C82333;color:#fff;">
                          <span id="th_supplier3">Supplier 3</span>
						  <select class="form-control select2" name="supplier_top[3]" required>
							   <option value="">Select Supplier 3</option>
							   <?php foreach($vendors as $v){ echo "<option value='{$v['id']}'>{$v['vendor_name']}</option>"; } ?>
						   </select>
						   <input type="file" name="attachment_s3" class="form-control">
                          
                          <input type="radio" name="selected_supplier_heading" value="3" class="supplier_heading_radio">
                      </th>
                  </tr>
                  <tr>
                      <th>Rate</th>
                      <th>Amount</th>
                      <th></th>
                      <th>Supplier</th>
                      <th>Rate</th>
                      <th>Amount</th>
                      <th></th>
                      <th>Supplier</th>
                      <th>Rate</th>
                      <th>Amount</th>
                      <th></th>
                      <th>Supplier</th>
                  </tr>
               </thead>
               <tbody>
                  <?php
                  $productSerial = 0;
                  if (isset($rlp_details) && !empty($rlp_details)) {
                      foreach ($rlp_details as $key => $editDatas) {
                          $productSerial++;
                  ?>
                  <tr id="row<?php echo $key; ?>">
                      <td>
                          <input type="text" name="rlp_details_id[]" value="<?php echo $editDatas->id ?? ''; ?>">
                          <select class="form-control select2" name="material_name[]" required>
                              <option value="">Select</option>
                              <?php
                              $projectsData = get_product_with_category();
                              foreach ($projectsData as $data) {
                                  echo "<option value='{$data['id']}' ".(($editDatas->material_id ?? '')==$data['item_code']?'selected':'').">{$data['material_name']}</option>";
                              }
                              ?>
                          </select>
                      </td>
                      <input type="hidden" name="material_id[]" value="<?php echo $editDatas->material_id ?? ''; ?>">

                      <td>
                          <select class="form-control" name="unit[]" required>
                              <option value="">Select</option>
                              <?php
                              $unitData = getTableDataByTableName('inv_item_unit', '', 'unit_name');
                              foreach ($unitData as $data) {
                                  echo "<option value='{$data['id']}' ".(($editDatas->unit ?? '')==$data['id']?'selected':'').">{$data['unit_name']}</option>";
                              }
                              ?>
                          </select>
                      </td>

                      <td><input type="text" name="quantity[]" id="quantity<?php echo $key; ?>" class="form-control" value="<?php echo $editDatas->quantity ?? ''; ?>" readonly></td>

                      <!-- Supplier 1 -->
                      <td><input type="number" name="unit_price[]" id="unit_price<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control"></td>
                      <td><input type="number" name="amount[]" id="sum<?php echo $key; ?>" class="form-control" readonly></td>
                      <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="1" class="row_selected_radio"></td>
                      <td><input type="text" name="supplier_name[]" class="form-control" readonly></td>

                      <!-- Supplier 2 -->
                      <td><input type="number" name="unit_price_s2[]" id="unit_price_s2<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control"></td>
                      <td><input type="number" name="amount_s2[]" id="sum_s2<?php echo $key; ?>" class="form-control" readonly></td>
                      <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="2" class="row_selected_radio"></td>
                      <td><input type="text" name="supplier_name_s2[]" class="form-control" readonly></td>

                      <!-- Supplier 3 -->
                      <td><input type="number" name="unit_price_s3[]" id="unit_price_s3<?php echo $key; ?>" onchange="sum(<?php echo $key; ?>)" class="form-control"></td>
                      <td><input type="number" name="amount_s3[]" id="sum_s3<?php echo $key; ?>" class="form-control" readonly></td>
                      <td><input type="radio" name="selected_supplier[<?php echo $key; ?>]" value="3" class="row_selected_radio"></td>
                      <td><input type="text" name="supplier_name_s3[]" class="form-control" readonly></td>
                  </tr>
                  <?php }} ?>

                  <tr>
                      <td style="text-align:right;" colspan="4">Total Amount</td>
                      <td><input type="text" class="form-control" name="sub_total_amount" id="allsum" readonly /></td>
                      <td></td>
					  <td></td>
					  <td></td>
                      <td><input type="text" class="form-control" name="sub_total_amount_s2" id="allsum_s2" readonly /></td>
                      <td></td>
					  <td></td>
					  <td></td>
                      <td><input type="text" class="form-control" name="sub_total_amount_s3" id="allsum_s3" readonly /></td>
                      <td></td>
                      <td></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>

   <!-- JS -->
   <script>
   // Auto select supplier radios when heading chosen
   $('.supplier_heading_radio').change(function(){
       var selected = $(this).val();
       $('.row_selected_radio').each(function(){
           $(this).prop('checked', $(this).val() == selected);
       });
   });

   var i = <?php echo $productSerial; ?>;
   function sum(idx) {
       var qty = parseFloat($('#quantity'+idx).val()) || 0;
       var price1 = parseFloat($('#unit_price'+idx).val()) || 0;
       $('#sum'+idx).val((qty*price1).toFixed(2));

       var price2 = parseFloat($('#unit_price_s2'+idx).val()) || 0;
       $('#sum_s2'+idx).val((qty*price2).toFixed(2));

       var price3 = parseFloat($('#unit_price_s3'+idx).val()) || 0;
       $('#sum_s3'+idx).val((qty*price3).toFixed(2));

       sum_total();
   }
   function sum_total() {
       var total1=0,total2=0,total3=0;
       for (var a=0; a<=i; a++) {
           total1 += parseFloat($('#sum'+a).val())||0;
           total2 += parseFloat($('#sum_s2'+a).val())||0;
           total3 += parseFloat($('#sum_s3'+a).val())||0;
       }
       $('#allsum').val(total1.toFixed(2));
       $('#allsum_s2').val(total2.toFixed(2));
       $('#allsum_s3').val(total3.toFixed(2));
   }
   $(document).ready(function () {
       for (var a=0;a<=i;a++){ sum(a); }
   });

   // Supplier names update
   $('select[name="supplier_top[1]"], select[name="supplier_top[2]"], select[name="supplier_top[3]"]').change(function(){
       var sup1 = $('select[name="supplier_top[1]"] option:selected').text() || 'Supplier 1';
       var sup2 = $('select[name="supplier_top[2]"] option:selected').text() || 'Supplier 2';
       var sup3 = $('select[name="supplier_top[3]"] option:selected').text() || 'Supplier 3';

       $('#th_supplier1').text(sup1);
       $('#th_supplier2').text(sup2);
       $('#th_supplier3').text(sup3);

       $('input[name^="supplier_name"]').val(sup1);
       $('input[name^="supplier_name_s2"]').val(sup2);
       $('input[name^="supplier_name_s3"]').val(sup3);
   }).trigger('change');
   </script>

   <!-- Remarks + Submit -->
   <div class="row" style="background-color:#CDEFF7;">
       <div class="col-md-12">
           <div class="form-group">
               <label for="exampleId">Remarks</label>
               <textarea class="form-control" id="remarks" name="remarks"></textarea>
           </div>
       </div>
       <div class="col-sm-12">
           <input type="submit" name="cs_create" id="submit" class="btn btn-block btn-primary" value="CREATE CS" />
       </div>
   </div>
</form>
