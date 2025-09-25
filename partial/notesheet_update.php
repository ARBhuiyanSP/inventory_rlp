<?php
    $currentUserId  	=   $_SESSION['logged']['user_id'];
    $notesheet_id  	 	=   $_GET['id'];    
    $notesheets    		=   getNotesheetDetailsData($notesheet_id);   
    $notesheets_master	=   $notesheets['notesheets_master'];
    $notesheets    		=   $notesheets['notesheets'];
?>
<!-- Main content -->
<section class="invoice">
    <!-- Info row -->
    <div class="row invoice-info">
        <div class="col-md-12">
			<center>
				<h5 align="center"><img src="images/spl.png" height="50"></h5>
				<h2>E-Engineering Limited</h2>
				<p>Khawaja Tower[13th Floor], 95 Bir Uttam A.K Khandokar Road, Mohakhali C/A, Dhaka-1212, Bangladesh</p>
				<h5><b>Note Sheet - [Req No: <?php echo $notesheets_master->notesheet_no ?>]</b></h5>
				<h5><b style="border:1px solid #000;padding:3px;border-radius:5px;">Project: <?php echo getProjectNameById($notesheets_master->request_project) ?></b></h5>
			</center>
			<h5><b>Subject : <?php echo $notesheets_master->subject ?></b></h5></br>
			<h5>
				<b>Supplier Name : <?php echo getNameByIdAndTable('suppliers',$notesheets_master->supplier_name) ?></b></br>
				<?php 
					$supplier_id = $notesheets_master->supplier_name;
					$sqls = "select * from `suppliers` where `id`='$supplier_id'";
					$results = mysqli_query($conn, $sqls);
					$rows = mysqli_fetch_array($results);
				?>
				Address : <?php echo $rows['address'];?></br>
				Concern person :  <?php echo $rows['contact_person'];?></br>
				Call :  <?php echo $rows['supplier_phone'];?>, E-Mail:  <?php echo $rows['email'];?></br>
			</h5>
		</div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
    <!-- table row -->
	<div class="row">
			<div class="col-md-12 table-responsive">
                <p><?php echo $notesheets_master->ns_info ?></p>
				<table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Item Description</th>
                            <th>Part No</th>
                            <th width="5%">QTY</th>
                            <th width="10%">Unit Price</th>
                            <th width="10%">Total</th>
                            <th width="20%">Remarks</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_posts_body">
                        <?php
							$sl =   1;
							$total = 0;
							$totalQty = 0;
                            foreach($notesheets as $data){
								$total += $data->total;
								$totalQty += $data->quantity;
                        ?>
                        <tr id="rec-1">
                            <td><?php echo $sl++; ?></td>
							
                            <td><?php $dataresult =   getDataRowByTableAndId('inv_material', $data->item);
								echo (isset($dataresult) && !empty($dataresult) ? $dataresult->material_description : ''); ?></td>
                            
                            <td><?php echo getMaterialPartNoByIdAndTableandId('inv_material', $data->item); ?></td>
                            <td><?php echo $data->quantity; ?></td>
                            <td><?php echo $data->unit_price; ?></td>
                            <td><?php echo $data->total; ?></td>
                            <td><?php echo $data->remarks; ?></td>
                        </tr>                        
                            <?php } ?>
						<tr id="rec-1">
                            <td colspan="5" style="text-align:right">Sub Total: </td>
                            <td><?php echo $notesheets_master->sub_total; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="5" style="text-align:right">AIT: </td>
                            <td><?php echo $notesheets_master->ait; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="5" style="text-align:right">VAT: </td>
                            <td><?php echo $notesheets_master->vat; ?></td>
                        </tr>
						<tr id="rec-1">
                            <td colspan="5" style="text-align:right">Grand Total: </td>
                            <td><?php echo $notesheets_master->grand_total; ?></td>
                        </tr>
						<tr id="rec-1">
                            <?php $currency = $notesheets_master->currency; ?>
							<td colspan="7" style="text-align:left"><b>In word: <?php echo convertNumberToWords($notesheets_master->grand_total,$currency); ?> Only</b></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
			
			<!---- Attachment View----->
			<div class="col-md-12">
				<?php if($notesheets_master->attached_file){ ?>
				<button class="btn btn-success" onclick=" window.open('uploads/file/<?php echo $notesheets_master->attached_file; ?>','_blank')"> Attachment</button>
				<?php }else{ ?>
					No Attachment Found
				<?php } ?>
				
			</div>
			<!---- Attachment View----->
        </div>
    <!-- /.row -->
    <?php
    $role       =   get_notesheet_role_group_short_name();
	
    
    if(is_super_admin($currentUserId)){
        include 'notesheet_update_view_sa.php';
    }elseif($role    ==  "member"){
        include 'notesheet_update_view_member.php';
    }elseif($role    ==  "dh"){
        include 'notesheet_update_view_dh.php';
    }elseif($role    ==  "ab"){
        include 'notesheet_update_view_ab.php';
    }else{
        include 'notesheet_update_view_dh.php';
    }
    ?>
</section>
<!-- /.content -->
<div class="clearfix"></div>