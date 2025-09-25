<?php

  if (isset($_POST['user_submit']) && !empty($_POST['user_submit'])) {
    if (empty($_POST["first_name"])) {
        $emailErr = "email is required";
      } else {
        $first_name = $_POST["first_name"]; 
      }

      if (empty($_POST["last_name"])) {
        $emailErr = "email is required";
      } else {
        $last_name = $_POST["last_name"]; 
      }
	  
	  
	  
	  if (empty($_POST["company_id"])) {
        $company_id = "company is required";
      } else {
        $last_name = $_POST["last_name"]; 
      }
	  if (empty($_POST["division_id"])) {
        $division_id = "division is required";
      } else {
        $last_name = $_POST["last_name"]; 
      }
	  if (empty($_POST["department_id"])) {
        $department_id = "department is required";
      } else {
        $last_name = $_POST["last_name"]; 
      }
	  if (empty($_POST["designation"])) {
        $designation = "designation is required";
      } else {
        $last_name = $_POST["last_name"]; 
      }


      if (empty($_POST["email"])) {
        $emailErr = "email is required";
      } else {
        $email = $_POST["email"]; 
      }

    if (empty($_POST["password"])) {
        $passwordErr = "password is required";
      } else {
        $password    = (isset($_POST['password']) && !empty($_POST['password']) ? md5($_POST['password']) : md5('123456')); 
      }

    $role_id = $_POST["role_id"];
    $warehouse_id = $_POST["warehouse_id"];

    //insert
    $queryUser = "INSERT INTO `users` (`branch_id`, `department_id`, `project_id`, `office_id`, `role_id`, `type`, `store_id`, `warehouse_id`, `designation`, `role_name`, `name`, `email`, `contact_number`, `profile_image`, `signature_image`, `password`, `is_password_changed`, `is_status`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES ('$division_id','$department_id','$designation','$role_id','$email','$password','1')";
    $result = $conn->query($queryUser);
   

    $_SESSION['success']    =   "Process have been successfully done.";

		

}



  if (isset($_POST['user_update_submit']) && !empty($_POST['user_update_submit'])) {
    if (empty($_POST["name"])) {
        $emailErr = "name is required";
      } else {
        $name = $_POST["name"]; 
      }


      if (empty($_POST["email"])) {
        $emailErr = "email is required";
      } else {
        $email = $_POST["email"]; 
      }

    

    $role_id = $_POST["role_id"];
    $warehouse_id = $_POST["warehouse_id"];
    $id = $_POST["id"];

    //insert
    $queryUser = "UPDATE `users` SET `warehouse_id`='$warehouse_id',`role_id`='$role_id',`name`='$name',`email`='$email' WHERE `id`='$id'";
    $result = $conn->query($queryUser);


    
   

    $_SESSION['success']    =   "Process have been successfully updated.";

    

}
