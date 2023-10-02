<?php
require "conn.php";
$mysqli_query = "select * from spaces where is_available=1;";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    echo $row['space_id'];
    echo ';';
    echo $row['tag'];
    echo ';';
    echo $row['latitude'];
    echo ';';
    echo $row['longitude'];
    break;
}

    ?>