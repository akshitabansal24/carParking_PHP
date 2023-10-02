<?php
require "conn.php";
$space = $_POST["e_space"];
$mysqli_query2 = "update spaces set is_available=0 where space_id=".$space;
$result2 = mysqli_query($conn,$mysqli_query2);
$mysqli_query3 = "update otp set otp=0 where otp!=0;";
$result3 = mysqli_query($conn,$mysqli_query3);

    ?>