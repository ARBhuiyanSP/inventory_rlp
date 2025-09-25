<style>
.sidebar{
	background-color:#e9ecef;
}
.sidebar .nav-item .nav-link span {
	color: #444;
	font-size:14px;
}
.sidebar .nav-item .nav-link{
	border:1px solid rgba(0, 0, 0, 0.125);
	margin-top:2px;
	margin-bottom:2px;
	color: #007bff;
	padding-left: 20px;
    padding-top: 5px;
	font-weight:bold;
}
.sidebar ul li {
	border-bottom: 1px solid #444;
}
.bg-dark {
    background-color: #007bff !important;
}
.form-control {
    border:1px solid #000000;
}

.reqr{
	font-size:10px;
	color:red;
	font-weight:bold;
	font-style:italic;
}
</style>


<ul class="sidebar navbar-nav">
	<li class="nav-item active">
        <a class="nav-link" href="dashboard.php">
            <i class="fas fa-fw fa-tachometer-alt" style="color: #007BFF;"></i>
            <span>Dashboard</span>
            <?php 



?>
        </a>
    </li>
	
    <li class="nav-item" style="background-color:#007BFF;">
        <span class="nav-link" href="#">
            <i class="fa fa-bars" aria-hidden="true" style="color: #FFF;"></i>
            <span style="color: #FFF;">Settings</span></span>
    </li>
	<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-cog" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Master Setup</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            


            <?php if(check_permission('category-list')){ ?>
                    <a class="dropdown-item" href="category.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Material Category</span>
            </a>
             <?php    } ?>
            
			
			<?php
            
                if(check_permission('material-list')){ ?>
                    <a class="dropdown-item" href="material.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Material</span>
            </a>
             <?php    } ?>
			 
             <?php
            
                if(check_permission('unit-list')){ ?>
                    <a class="dropdown-item" href="unit_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> UOM</span>
            </a>
             <?php    } ?>
			
        <?php
            
                if(check_permission('project-list')){ ?>
                    <a class="dropdown-item" href="project_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Projects</span>
            </a>
             <?php    } ?>
            
            <?php
            
                if(check_permission('warehouse-list')){ ?>
                    <a class="dropdown-item" href="warehouse_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Warehouse</span>
            </a>
             <?php    } ?>
           
        
            <?php
            
                if(check_permission('equipment-list')){ ?>
                    <a class="dropdown-item" href="equipment_entry.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Euipments</span>
            </a>
             <?php    } ?>
			 
			 
			   <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="role-list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Role</span>
            </a>
             <?php    } ?>
			 
			 
            <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="rlp_approve_chain_list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> RLP Approval Chain</span>
            </a>
             <?php    } ?>
			 
			  
            <?php
            
                if(check_permission('role-list')){ ?>
                    <a class="dropdown-item" href="notesheet_approve_chain_list.php">
                <i class="fa fa-bullseye" aria-hidden="true" style="color: #007BFF;"></i>
                <span class="sub_menu_text_design"> Notesheet Approval Chain</span>
            </a>
             <?php    } ?>

            
         


           
        </div>
    </li>


	


    <?php if(check_permission('user-list')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="user-list.php">
                <i class="fa fa-users" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Users</span></a>
        </li>
    <?php } ?>

    <?php if(check_permission('data-backup')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="data_backup.php">
                <i class="fa fa-database" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Data Backup</span></a>
        </li>
    <?php } ?>

    <?php if(check_permission('log-history')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="log-history.php">
                <i class="fa fa-key" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Log History</span></a>
        </li>
    <?php } ?>
     
    <?php if(check_permission('opening-stock-list')){ ?>
    	<li class="nav-item">
            <a class="nav-link" href="opening_balance.php">
                <i class="fa fa-key" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Opening Stock Entry</span></a>
        </li>
    <?php } ?>

    <!-- <?php if(check_permission('opening-stock-list')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="edit_part_spec.php">
                <i class="fa fa-key" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Edit Part No</span></a>
        </li>
    <?php } ?> -->
	
	
	<li class="nav-item" style="background-color:#007BFF;">
        <span class="nav-link" href="#">
            <i class="fa fa-users" aria-hidden="true" style="color: #FFF;"></i>
            <span style="color: #FFF;">User Page</span></span>
    </li>
    <?php if(check_permission('material-receive-list')){ ?>
    <li class="nav-item dropdown">
        
		<a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-truck" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Material Receive</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <?php if(check_permission('material-receive-add')){ ?>
			<a class="dropdown-item" href="receive_entry.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Receive Entry</span></a>
			<?php } ?>
            <a class="dropdown-item" href="receive-list.php"><i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Receive List</span></a>
        </div>
    </li>
    <?php } ?>
     <?php if(check_permission('material-issue-list')){ ?>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-fw fa-server" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Material issue</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
            <a class="dropdown-item" href="issue_entry.php"><i class="fa fa-plus" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Material issue</span></a>
            <a class="dropdown-item" href="issue-list.php"><i class="fa fa-list" aria-hidden="true" style="color: #007BFF;"></i><span class="sub_menu_text_design">Issue List</span></a>
        </div>
    </li>
    <?php } ?>
	
	
	   <?php if(check_permission('material-issue-list')){ ?>
    <li class="nav-item">
            <a class="nav-link" href="rlp_list.php">
                <i class="fa fa-key" aria-hidden="true" style="color: #007BFF;"></i>
                <span>RLP</span></a>
        </li>
    <?php } ?>
	
	
	<li class="nav-item" style="background-color:#007BFF;">
        <span class="nav-link" href="#">
            <i class="fa fa-bars" aria-hidden="true" style="color: #FFF;"></i>
            <span style="color: #FFF;">Reports</span></span>
    </li>

	 <?php if(check_permission('category-wise-material-list')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="materialinfo_report.php">
                <i class="fa fa-key" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Material List</span></a>
        </li>
    <?php } ?>

    
	

	<!-- <li class="nav-item">
        <a class="nav-link" href="materialtype_info.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>TypeWise Material List</span></a>
    </li> -->

     <?php if(check_permission('material-stock-report')){ ?>
        <li class="nav-item">
            <a class="nav-link" href="stock_report.php">
                <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Stock Reports</span></a>
        </li>
    <?php } ?>

	<?php if(check_permission('material-movement-report')){ ?>
    	<li class="nav-item">
            <a class="nav-link" href="movement_report.php">
                <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
                <span>Movement Reports</span></a>
        </li>
    <?php } ?>
<?php if(check_permission('equipment-history')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="equipments-history.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Equips.History Report</span></a>
    </li>
<?php } ?>
<?php if(check_permission('material-history')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="material-history.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Material History Report</span></a>
    </li>
<?php } ?>
<?php if(check_permission('material-receive-history')){ ?>
		<li class="nav-item">
        <a class="nav-link" href="material-historyreceive.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Material History(Receive) Report</span></a>
    </li>
<?php } ?>
<?php if(check_permission('material-issue-history')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="material-historyissue.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Material History(Issue) Report</span></a>
    </li>
<?php } ?>
<?php if(check_permission('material-receive-details')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="receive_report.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Receive details</span></a>
    </li>
<?php } ?>
<?php if(check_permission('categorywise-material-receive-details')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="receive_report_by_category.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Categorywise Receive details</span></a>
    </li>
<?php } ?>
<?php if(check_permission('material-issue-details')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="issue_report.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Issue details</span></a>
    </li>
<?php } ?>
<?php if(check_permission('categorywise-material-issue-details')){ ?>
	<li class="nav-item">
        <a class="nav-link" href="issue_report_by_category.php">
            <i class="fa fa-registered" aria-hidden="true" style="color: #007BFF;"></i>
            <span>Categorywise Issue details</span></a>
    </li>
<?php } ?>
	
</ul>