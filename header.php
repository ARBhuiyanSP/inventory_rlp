<?php ob_start();
session_start(); 
if(!isset($_SESSION['logged']['status'])){
    header("location: index.php");
    exit();
}
include 'connection/connect.php';
include 'helper/utilities.php';
include 'includes/item_process.php';
include 'includes/receive_process.php';
include 'includes/transfer_process.php';
//include 'includes/rlp_process.php';
include 'includes/issue_process.php';
include 'includes/search_process.php';
include 'includes/warehouse_search_process.php';
include 'includes/project_process.php';
include 'includes/unit_process.php';
include 'includes/package_process.php';
include 'includes/building_process.php';
include 'includes/warehouse_process.php';
include 'includes/suppliers_process.php';
include 'includes/format_process.php';
include 'includes/return_process.php';
include 'includes/payment_process.php';
//include 'includes/equipment_process.php';
include 'function/rlp_process.php';
include 'function/cs_process.php';
include 'function/equips_rlp_process.php';
include 'function/rlp_chain_process.php';
include 'function/notesheet_processing.php';
include 'function/notesheet_chain_process.php';
include 'function/workorder_processing.php';
include 'function/user_management.php';
include 'function/equipment_processing.php';
include 'function/maintenance_cost_processing.php';
include 'function/rent_processing.php';
include 'includes/user_process.php';
include 'includes/order_process.php';
include 'includes/role_process.php';
include 'includes/op_process.php';
include 'function/task_process.php';
include 'includes/asset_process.php';

// Fetch settings (assuming only 1 row)
$query = "SELECT * FROM settings LIMIT 1";
$result = mysqli_query($conn, $query);
$settings = mysqli_fetch_assoc($result);

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="images/fav.png">
  <title><?= $settings['name']; ?></title>
  <!-- Custom fonts for this template-->
  <link href="css/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
  <link href="css/sweetalert.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/jquery-ui.css" rel="stylesheet">
  <link href="css/site_style.css" rel="stylesheet">
  <link href="css/form-entry.css" rel="stylesheet">
  <link href="css/select2.min.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/select2.min.js"></script>
</head>
<style>
/* body {
  background-image: url("images/bg2.jpg");
  background-color: #cccccc;
} */

.mborder{
	padding:3px;
	border:1px solid #808080;
}
.authimg{
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translateX(-50%) translateY(-50%);
    max-width: 100%;
    max-height: 100%;
}

.reqfield{
	color:red;
	font-style: italic;
	font-size:10px;
	font-weight:bold;
}
.table th, .table td {
  padding:3px !important;
}
.navbar{
	padding : 0px 15px;
}
.form-control{
	border:1px solid #000 !important;
	font-size:12px;
}
label{
	font-weight:bold;
	font-size:12px;
}
footer.sticky-footer{
	width: calc(100% - 0px);
	height:30px;
}
</style>
<body id="page-top">
  <nav class="navbar navbar-expand navbar-light bg-light fixed-top">
   <a class="navbar-brand mr-1" href="index.php"><img src="<?= $settings['logo']; ?>" height="20px;"/></a> 
  

	<!-- Menu -->
    <?php include('top-menu.php'); ?>
	
	
	<div class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" style="color:#000;"><b><?php echo $_SESSION['logged']['user_name']; ?></br>
	<?php $role_id            =   $_SESSION['logged']['role_id'];    
    //echo $role_name          =   get_role_shortcode_by_role_id($role_id);?>
	</b></div>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
           <a class="dropdown-item" href="profile.php">Profile</a>
          <a class="dropdown-item" href="includes/logout.php">Logout</a>
          <!--<a class="dropdown-item" href="#">Settings</a>-->
          <!--<a class="dropdown-item" href="#">Activity Log</a>-->
        </div>
      </li>
    </ul>
  </nav>

  <div id="wrapper" style="padding-top:30px;">

    <!-- Sidebar -->
    <?php //include 'sidebar.php' ?>

    <div id="content-wrapper" style="">    
        <!-- Sidebar -->
    <?php include 'operation_message.php'; ?>