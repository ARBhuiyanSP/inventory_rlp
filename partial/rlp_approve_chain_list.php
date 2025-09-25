<?php
$table      = 'rlp_access_chain';
$order      = 'ASC';
$column     = 'id';
$dataType   = 'obj';
$agencyData = getTableDataByTableName($table, $order, $column, $dataType);
if (isset($agencyData) && !empty($agencyData)) {
    ?>
    <div class="table-responsive">
        <table id="rlp_chain_list" class="table table-bordered table-striped list-table-custom-style">
            <thead>
                <tr>
                    <th>SLN#</th>
                    <th>Chain Type</th>
                    <th>Division</th>
                    <th>Department</th>
                    <th>Project</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sl     =   0;
                $delUrl =   "function/rlp_chain_process.php?process_type=rlp_chain_delete";
                foreach ($agencyData as $adata) {
                    ?>
                    <tr id="row_id_<?php echo $adata->id; ?>">
                        <td><?php echo ++$sl; ?></td>
                        <td>
							<?php 
								if($adata->rlp_type=='1')
								{
									echo "General RLP";
								}else if($adata->rlp_type=='2'){
									echo "Stationary RLP";
								}else if($adata->rlp_type=='4'){ 
									echo "Battery Stationary RLP";
								}else if($adata->rlp_type=='3'){
									echo "EHS RLP";
								} else {
									echo "---";
								}
							?>
						</td>
                        <td><?php echo (isset($adata->division_id) && !empty($adata->division_id) ? getDivisionNameById($adata->division_id) : 'No data'); ?></td>
                        <td><?php echo (isset($adata->department_id) && !empty($adata->department_id) ? getDepartmentNameById($adata->department_id) : 'No data'); ?></td>
                        <td><?php echo (isset($adata->project_id) && !empty($adata->project_id) ? getProjectNameById($adata->project_id) : 'No data'); ?></td>
                        <td>
                            <a title="Edit User" class="btn btn-sm btn-info" href="rlp_approve_chain_update.php?chain_id=<?php echo $adata->id; ?>">
                                <i class="fas fa-edit"></i>
                            </a>
                            
                            <a title="Delete User" class="btn btn-sm btn-danger" href="javascript:void(0)" onclick="commonDeleteOperation('<?php echo $delUrl ?>', '<?php echo $adata->id ?>');">
                                <i class="fa fa-times-circle"></i>
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