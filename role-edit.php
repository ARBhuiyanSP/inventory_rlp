<?php 
	include 'header.php';
	if (!check_permission('role-list')) { 
		include("404.php");
		exit();
	}
?>
<div class="container-fluid">
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Rolewise Permissions
			<a href="role-list.php" style="float:right"><i class="fas fa-list"></i> Role List</a>
		</div>

		<?php 
			$id = $_GET['id'];
			$queryRole = "SELECT * FROM `roles` WHERE `id`='$id'";
			$resultRole = $conn->query($queryRole);
			$roleData = $resultRole->fetch_object();

			$queryPermissions = "SELECT * FROM `permission_role` WHERE `role_id`='$id'";
			$resultPermissions = $conn->query($queryPermissions);
			$assignPermissions = [];
			while ($row = $resultPermissions->fetch_assoc()) {
				$assignPermissions[] = $row["permission_id"];
			}
		?>

		<div class="card-body">
			<form action="role-edit.php?id=<?php echo $id; ?>" method="post" name="add_name">
				<div class="row">
					

					<div class="col-xs-12">
						<div class="col-xs-4">
							<div class="form-group">
								<label>Role Name</label>
								<input type="text" name="name" id="name" class="form-control" required value="<?php echo $roleData->name; ?>" readonly>
								<input type="hidden" name="id" value="<?php echo $roleData->id; ?>">
							</div>
						</div>
						<div class="col-xs-4">
						
						</div>

					<?php
						$rearrange = [];
						$permissionData = getTableDataByTableName('permissions');
						if (!empty($permissionData)) {
							foreach ($permissionData as $data) {
								$rearrange[$data["permission_category"]][] = $data;
							}
						}
					?>

					<div class="col-xs-12 mb-2">
						<input type="checkbox" id="checkAll"/>
						<label for="checkAll" style="color:#F11C24;font-weight:bold;">Check All</label>
					</div>
						
						
						<?php foreach ($rearrange as $category => $permissions) { ?>
							<div class="col-md-12 mb-2">
								<h5 style="background-color:#F7F7F7;padding:8px 12px;border:1px solid #88E2F7;border-radius:4px;">
									<?php echo $category; ?>
									<!-- ✅ Category-level checkbox -->
									<input type="checkbox" class="checkCategory" data-category="<?php echo md5($category); ?>" style="margin-left:10px;">
									<label style="font-size:13px;color:#007BFF;">Check All in <?php echo $category; ?></label>
								</h5>
							</div>

							<?php foreach ($permissions as $perm) { ?>
								<div class="col-xs-3 mb-1 category-group-<?php echo md5($category); ?>">
									<div class="d-flex">
										<input 
											id="perm_<?php echo $perm['id']; ?>" 
											type="checkbox" 
											name="permissions[]"  
											value="<?php echo $perm['id']; ?>" 
											style="width: 18px;height: 18px;"
											<?php if(in_array($perm['id'], $assignPermissions)) echo 'checked'; ?> 
										>
										<label for="perm_<?php echo $perm['id']; ?>" style="padding-left:5px;"> 
											<?php echo $perm["display_name"]; ?>
										</label>
									</div>
								</div>
							<?php } ?>
						<?php } ?>
					</div>

					<div class="col-xs-4 mt-3">
						<div class="form-group">
							<input type="submit" name="role_update" id="submit" class="btn btn-block" style="background-color:#007BFF;color:#ffffff;" value="Save">   
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
// ✅ Global "Check All"
$("#checkAll").change(function () {
	$("input[type=checkbox]").prop('checked', $(this).prop("checked"));
});

// ✅ Category-wise "Check All"
$(".checkCategory").change(function() {
	var category = $(this).data("category");
	var checked = $(this).prop("checked");
	$(".category-group-" + category + " input[type=checkbox]").prop("checked", checked);
});

// ✅ Sync category checkbox when individual permissions toggled
$("input[name='permissions[]']").change(function() {
	var parent = $(this).closest('[class*="category-group-"]').attr('class').split('category-group-')[1];
	var allBoxes = $(".category-group-" + parent + " input[type=checkbox]");
	var allChecked = allBoxes.length === allBoxes.filter(":checked").length;
	$(".checkCategory[data-category='" + parent + "']").prop("checked", allChecked);
});

// ✅ Sync global checkbox state dynamically
$("input[type=checkbox]").change(function() {
	var totalPerms = $("input[name='permissions[]']").length;
	var checkedPerms = $("input[name='permissions[]']:checked").length;
	$("#checkAll").prop("checked", totalPerms === checkedPerms);
});
</script>

<?php include 'footer.php'; ?>
