<?php
$csListData = getCSListDataW();


if (isset($csListData) && !empty($csListData)) {
    ?>
    <div class="table-responsive">
        <table id="rlp_list_table" class="table table-bordered table-striped list-table-custom-style">
            <thead>
                <tr>
                    <th>SLN#</th>
                    <th>CS No</th>
                    <th>RLP No</th>
                    <th>Request Date</th>
                    <th>Created By</th>
                    <th>Project</th>
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
                foreach ($csListData as $adata) {
					$cs_details    =   getCsDetailsData($adata['id']);   
					$cs_info       =   $cs_details['cs_info'];
					$cs_details    =   $cs_details['cs_details'];
                    ?>
                    <tr id="row_id_<?php echo $adata->id; ?>">
                        <td><?php echo ++$sl; ?> </td>
                        <td>
                            <div title="RLP quick view" onclick="rlp_quick_view('<?php echo $adata['id'] ?>');" style="cursor: pointer;padding: 2% 2%; font-weight: bold; background-color: <?php echo get_status_color($adata['rlp_status']); ?>">
                                <span>
                                    <?php echo (isset($adata['cs_no']) && !empty($adata['cs_no']) ? $adata['cs_no'] : 'No data'); ?>
                                </span>
                            </div>
                        </td>
                        <td><?php echo (isset($adata['rlp_no']) && !empty($adata['rlp_no']) ? $adata['rlp_no'] : 'No data'); ?></td>
						
                        <td><?php echo (isset($adata['request_date']) && !empty($adata['request_date']) ? human_format_date($adata['request_date']) : 'No data'); ?></td>
						
                       
						
						
                        <td><?php echo (isset($adata['created_by']) && !empty($adata['created_by']) ? getUserNameByUserId($adata['created_by']) : 'No data'); ?></td>
                        <td><?php echo (isset($adata['request_project']) && !empty($adata['request_project']) ? getProjectNameById($adata['request_project']) : 'No data'); ?></td>
                       
                        
                        <td>
                            
                            <a title="CS VIEW" class="btn btn-sm btn-info" href="cs_view.php?id=<?php echo $adata['id']; ?>">
                                <span class="fa fa-eye"> Details</span>
                            </a>
							
							<a title="CS VIEW" class="btn btn-sm btn-danger" href="cs_edit.php?id=<?php echo $adata['id']; ?>">
                                <span class="fa fa-pen"> Edit</span>
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