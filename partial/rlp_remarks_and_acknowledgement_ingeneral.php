<div class="col-md-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">Remarks History</h4>
        </div>
        <div class="panel-body" style="max-height:400px; overflow-y:auto;">
            <?php
            $table = "rlp_remarks_history WHERE rlp_info_id=$rlp_id";
            $order = 'DESC';
            $column = 'remarks_date';
            $allRemarksHistory = getTableDataByTableNameRlp($table, $order, $column);
            if (!empty($allRemarksHistory)) {
                foreach ($allRemarksHistory as $dat) {
                    ?>
                    <div class="media" style="border-bottom:1px solid #eee; padding:8px 0;">
                        <div class="media-body">
                            <h5 class="media-heading">
                                <strong><?php echo getUserNameByUserId($dat->user_id); ?></strong>
                                <span class="text-muted pull-right small">
                                    <?php echo human_format_date($dat->remarks_date); ?>
                                </span>
                            </h5>
                            <p><?php echo nl2br($dat->remarks); ?></p>
                        </div>
                    </div>
                <?php
                }
            }
            ?>
            <!-- Last user remarks -->
            <div class="media" style="padding:8px 0;">
                <div class="media-body">
                    <h5 class="media-heading">
                        <strong><?php echo getUserNameByUserId($rlp_info->rlp_user_id); ?></strong>
                        <span class="text-muted pull-right small">
                            <?php echo human_format_date($rlp_info->created_at); ?>
                        </span>
                    </h5>
                    <p><?php echo nl2br($rlp_info->user_remarks); ?></p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-md-4">
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">Acknowledgement History</h4>
        </div>
        <div class="panel-body" style="max-height:400px; overflow-y:auto;">
            <?php
            $table = "rlp_acknowledgement WHERE rlp_info_id=$rlp_id";
            $order = 'DESC';
            $column = 'ack_request_date';
            $allRemarksHistory = getTableDataByTableNameRlp($table, $order, $column);
            if (!empty($allRemarksHistory)) {
                foreach ($allRemarksHistory as $dat) {
                    ?>
                    <div class="panel panel-default" style="margin-bottom:10px;">
                        <div class="panel-heading" style="background:#f9f9f9;">
                            <h5 class="panel-title">
                                <strong><?php echo getUserNameByUserId($dat->user_id) ?></strong> 
                                <small>(<?php echo getDesignationByUserId($dat->user_id) ?>)</small>
                            </h5>
                        </div>
                        <div class="panel-body" style="padding:10px;">
                            <table class="table table-bordered table-condensed">
                                <tr>
                                    <td><strong>Status</strong></td>
                                    <td>
                                        <span class="label" style="background-color: <?php echo get_status_color($dat->ack_status); ?>;">
                                            <?php echo get_status_name($dat->ack_status); ?>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>Updated at</strong></td>
                                    <td><?php echo (!empty($dat->ack_updated_date) ? human_format_date($dat->ack_updated_date) : ""); ?></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                <?php
                }
            } else {
                ?>
                <div class="alert alert-info">
                    <strong>No data found!</strong>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
