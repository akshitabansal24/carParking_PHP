<?php
require "conn.php";
$id = $_POST["e_id"];
$space = $_POST["e_space"];
$car = $_POST["e_car"];
$time = $_POST["e_time"];
$mysqli_query = "select * from transactions where customer_id = ".$id." and entry_time is not null and exit_time is null;";

$result = mysqli_query($conn,$mysqli_query);
while($row = mysqli_fetch_array($result)) {
    $entry_time=new DateTime($row['entry_time']);
    $exit_time = new DateTime($time);
    $diff=$entry_time->diff($exit_time);
    $total_minutes = ($diff->days * 24 * 60); 
    $total_minutes += ($diff->h * 60); 
    $total_minutes += $diff->i;
    if($total_minutes==0){
        $total_minutes=1;
    }
    $total_fare = $total_minutes*5;
    
    $mysqli_query2 = "update transactions set exit_time = '".$time."',total_fare=".$total_fare." where transaction_id = ".$row['transaction_id'];
    $result2 = mysqli_query($conn,$mysqli_query2);
    $mysqli_query4 = "update spaces set is_available=1 where space_id=".$row['space_id'];
    $result4 = mysqli_query($conn,$mysqli_query4);
    echo "Exit success";
    echo $total_fare;
    return;
}
$mysqli_query3 = "INSERT INTO transactions (customer_id, space_id, carno, entry_time, exit_time, total_fare) VALUES (".$id.", ".$space.", '".$car."', '".$time."', null, null);";
$result3 = mysqli_query($conn,$mysqli_query3);
echo "Entry success";  
    ?>