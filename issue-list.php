<?php
include 'header.php';

?>
<?php /* if(!check_permission('material-issue-list')){ 
        include("404.php");
        exit();
 } */ ?>
<link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
<style>
	table th {
		font-size: 14px;
	}

	table td {
		font-size: 14px;
	}
</style>
<div class="container-fluid">
	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i>
			Material Issue List
		</div>
		<div class="card-body">

			<div class="row">
				<div class="col-md-12">
					<div class="p-5">
						<form class="form-inline" id="get_issue_filter_form">
							<label for="start_date">From Date:</label>
							<input type="text" class="form-control" placeholder="Enter Start Date" id="start_date" name="start_date" value="<?php echo date('Y-m-d'); ?>">
							<label for="end_date">End Date:</label>
							<input type="text" class="form-control" placeholder="Enter End date" id="end_date" name="end_date" value="<?php echo date('Y-m-d'); ?>">

							<button type="button" class="btn btn-primary" onclick="getIssueListDataByDate()">Get Date</button>
						</form>
					</div>
				</div>
				
			</div>
		

			<div id="show_issue_details_data">



				<?php
				$date_filter 	=	(object)[
					'start_date'	=> date('Y-m-d'),
					'end_date'		=> date('Y-m-d'),
				];
				$item_details = get_issue_details_data($date_filter);
				if (isset($item_details) && !empty($item_details)) {

					show_issue_details_data($item_details);
				
				} else { ?>
					<div class="alert alert-info" role="alert"> Sorry, no data found!</div>
				<?php } ?>

			</div>

		</div>
	</div>

</div>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>
<script>
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>