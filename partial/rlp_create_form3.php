<?php
    $currentUserId  =   $_SESSION['logged']['user_id'];
    // if(!empty($_SESSION['logged']['branch_id']) && !empty($_SESSION['logged']['department_id']))
    if(!empty($_SESSION['logged']['branch_id'])){
?>
<script type="text/javascript">
        $(document).ready(function(){

            $(document).on('keydown', '.employeeid', function() {
                
                var id = this.id;
                var splitid = id.split('_');
                var index = splitid[1];

                $( '#'+id ).autocomplete({
                    source: function( request, response ) {
                        $.ajax({
                            url: "getEmpDetails.php",
                            type: 'post',
                            dataType: "json",
                            data: {
                                search: request.term,request:1
                            },
                            success: function( data ) {
                                response( data );
                            }
                        });
                    },
                    select: function (event, ui) {
                        $(this).val(ui.item.label); // display the selected text
                        var userid = ui.item.value; // selected id to input

                        // AJAX
                        $.ajax({
                            url: 'getEmpDetails.php',
                            type: 'post',
                            data: {userid:userid,request:2},
                            dataType: 'json',
                            success:function(response){
                                
                                var len = response.length;

                                if(len > 0){
                                    var id = response[0]['id'];
                                    var name = response[0]['name'];
                                    var designation = response[0]['designation'];
                                    var department = response[0]['department'];
                                    var division = response[0]['division'];
                                    var group = response[0]['group'];

                                    document.getElementById('name_'+index).value = name;
                                    document.getElementById('designation_'+index).value = designation;
                                    document.getElementById('department_'+index).value = department;
                                    document.getElementById('division_'+index).value = division;
                                    document.getElementById('group_'+index).value = group;
                                }  
                            }
                        });
                        return false;
                    }
                });
            });
        });
    </script>
<form action="" method="post">
	<div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Division:</label>
				<select class="form-control select2" id="branch_id" name="division" onchange="getDepartmentByBranch(this.value);" required >
					<option value="">Please select</option>
					<?php
					$table = "branch";
					$order = "ASC";
					$column = "name";
					$datas = getTableDataByTableNameRLP($table, $order, $column);
					foreach ($datas as $data) {
						?>
						<option value="<?php echo $data->id; ?>"><?php echo $data->name; ?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Department:</label>
				<select class="form-control select2" id="department_id" name="department" required >
					<option value="">Please select</option>
					
				</select>
			</div>
		</div>
		<div class="col-sm-2">
			<div class="form-group">
				<label for="sel1" style="color:#fff;">.</label>
				<input type="submit" name="getchain" id="getchain" class="form-control btn btn-block btn-primary" value="Get Approval Chain" />
			</div>
		</div>
	</div>
</form>
<?php 
if(isset($_POST['getchain'])){	
	$division_id	=	$_POST['division'];
	$department_id		=	$_POST['department'];
?>
<form action="" method="post">
    <div class="row">
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Division:</label>
				 <input type="text" class="form-control" value="<?php echo getDivisionNameById($division_id); ?>" readonly />
				 <input name="request_division" type="hidden" value="<?php echo $division_id; ?>" />
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Department:</label>
				 <input type="text" class="form-control" value="<?php echo getDepartmentNameById($department_id); ?>" readonly />
				 <input name="request_department" type="hidden" value="<?php echo $department_id; ?>" />
			</div>
		</div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="sel1">Project:</label>
				
				 <input type="text" class="form-control" value="<?php echo getProjectNameById($_SESSION['logged']['project_id']); ?>" readonly />
				 <input name="request_project" type="hidden" value="<?php echo $_SESSION['logged']['project_id']; ?>" />
				 
			</div>
		</div>
	</div>
	<!--------------Employee-------------->
					<div class="row">
						<div class="col-md-2">
                            <div class="form-group">
                                <label class="field_title">Requested For <span class="reqr"> ***</span></label>
								<input type='text' name="requested_id" class='form-control employeeid' id='employeeid_1' placeholder='Enter employee id No' required >
                            </div>
                        </div>
						<div class="col-md-2">
                            <div class="form-group">
                                <label class="field_title">Division</label>
                                <input type='text' name="" class='form-control division' id='division_1' readonly >
                            </div>
                        </div>
						<div class="col-md-2">
                            <div class="form-group">
                                <label class="field_title">Department</label>
                                <input type='text' name="" class='form-control department' id='department_1' readonly >
                            </div>
                        </div>
						<div class="col-md-2">
                            <div class="form-group">
                                <label class="field_title">Designation</label>
                                <input type='text' name="" class='form-control designation' id='designation_1' readonly >
                            </div>
                        </div>
						<div class="col-md-2">
							<div class="form-group">
								<label class="field_title">Group</label>
								<input type='text' name="" class='form-control group' id='group_1' readonly >
							</div>
						</div>
						<div class="col-md-2">
                            <div class="form-group">
                                <label class="field_title">Employee Name</label>
                                <input type='text' name="request_person" class='form-control name' id='name_1' required >
                            </div>
                        </div>
					</div>
					<!--------------Employee-------------->
	<div class="row">
		<div class="col-sm-4">
            <div class="form-group">
                <label for="exampleId">Date</label>
                <input name="date" type="text" class="form-control" id="rlpdate" value="<?php echo date("Y-m-d"); ?>" size="30" autocomplete="off" required />
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
                            <label><input type="radio" name="priority" value="<?php echo $priority->id; ?>" required>                                
                                <span class="label label-<?php echo $priority->color_code; ?>"><?php echo $priority->name; ?></span>
                            </label>
                    <?php
                    } 
                        }
                    ?>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-group" style="background-color:green;color:#fff;padding:2px;">
                <label for="exampleId">RLP No</label>
                <?php
				
				$prefix="RLP";
				$formater_length=3;				
				/* $division_id    =   $_SESSION['logged']['branch_id'];
				$department_id  =   $_SESSION['logged']['department_id'];
				$office_id      =   $_SESSION['logged']['office_id'];
				$user_id        =   $_SESSION['logged']['user_id']; */
				$division_id	=	$_POST['division'];
				$department_id		=	$_POST['department'];			
				$rlpNo    =   get_rlp_no($prefix,$formater_length); ?>
                <div class="rlpno_style"><?php echo $rlpNo; ?></div>
                <input type="hidden" name="rlp_no" value="<?php echo $rlpNo; ?>">
            </div>
        </div>
    </div>
	
	            	
					<table class="table table-bordered" id="dynamic_field">
                        <thead>
							<th width="37%">Item Description</th>
							<th width="27%">Purpose</th>
							<th width="8%">Qty <span class="reqfield"> ***</span></th>
							<th width="7%">Unit</th>
							<th width="8%">Unit Price</th>
							<th width="8%">Amount</th>
							<th width="5%"></th>
                        </thead>
						<tbody>
							<tr>
								<td><input type="text" name="description[]" id="" class="form-control" required ></td>
								<td><input type="text" name="purpose[]" id="" class="form-control" required ></td>
								<td><input type="number" name="quantity[]" onkeyup="sum(0)" id="quantity0" class="form-control common_issue_quantity" required></td>
								<td>
									<select class="form-control" name="unit[]">
										<option value="PCS">PCS</option>
										<option value="NOS">NOS</option>
										<option value="GALLON">GALLON</option>
										<option value="SET">SET</option>
										<option value="INCH">INCH</option>
										<option value="KG">KG</option>
										<option value="LTR">LTR</option>
										<option value="FEET">FEET</option>
										<option value="PACKET">PACKET</option>
									</select>
								</td>
								<td><input type="text" name="unit_price[]" id="unit_price0" onkeyup="sum(0)" class="form-control" ></td>
								<td><input type="text" name="amount[]" id="sum0" class="form-control sub_sell_amount" readonly ></td>
								
								<!-- End: text QTY and Unit Price and Total amount -->
								
								<td><button type="button" name="add" id="add" class="btn" style="background-color:#007BFF;color:#ffffff;">+</button></td>
							</tr>
						</tbody>
                    </table>
					<table class="table table-bordered">
						<tr>
							<input type="hidden" class="form-control" maxlength="10" name="total_cur" id="allcur" value="" readonly />
							<td width="80%" style="text-align:right;"><b>Total Amount: </b></td>
							<td><input type="text" class="form-control" maxlength="10" name="total_amount" id="allsum" readonly /></td>
						</tr>
                    </table>
					<script>
						var i = 0;
						$(document).ready(function () {
							$('#add').click(function () {
								i++;
								$('#dynamic_field').append('<tr id="row' + i + '"><td><input type="text" name="description[]" id="" class="form-control" required></td><td><input type="text" name="purpose[]" id="" class="form-control" required></td><td><input type="number" name="quantity[]" onkeyup="sum(' + i + ')" id="quantity' + i + '" class="form-control common_issue_quantity" required></td><td><select class="form-control" name="unit[]"><option value="PCS">PCS</option><option value="NOS">NOS</option><option value="GALLON">GALLON</option><option value="SET">SET</option><option value="INCH">INCH</option><option value="KG">KG</option><option value="LTR">LTR</option><option value="FEET">FEET</option><option value="PACKET">PACKET</option></select></td><td><input type="text" name="unit_price[]" id="unit_price' + i + '" onkeyup="sum(' + i + ')" class="form-control"></td><td><input type="text" name="amount[]" id="sum' + i + '" class="form-control" readonly ></td><td><button type="button" name="remove" id="' + i + '" class="btn btn_remove" style="background-color:#f26522;color:#ffffff;">X</button></td></tr>');
								$(".material_select_2").select2();
								
								<!-- COMMENTS: QTY AND UNIT PRICE AND TOTAL AMOUNT -->
								$('#cur_price' + i + ', #unit_price' + i).change(function () {
									buy_amount(i)
								});						
								$('#quantity' + i + ', #unit_price' + i).change(function () {
									 sum(i)
								});
							});

							$(document).on('click', '.btn_remove', function () {
								var button_id = $(this).attr("id");
								$('#row' + button_id + '').remove();
								calculate_total_buy_amount();
								sum_total();
							});
						});

						
						function buy_amount(i) {
							let myQty = document.getElementById('quantity' + i).value;
							let myBuyPrice = document.getElementById('buy_price' + i).value;
							let subBuyAmount = parseFloat(myQty * myBuyPrice);
							if (!isNaN(subBuyAmount)) {
								document.getElementById('buy_amount' + i).value = subBuyAmount.toFixed(2);
							}
							calculate_total_buy_amount();
						}
						
					 
						function sum(i) {
							let quantity1 = document.getElementById('quantity' + i).value;
							let unit_price1 = document.getElementById('unit_price' + i).value;
							let result = parseFloat(quantity1 * unit_price1);
							if (!isNaN(result)) {
								document.getElementById('sum' + i).value = result;
							}
							sum_total();
						}
						function calculate_total_buy_amount() {
							let subBuyAmount     =   $(".sub_buy_amount");
							let subBuyTotal     =   0;

							for(let mySubValue = 0;  mySubValue < subBuyAmount.length; mySubValue++){
								subBuyTotal+= parseFloat($("#" + subBuyAmount[mySubValue].id).val());
							}
							
							document.getElementById('allcur').value = subBuyTotal.toFixed(2);
									
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

						function calculate_profit_amount() {
							let subBuyAmount     =   $("#allcur").val();
							let subSellTotal     =   $("#netsale").val();
							let profitTotal     =   parseFloat((subSellTotal - subBuyAmount));

							
							
							document.getElementById('profitamount').value = profitTotal.toFixed(2);
						}
						
						$(function () {
						  $("#allsum, #discount").keyup(function () {
							$("#netsale").val(+$("#allsum").val() - +$("#discount").val());
							calculate_profit_amount();
						  });
						});

						$(function () {
						  $("#netsale, #paid").keyup(function () {
							$("#due").val(+$("#netsale").val() - +$("#paid").val());
						  });
						});
					</script>		
								
    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <label for="exampleId">Remarks</label>
                <textarea class="form-control" id="remarks" name="remarks"></textarea>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <?php //echo get_user_project_wise_rlp_chain_for_create(); ?>
            <?php echo get_user_department_wise_rlp_chain_for_create($division_id, $department_id); ?>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <input type="submit" name="rlp_create" id="submit" class="btn btn-block btn-primary" value="Request" />
        </div>
    </div>
</form>
<div style="display:none;">
    <table id="sample_table">
        <tr id="">
            <td><span class="sn"></span>.</td>
            <td><textarea class="form-control" id="" name="description[]" rows="1" required></textarea></td>
            <td><input type="text" class="form-control" id="" name="purpose[]" value="" size=""  required /></td>
            <td><input type="text" class="form-control" id="" name="quantity[]" value="" size=""  required /></td>
            <td><a class="btn btn-xs delete-record" data-id="0"><i class="glyphicon glyphicon-trash"></i></a></td>
        </tr>
    </table>
</div>

    <?php }else{ ?>
    <div class="alert alert-warning">
      <strong>Attention !</strong> Division and Department are required to create RLP .
    </div>
    <?php } ?>
<?php } else{ ?>
 <strong>Attention !</strong> Division and Department are required to create RLP .
<?php } ?>
