<?php
require "conn.php";
$id = $_POST["e_id"];
$password = $_POST["e_password"];
$mysqli_query = "select * from customers where id = '$id' and passoword = '$password';";

$result = mysqli_query($conn,$mysqli_query);
if($result){
    print("Your have registered!"); 
    }
    else{
    print("NOT Successful"); 
    }
    
    ?>