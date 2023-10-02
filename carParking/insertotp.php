<?php
require "conn.php";
$otp = $_POST["otp"];
$mysqli_query = "update otp set otp = '$otp' where otp!= 0";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    echo 'true';
    break;
}
    ?>