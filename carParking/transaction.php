<?php
require "conn.php";
$id = $_POST["e_id"];
$space = $_POST["e_space"];
$car = $_POST["e_car"];
$time = $_POST["e_time"];
$mysqli_query = "select * from transactions where customer_id = ".$id." and entry_time is not null and exit_time is null;";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    $mysqli_query2 = "update transactions set exit_time = '".$time."',total_fare=100 where transaction_id = ".$row['transaction_id'];
    $result2 = mysqli_query($conn,$mysqli_query2);
    echo "Exit success";
    return;
}
$mysqli_query3 = "INSERT INTO transactions (customer_id, space_id, carno, entry_time, exit_time, total_fare) VALUES (".$id.", ".$space.", '".$car."', '".$time."', null, null);";
$result3 = mysqli_query($conn,$mysqli_query3);
echo "Entry success";  
    ?>