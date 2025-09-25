<?php
$rentListData = getrentListData();


if (isset($rentListData) && !empty($rentListData)) {
    ?>
    <div class="table-responsive">
        <table id="rlp_list_table" class="table table-bordered table-striped" width="100%">
            <thead>
                <tr>
                    <th>Invoice  No</th>
                    <th>Request Date</th>
                    <th>Equipments</th>
                    <th>Client</th>
                    <th>Contract Amount</th>
                    <th>Invoiced Amount</th>
                    <th>Due Amount</th>
                    <th width="25%">Action</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sl = 0;
                foreach ($rentListData as $adata) {
					
					$rent_id = $adata->id;
					$rent_details    =   getRentDetailsData($rent_id);   
					$rent_info       =   $rent_details['rents'];
					$rent_details    =   $rent_details['rent_details'];
                    ?>
                    <tr id="row_id_<?php echo $adata->id; ?>">
                        <td><?php echo (isset($adata->challan_no) && !empty($adata->challan_no) ? $adata->challan_no : ''); ?> </td>
                        
                        <td><?php echo (isset($adata->date) && !empty($adata->date) ? date("jS F Y", strtotime($adata->date)) : 'No data'); ?></td>
						
                        <td><?php  foreach($rent_details as $dataDetails){ echo $dataDetails->eel_code.','; }?></td>
						
                   
                        <td><?php echo (isset($adata->client_name) && !empty($adata->client_name) ? getNameByIdAndTable('clients',$adata->client_name) : 'No data'); ?>
						</td>
						
                        <!--<td><?php //echo (isset($adata->project_name) && !empty($adata->project_name) ? getProjectNameById($adata->project_name) : 'No data'); ?></td> -->
                       
                        <td><?php echo (isset($adata->grandtotal) && !empty($adata->grandtotal) ? $adata->grandtotal : ''); ?> </td>
                        <td><?php echo (isset($adata->deposit_amount) && !empty($adata->deposit_amount) ? $adata->deposit_amount : ''); ?> </td>
                        <td><?php echo (isset($adata->due_amount) && !empty($adata->due_amount) ? $adata->due_amount : ''); ?> </td>
                        <td>
                            
                            <a title="Edit RLP" class="btn btn-sm btn-success" href="rent_gatepass.php?id=<?php echo $adata->challan_no; ?>" style="font-size:10px;"> Gatepass</a>
							<?php if($adata->status == 'Rented'){ ?>
                            <a title="Edit RLP" class="btn btn-sm btn-danger" href="rent_details.php?id=<?php echo $adata->challan_no; ?>" style="font-size:10px;">Return/Extend</a>
                            <?php } ?>
							
					
                                                    
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
/* $(document).ready(function () {
    $('#rlp_list_table').DataTable({
        scrollY: '400px',
        scrollCollapse: true,
        paging: false,
    });
}); */



/* $(document).ready(function() {
    $('#rlp_list_table').DataTable({
        searchPanes: {
            panes: [
                {
                    header: 'Age Range',
                    options: [
                        {
                            label: 'Over 50',
                            value: function(rowData, rowIdx) {
                                return rowData[3] > 50;
                            }
                        },
                        {
                            label: 'Under 50',
                            value: function(rowData, rowIdx) {
                                return rowData[3] < 50;
                            }
                        }
                    ]
                }
            ],
            preSelect:[{
                column: 6,
                rows: ['Over 50']
            }]
        },
        dom: 'Plfrtip'
    });
}); */


 $(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#rlp_list_table thead tr')
        .clone(true)
        .addClass('filters')
        .appendTo('#rlp_list_table thead');
 
    var table = $('#rlp_list_table').DataTable({
        orderCellsTop: true,
        fixedHeader: true,
        initComplete: function () {
            var api = this.api();
 
            // For each column
            api
                .columns()
                .eq(0)
                .each(function (colIdx) {
                    // Set the header cell to contain the input element
                    var cell = $('.filters th').eq(
                        $(api.column(colIdx).header()).index()
                    );
                    var title = $(cell).text();
                    $(cell).html('<input type="text" placeholder="' + title + '" />');
 
                    // On every keypress in this input
                    $(
                        'input',
                        $('.filters th').eq($(api.column(colIdx).header()).index())
                    )
                        .off('keyup change')
                        .on('change', function (e) {
                            // Get the search value
                            $(this).attr('title', $(this).val());
                            var regexr = '({search})'; //$(this).parents('th').find('select').val();
 
                            var cursorPosition = this.selectionStart;
                            // Search the column for that value
                            api
                                .column(colIdx)
                                .search(
                                    this.value != ''
                                        ? regexr.replace('{search}', '(((' + this.value + ')))')
                                        : '',
                                    this.value != '',
                                    this.value == ''
                                )
                                .draw();
                        })
                        .on('keyup', function (e) {
                            e.stopPropagation();
 
                            $(this).trigger('change');
                            $(this)
                                .focus()[0]
                                .setSelectionRange(cursorPosition, cursorPosition);
                        });
                });
        },
    });
}); 


/* $(document).ready(function () {
    $('#rlp_list_table').DataTable({
        initComplete: function () {
            this.api()
                .columns()
                .every(function () {
                    var column = this;
                    var select = $('<select clas="form-control material_select_2"><option value=""></option></select>')
                        .appendTo($(column.header()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex($(this).val());
 
                            column.search(val ? '^' + val + '$' : '', true, false).draw();
                        });
 
                    column
                        .data()
                        .unique()
                        .sort()
                        .each(function (d, j) {
                            select.append('<option value="' + d + '">' + d + '</option>');
                        });
                   
                    $(column.footer()).empty();
                   
                });
        },
    });
}); */
</script>