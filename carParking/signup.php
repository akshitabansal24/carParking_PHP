<?php
require "conn.php";
$id = $_POST["e_id"];
$name = $_POST["e_name"];
$password = $_POST["e_password"];
$mail = $_POST["e_mail"];
$contact = $_POST["e_contact"];
$carno = $_POST["e_carno"];

$mysqli_query3 = "INSERT INTO customers (id, username, password, email, phone, carno) VALUES (".$id.", '".$name."', '".$password."', '".$mail."', '".$contact."', '".$carno."');";
$result3 = mysqli_query($conn,$mysqli_query3);
 
    ?>