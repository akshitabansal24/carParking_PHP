<?php
require "conn.php";
$mysqli_query = "select * from otp where otp = 0;";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    echo 'true';
    break;
}
    ?>