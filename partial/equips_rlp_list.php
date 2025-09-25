<?php
$equipsRlpListData = getEquipsRLPListData();


if (isset($equipsRlpListData) && !empty($equipsRlpListData)) {
    ?>
    <div class="table-responsive">
        <table id="rlp_list_table" class="table table-bordered table-striped list-table-custom-style">
            <thead>
                <tr>
                    <th>SLN#</th>
                    <th>RLP No</th>
                    <th>Request Date</th>
                    <th>Purpose</th>
                    <th>Created By</th>
                    <th>Project</th>
                    <th>Status</th>
                    <th width="25%">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sl = 0;
                $delUrl =   "function/rlp_process.php?process_type=rlp_delete";
                //$approve_url =   "function/rlp_process.php?process_type=rlp_approve";
                $role       =   get_role_group_short_name();
                if($role    ==  "member"){
                    //include 'rrr_update_view_member.php';
                    $approve_url =   "function/rlp_process.php?process_type=rlp_dh_common_update_execute";
                }elseif($role    ==  "dh"){
                    //include 'rrr_update_view_dh.php';
                    $approve_url =   "function/rlp_process.php?process_type=rlp_dh_common_update_execute";
                }elseif($role    ==  "ab"){
                    //include 'rrr_update_view_ab.php';
                    $approve_url =   "function/rlp_process.php?process_type=rlp_ab_common_update_execute";
                }else{
                    //include 'rrr_update_view_dh.php';
                    $approve_url =   "function/rlp_process.php?process_type=rlp_dh_common_update_execute";
                }
                foreach ($equipsRlpListData as $adata) {
					
					$rlp_id = $adata->id;
					$equips_rlp_details    =   getEquipsRlpDetailsData($rlp_id);   
					$equips_rlp_info       =   $equips_rlp_details['equips_rlp_info'];
					$equips_rlp_details    =   $equips_rlp_details['equips_rlp_details'];
                    ?>
                    <tr id="row_id_<?php echo $adata->id; ?>">
                        <td><?php echo ++$sl; ?> </td>
                        <td>
                            <div title="RLP quick view" onclick="rlp_quick_view('<?php echo $adata->id ?>');" style="cursor: pointer;padding: 2% 2%; font-weight: bold; background-color: <?php echo get_status_color($adata->rlp_status); ?>">
                                <span>
                                    <?php echo (isset($adata->equips_rlp_no) && !empty($adata->equips_rlp_no) ? $adata->equips_rlp_no : 'No data'); ?>
                                </span>
                            </div>
                        </td>
                        <td><?php echo (isset($adata->request_date) && !empty($adata->request_date) ? human_format_date($adata->created_at) : 'No data'); ?></td>
						
                        <td><?php  foreach($equips_rlp_details as $dataDetails){ echo $dataDetails->purpose.','; }?></td>
						
                        <td><?php echo (isset($adata->rlp_user_id) && !empty($adata->rlp_user_id) ? getUserNameByUserId($adata->rlp_user_id) : 'No data'); ?></td>
                        <td><?php echo (isset($adata->request_project) && !empty($adata->request_project) ? getProjectNameById($adata->request_project) : 'No data'); ?></td>
                       
                        <td>
                            <div style="padding: 2% 10%; font-weight: bold; background-color: <?php echo get_status_color($adata->rlp_status); ?>">
                                <?php echo get_status_name($adata->rlp_status); ?>
                            </div>
                        </td>
                        <td>
                            
                            <a title="Edit RLP" class="btn btn-sm btn-info" href="rlp_update.php?rlp_id=<?php echo $adata->id; ?>">
                                <span class="fa fa-eye"> Details</span>
                            </a>
                            
							<?php if(check_permission('rlp-approve') && get_status_name($adata->rlp_status)!='Approve'){ ?>
                            <a title="Delete RLP" class="btn btn-sm btn-success" href="javascript:void(0)" onclick="commonApproveOperation('<?php echo $approve_url ?>', '<?php echo $adata->id ?>', '<?php echo $_SESSION['logged']['user_id'] ?>');">
                                <span class="fa fa-check"> Approve</span>
                            </a>
							<?php } ?>
                           
                            
                            <?php if(get_status_name($adata->rlp_status)=='Approve' && $adata->is_ns==0){ ?>
                            <a title="Make Notesheet" class="btn btn-sm btn-info" href="rlp_notesheet.php?rlp_id=<?php echo $adata->id; ?>">
                                <span class="fa fa-sticky-note-o"> Notesheet</span>
                            </a>
                            <?php } ?>
                            
                            <?php //if(hasAccessPermission($user_id_session, 'crlp', 'edit_access')){ ?>
                            <a title="Print RLP History" class="btn btn-sm btn-info bg-olive" href="rlp_view.php?rlp_id=<?php echo $adata->id; ?>">
                                <span class="fa fa-info-circle"> History</span>
                            </a>
                            <?php //} ?>  

                            
                            <a title="Print RLP" class="btn btn-sm btn-info bg-blue" href="rlp_print.php?rlp_id=<?php echo $adata->id; ?>">
                                <span class="fa fa-print"> Print</span>
                            </a>
                                                    
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
<?php } else { ?>
    <div class="alert alert-warning">
        <strong>Sorry there is no data!</strong>
    </div>
<?php } ?>

<script>
$(document).ready(function () {
    $('#rlp_list_table').DataTable({
        scrollY: '400px',
        scrollCollapse: true,
        paging: false,
    });
});
</script>