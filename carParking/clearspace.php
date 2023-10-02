<?php
require "conn.php";
$space = $_POST["e_space"];
$mysqli_query = "update spaces set is_available=1 where space_id=".$space;

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    break;
}

    ?>