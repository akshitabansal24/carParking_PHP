<?php
require "conn.php";
$id = $_POST["e_id"];
$password = $_POST["e_password"];
$mysqli_query = "select * from customers where id = '$id' and password = '$password';";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    echo 'true';
    echo ';';
    echo $row['username'];
    echo ';';
    echo $row['id'];
    echo ';';
    echo $row['carno'];
}
    ?>