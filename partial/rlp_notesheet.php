<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    $rlp_id         =   $_GET['rlp_id'];    
    $rlp_details    =   getRlpDetailsDataForNs($rlp_id);   
    $rlp_info       =   $rlp_details['rlp_info'];
    $rlp_details    =   $rlp_details['rlp_details'];
?>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<!-- Main content -->
<section class="invoice">
    <form action="" method="POST" enctype="multipart/form-data">
    <!-- title row -->
    <div class="row">
        <div class="col-xs-12">
            <h2 class="page-header">
                <i class="fa fa-file"></i> RLP Details.
                <small class="pull-right">Priority: <?php echo getPriorityNameDiv($rlp_info->priority) ?></small>
            </h2>
        </div>
        <!-- /.col -->
    </div>
    <!-- info row -->
    <div class="row invoice-info">
        <div class="col-sm-4 col-md-4">
            From
            <address>
                <strong>Name:&nbsp;<?php echo $rlp_info->request_person ?></strong><br>
                <!-- Designation:&nbsp;<?php echo getDesignationNameById($rlp_info->designation) ?><br> -->
                Division:&nbsp;<?php echo getDivisionNameById($rlp_info->request_division) ?><br>
                Department:&nbsp;<?php echo getDepartmentNameById($rlp_info->request_department) ?><br>
                Project:&nbsp;<?php echo getProjectNameById($rlp_info->request_project) ?><br>
                <input type="hidden" name="request_project" value="<?php echo $rlp_info->request_project; ?>" />
				Warehouse:&nbsp;<?php echo getWarehouseNameById($rlp_info->request_warehouse) ?><br>
                <input type="hidden" name="request_warehouse" value="<?php echo $rlp_info->request_warehouse; ?>" />
            </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-8 col-md-8">
            <div style="text-align:right">
				<?php $notesheetNo    =   get_notesheet_no(); ?>
                <b>Notesheet NO: &nbsp;<span class="rlpno_style"><?php echo $notesheetNo; ?></span></b><br>
                <input type="hidden" name="notesheet_no" value="<?php echo $notesheetNo; ?>">
				
                <b>RLP NO: &nbsp;<span class="rlpno_style"><?php echo $rlp_info->rlp_no ?></span></b><br>
                <input type="hidden" name="rlp_no" value="<?php echo $rlp_info->rlp_no; ?>">
                <b>Request Date:</b> <?php echo human_format_date($rlp_info->created_at) ?><br>
				<input type="hidden" name="type" value="<?php echo $rlp_info->rlp_type; ?>">
            </div>            
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->

    <!-- Table row -->
        <div class="row">
            <div class="col-xs-3">
				<div class="form-group">
					<label for="exampleId">Date</label>
					<input name="request_date" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" autocomplete="off" />
				</div>
			</div>
			<div class="col-xs-9">
				<div class="form-group">
					<label for="exampleId">Subject</label>
					<input name="subject" type="text" class="form-control" id="subject" value="" autocomplete="off" />
				</div>
			</div>
            <div class="col-xs-6">
				<div class="form-group">
					<label for="exampleId">Ref. Text/ NS Info</label>
					<input name="ns_info" type="text" class="form-control" id="subject" value="" autocomplete="off" />
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Supplier</label><span class="reqfield"> ***required</span>
					<select class="form-control material_select_2" id="supplier_name" name="supplier_name" required onchange="getItemCodeByParam(this.value, 'suppliers', 'code', 'supplier_id');">
						<option value="">Select</option>
						<?php
						$projectsData = getTableDataByTableName('suppliers');

						if (isset($projectsData) && !empty($projectsData)) {
							foreach ($projectsData as $data) {
								?>
								<option value="<?php echo $data['id']; ?>"><?php echo $data['name']; ?></option>
								<?php
							}
						}
						?>
					</select>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Supplier ID</label>
					<input type="text" name="supplier_id" id="supplier_id" class="form-control" readonly required>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="form-group">
					<label for="id">Currency</label>
					<select name="currency" class="form-control" required >
						<option value="">Select Currency</option>
						<option value="BDT">Bangladeshi Taka</option>
						<option value="USD">US Dollar</option>
					</select>
				</div>
			</div>
			<div class="col-xs-12 table-responsive">
                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Item Name</th>
                            <th>Part No</th>
                            <th>Purpose of Purchase</th>
                            <th width="10%">Quantity</th>
                            <th width="10%">Unit Price</th>
                            <th width="10%">Total</th>
                            <th>Remarks</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_posts_body">
                        <?php
                        $sl =   1;
                            foreach($rlp_details as $key => $data){
								
                        ?>
                        <tr id="row<?php echo $data->id ?>">
                            <td><?php echo $sl++; ?></td>
							<input type="hidden" class="form-control" name="rlp_details_id[]" id="" value="<?php echo $data->id; ?>" readonly >
							
                            <td><input type="text" class="form-control" name="" id="" value="<?php $dataresult =   getDataRowByTableAndId('inv_material', $data->material_name);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : ''); ?>" readonly ></td>
							<td><input type="text" class="form-control" name="" id="" value="<?php echo (isset($data->part_no) && !empty($data->part_no) ? $data->part_no : ""); ?>" readonly ></td>
							
                            <input type="hidden" class="form-control" name="item[]" id="" value="<?php echo (isset($data->material_name) && !empty($data->material_name) ? $data->material_name : ""); ?>" readonly >
							
							<td><input type="text" class="form-control" name="purpose[]" id="purpose" value="<?php
								echo (isset($data->purpose) && !empty($data->purpose) ? $data->purpose : ''); ?>" readonly ></td>
                            <td><input type="number" class="form-control" onkeyup="caltotal(<?php echo $data->id; ?>)" name="quantity[]" id="quantity_<?php echo $data->id; ?>" value="<?php echo (isset($data->quantity) && !empty($data->quantity) ? $data->quantity : ""); ?>" required ></td>
                            <td><input type="number" class="form-control" onkeyup="caltotal(<?php echo $data->id; ?>)" name="unit_price[]" id="unit_price_<?php echo $data->id; ?>" step=".01" value="" required ></td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control total_amount" name="total[]" id="total_<?php echo $data->id; ?>" value="" readonly >
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="remarks[]" value="">
                                    
                                </div>
                            </td>
                            <?php if ($key == 0) { ?>
                            <td><button type="button" name="remove" id="<?php echo $data->id; ?>" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td>
                    <?php } else { ?>
                            <td><button type="button" name="remove" id="<?php echo $data->id; ?>" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td>
                    <?php } ?>
                        </tr>                        
                            <?php } ?>
							
                        <?php //if(is_super_admin($currentUserId)){ ?>                       
					   <tr>
                            <td colspan="5" style="text-align:right">Sub Total : </td>
							<td>
								<input type="text" class="form-control" name="sub_total" onchange="calculate_total_buy_amount()" id="allcur" readonly />
                            </td>
                            <td></td>
                        </tr>
						<tr>
                            <td colspan="3" style="text-align:right">Discount Amount : </td>
							<td colspan="2">
								<input type="number" class="form-control" id="discount" onkeyup="calculate_total_buy_amount()" step=".01" required /><small style="color:red">Type '0' If Not Applicable</small>
                            </td>
							<td>
								<input type="text" class="form-control" name="discount" id="discountamount" readonly />
                            </td>
                            <td></td>
                        </tr>
						<!------------------>
						<tr>
                            <td colspan="5" style="text-align:right">Total After Discount : </td>
							<td>
								<input type="text" class="form-control" name="total_afterdiscount" onchange="calculate_total_buy_amount()" id="allcur_after_discount" readonly />
                            </td>
                            <td></td>
                        </tr>
						<!------------------>
						<tr>
                            <td colspan="3" style="text-align:right">AIT [%] : </td>
							<td colspan="2">
								<input type="number" class="form-control" id="ait" onkeyup="calculate_total_buy_amount()" step=".01" required /><small style="color:red">Type '0' If Not Applicable</small>
                            </td>
							<td>
								<input type="text" class="form-control" name="ait" id="aitamount" readonly />
                            </td>
                            <td></td>
                        </tr>
						<tr>
                            <td colspan="3" style="text-align:right">VAT [%] : </td>
							<td colspan="2">
								<input type="number" class="form-control" id="vat" onkeyup="calculate_total_buy_amount()" step=".01" required /><small style="color:red">Type '0' If Not Applicable</small>
                            </td>
							<td>
								<input type="text" class="form-control" name="vat" id="vatamount" readonly />
                            </td>
                            <td></td>
                        </tr>
						<tr>
                            <td colspan="5" style="text-align:right">Total : </td>
							<td>
								<input type="text" class="form-control" name="" id="grandTotal" readonly />
                            </td>
                            <td></td>
                        </tr>
						
						
						<tr>
                            <td colspan="3" style="text-align:right">Others : </td>
							<td colspan="2">
								<input type="number" class="form-control" id="other" onkeyup="calculate_total_buy_amount()" step=".01" required /><small style="color:red">Type '0' If Not Applicable</small>
                            </td>
							<td>
								<input type="text" class="form-control" name="others" id="otheramount" readonly />
                            </td>
                            <td></td>
                        </tr>
						<!------------------>
						<tr>
                            <td colspan="5" style="text-align:right">Total After others : </td>
							<td>
								<input type="text" class="form-control" name="grand_total" onchange="calculate_total_buy_amount()" id="allcur_after_other" readonly />
                            </td>
                            <td></td>
                        </tr>
						
                        <?php //}?>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
			<div class="col-md-6">
                <div class="form-group">
                    <label for="exampleId">Attachment</label>
                    <input class="" type="file" id="" name="sn_prt_file">
                </div>
            </div>
			<div class="col-md-12">
                <div class="form-group">
                    <label for="exampleId">Terms & Conditions</label>
					<textarea class="form-control code_preview0" id="" name="terms_condition" style="height: 150px;">
						<ul>

							<li>Date of Commencement</li>

							<li>Delivery of Goods: Within 03(Three) days after receiving the work order.</li>

							<li>Mode of payment: After 45 days from the date of bill Submission.</li>

							<li>The above rate includes VAT, AIT &amp; other Taxes.</li>

							<li>Transport &amp; Courier costs will be charged by Buyers.</li>

						</ul>
					</textarea>
                </div>
            </div>
        </div>
		<div class="row">
			<div class="col-md-12">
				<?php echo get_user_wise_notesheet_chain_for_create(); ?>
			</div>
			<input type="submit" class="btn btn-primary btn-block" name="create_notesheet" value="Generate Note Sheet">
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
	$('#others').on('input', function() {
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
		// other
			let pOther = parseFloat($('#other').val()).toFixed(2);
			$('#otheramount').val(pOther);
			let otherTotal = (parseFloat(grandTotal) + parseFloat(pOther)).toFixed(2);
			$('#allcur_after_other').val(otherTotal);
		// others end
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
