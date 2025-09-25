<?php 
$con = mysqli_connect("localhost","root","","inv_v2");
if(isset($_POST['backup'])){
    $tables = array();
    $sql = "SHOW TABLES";
    $result = mysqli_query($con, $sql);
    while ($row = mysqli_fetch_row($result)) {
        $tables[] = $row[0];
    }
    $sqlScript = "";
    foreach ($tables as $table) {
        $query = "SHOW CREATE TABLE $table";
        $result = mysqli_query($con, $query);
        $row = mysqli_fetch_row($result);
        $sqlScript .= "\n\n" . $row[1] . ";\n\n";
        $query = "SELECT * FROM $table";
        $result = mysqli_query($con, $query);
        $columnCount = mysqli_num_fields($result);
        for ($i = 0; $i < $columnCount; $i ++) {
            while ($row = mysqli_fetch_row($result)) {
                $sqlScript .= "INSERT INTO $table VALUES(";
                for ($j = 0; $j < $columnCount; $j ++) {
                    $row[$j] = $row[$j];           
                    if (isset($row[$j])) {
                        $sqlScript .= '"' . mysqli_real_escape_string($con,$row[$j]) . '"';
                    } else {
                        $sqlScript .= '""';
                    }
                    if ($j < ($columnCount - 1)) {
                        $sqlScript .= ',';
                    }
                }
                $sqlScript .= ");\n";
            }
        }   
        $sqlScript .= "\n"; 
    }
    if(!empty($sqlScript))
    {
        //$backup_file_name =  __DIR__.'/_backup_.sql';
		$backup_file_name = 'bu/_backup_' . time() . '.sql';
        $fileHandler = fopen($backup_file_name, 'w+');
        $number_of_lines = fwrite($fileHandler, $sqlScript);
        fclose($fileHandler);
        $message = "Backup Created Successfully";
    }
}
if(isset($_POST['restore'])){
    $sql = '';
    $error = '';
    if (file_exists(__DIR__.'/_backup_.sql')) {
        // Deleting starts here
        $query_disable_checks = 'SET foreign_key_checks = 0';
        mysqli_query($con, $query_disable_checks);
        $show_query = 'Show tables';
        $query_result = mysqli_query($con, $show_query);
        $row = mysqli_fetch_array($query_result);
        while ($row) {
            $query = 'DROP TABLE IF EXISTS ' . $row[0];
            $query_result = mysqli_query($con, $query);
            $show_query = 'Show tables';
            $query_result = mysqli_query($con, $show_query);
            $row = mysqli_fetch_array($query_result);
        }
        $query_enable_checks = 'SET foreign_key_checks = 1';
        mysqli_query($con, $query_enable_checks);
        // Deleting ends here
        $lines = file(__DIR__.'/_backup_.sql');
        foreach ($lines as $line) {
            if (substr($line, 0, 2) == '--' || $line == '') {
                continue;
            }
            $sql .= $line;
            if (substr(trim($line), - 1, 1) == ';') {
                $result = mysqli_query($con, $sql);
                if (! $result) {
                    $error .= mysqli_error($con) . "\n";
                }
                $sql = '';
            }
        }
        if ($error) {
            $message = $error;
        } else {
            $message = "Database restored successfully";
        }
    }else{
        $message = "Uh Oh! No backup file found on the current directory!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database Backup and Restore system using PHP</title>
    <style>
        .blogdesire-form{
            margin: 0;
            padding: 0;
            position: fixed;
            top: 0;
            left:0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100vw;
            height: 100vh;
        }
        .blogdesire-button{
            margin: 10px;
            border: none;
            padding: 10px 20px;
            color: white;
            background: green;
        }

    </style>
</head>
<body>
    <form method="POST" class="blogdesire-form">
        <button name="backup" class="blogdesire-button">
            Backup
        </button>
        <button name="restore" class="blogdesire-button">
            Restore
        </button>
        <?php  if(@$message): ?>
            <p><?php echo $message;?></p>
        <?php  endif; ?>
    </form>
</body>
</html>