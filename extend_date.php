<?php include 'header.php';
$id = $_GET['id'];
 $query = "SELECT * FROM rent_details ORDER BY id DESC";  
 $result = mysqli_query($conn, $query); 
 ?>
<div class="container-fluid">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Supplier Filters</a>
        </li>
        <li class="breadcrumb-item active">List</li>
    </ol>
    <!-- receive search start here -->
	<div class="row">
		<?php 
		$queryDetails = "SELECT * FROM `rents` WHERE `id`='$id'";  
		$resultDetails = mysqli_query($conn, $queryDetails);
		$rowDetails = mysqli_fetch_array($resultDetails);
		?>
		<div class="col-sm-6">	
			<img src="images/spl.png" height="60px;"/>
			<p>
			<span>Khawaja Tower (5th Floor) </br>95, Mohakhali, C/A Bir Uttam AK Khandakar Rd</br> Dhaka - 1212</span></p></div>
		<div class="col-sm-6">
			<table class="table table-bordered">
			  <tr>
				<th>Internal Memo No:</th>
				<td><?php echo $rowDetails["challan_no"]; ?></td>
			  </tr>
			  <tr>
					<th>Date:</th>
					<td><?php echo $rowDetails["date"]; ?></td>
				</tr>
			</table>
		</div>
	</div>
	<center><h5>Rented Equipment List</h5></center>
    <div id="employee_table">  
                          <table class="table table-bordered">  
                               <tr>  
                                    <th>EEL Code</th>  
                                    <th>Rent Date</th>  
                                    <th>Return Date</th>  
                                    <th>Edit</th>  
                                    <th>View</th>  
                               </tr>  
                               <?php  
                               while($row = mysqli_fetch_array($result))  
                               {  
                               ?>  
                               <tr>  
                                    <td><?php echo $row["eel_code"]; ?></td>  
                                    <td><?php echo $row["rent_date"]; ?></td>  
                                    <td><?php echo $row["return_date"]; ?></td>  
                                    <td><input type="button" name="edit" value="Edit" id="<?php echo $row["id"]; ?>" class="btn btn-info btn-xs edit_data" /></td>  
                                    <td><input type="button" name="view" value="view" id="<?php echo $row["id"]; ?>" class="btn btn-info btn-xs view_data" /></td>  
                               </tr>  
                               <?php  
                               }  
                               ?>  
                          </table>  
                     </div>
    <!-- end receive search -->


</div>
 <div id="dataModal" class="modal fade">  
      <div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">  
                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
                     <h4 class="modal-title">Employee Details</h4>  
                </div>  
                <div class="modal-body" id="employee_detail">  
                </div>  
                <div class="modal-footer">  
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
           </div>  
      </div>  
 </div>  
 <div id="add_data_Modal" class="modal fade">  
      <div class="modal-dialog">  
           <div class="modal-content">  
                <div class="modal-header">  
                     <button type="button" class="close" data-dismiss="modal">&times;</button>  
                </div>  
                <div class="modal-body">  
                     <form method="post" id="insert_form">   
                          <label>return_date</label>  
                          <input type="text" name="return_date" id="return_date" class="form-control" />  
                          <br />  
                          <input type="hidden" name="id" id="id" />  
                          <input type="submit" name="insert" id="insert" value="Insert" class="btn btn-success" />  
                     </form>  
                </div>  
                <div class="modal-footer">  
                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>  
                </div>  
           </div>  
      </div>  
 </div>  
 <script>  
 $(document).ready(function(){  
      $('#add').click(function(){  
           $('#insert').val("Insert");  
           $('#insert_form')[0].reset();  
      });  
      $(document).on('click', '.edit_data', function(){  
           var id = $(this).attr("id");  
           $.ajax({  
                url:"extend/fetch.php",  
                method:"POST",  
                data:{id:id},  
                dataType:"json",  
                success:function(data){    
                     $('#return_date').val(data.return_date);  
                     $('#id').val(data.id);  
                     $('#insert').val("Update");  
                     $('#add_data_Modal').modal('show');  
                }  
           });  
      });  
      $('#insert_form').on("submit", function(event){  
           event.preventDefault();  
           if($('#return_date').val() == "")  
           {  
                alert("return_date is required");  
           }   
           else  
           {  
                $.ajax({  
                     url:"extend/insert.php",  
                     method:"POST",  
                     data:$('#insert_form').serialize(),  
                     beforeSend:function(){  
                          $('#insert').val("Inserting");  
                     },  
                     success:function(data){  
                          $('#insert_form')[0].reset();  
                          $('#add_data_Modal').modal('hide');  
                          $('#employee_table').html(data);  
                     }  
                });  
           }  
      });  
      $(document).on('click', '.view_data', function(){  
           var id = $(this).attr("id");  
           if(id != '')  
           {  
                $.ajax({  
                     url:"extend/select.php",  
                     method:"POST",  
                     data:{id:id},  
                     success:function(data){  
                          $('#employee_detail').html(data);  
                          $('#dataModal').modal('show');  
                     }  
                });  
           }            
      });  
 });  
 </script>
<!-- /.container-fluid -->
<?php include 'footer.php' ?>