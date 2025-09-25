<?php
if (isset($_POST['login_submit']) && !empty($_POST['login_submit'])) { 
    $error_status   =   false;
    $error_string   =   [];
    if(isset($_POST['office_id']) && !empty($_POST['office_id'])){
        $office_id      =   $_POST['office_id'];
        
    }else{
        $error_status                   =   true;
        $error_string['user_id_empty']    =   'user id is reqiored.';
    }
    if(isset($_POST['password']) && !empty($_POST['password'])){
        $password      =   mysqli_real_escape_string($conn, $_POST['password']);
        $password      =  md5($password);
    }else{
        $error_status                   =   true;
        $error_string['password_empty']    =   'Password is reqiored.';
    }
    
    if($error_status){
        foreach($error_string as $errorKey=>$errorVal){
            $_SESSION['error_message'][$errorKey]   =   $errorVal;            
        }
        $_SESSION['error']    =   "Login credential was not correct.";
        header("location: index.php");
        exit();
    }else{
        $emailsql    = "SELECT * FROM users where office_id='$office_id'";
        $result = $conn->query($emailsql);
        if ($result->num_rows > 0) {
            $passsql    = "SELECT * FROM users where office_id='$office_id' AND password='$password'";
            $presult = $conn->query($passsql);
            if ($presult->num_rows > 0) {
                $row        	=   $presult->fetch_object();
                $name      	=   $row->name;
                $user_id    	=   $row->id;
                $user_type		=   $row->user_type;
                $role_id      =   $row->role_id;
                $store_id      =   $row->store_id;
                $project_id		=   $row->project_id;
                $office_id		=   $row->office_id;
                $department_id		=   $row->department_id;
                $warehouse_id	=   $row->warehouse_id;
                $_SESSION['logged']['permissin_urls'] =   [];
                unset($_SESSION['error']);
                $_SESSION['success']                =   $name.' '.$name." have successfully loggedin!";
                $_SESSION['logged']['user_name']    =   $name;
                $_SESSION['logged']['user_id']      =   $user_id;
                $_SESSION['logged']['user_type']	=   $user_type;
                $_SESSION['logged']['role_id']    =   $role_id;
                $_SESSION['logged']['store_id']    =   $store_id;
				$_SESSION['logged']['branch_id']    =   (isset($row->branch_id) && !empty($row->branch_id) ? $row->branch_id : "");
                $_SESSION['logged']['project_id']	=   $project_id;
                $_SESSION['logged']['office_id']	=   $office_id;
                $_SESSION['logged']['department_id']	=   $department_id;
                $_SESSION['logged']['warehouse_id']	=   $warehouse_id;


                $_SESSION['logged']['ip']           =   $_SERVER['REMOTE_ADDR'];
                $ip                                 =   $_SERVER['REMOTE_ADDR'];

                    $role_query    = "SELECT t2.name AS permision_url FROM `permission_role` AS t1
                    INNER JOIN permissions AS t2 ON t1.permission_id=t2.id
                    WHERE t1.role_id='$role_id'";
            $rResult = $conn->query($role_query);
            if ($rResult->num_rows > 0) {
                while ($rData = $rResult->fetch_assoc()) {
                    $_SESSION['logged']['permissin_urls'][]=$rData['permision_url'];
                }
            }
            
                

                $_SESSION['logged']['status']		=   true;

mysqli_query($conn,"insert into userlog(userId,username,role_id,userIp) values('".$_SESSION['logged']['user_id']."','".$_SESSION['logged']['user_name']."','".$_SESSION['logged']['role_id']."','$ip')");

                header("location: dashboard.php");
                exit();
            }else{
                $error_status                       =   true;
                $_SESSION['error_message']['password_empty']     =   'Password did not matched.';
                $_SESSION['error']                               =   "Login credential was not correct.";
                header("location: index.php");
                exit();
            }
        }else{
            $error_status   =   true;
            $_SESSION['error_message']['user_id_valid']    =   'Invalid User id';
            $_SESSION['error']                           =   "Login credential was not correct.";
            header("location: index.php");
            exit();
        }
    }
}