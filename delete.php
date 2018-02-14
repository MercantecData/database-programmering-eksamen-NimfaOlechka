<?php
session_start();

if (isset($_POST['submit'])){

	//db connection
	$conn = mysqli_connect("localhost", "root", "", "databaseexam");
	if (!$conn) {
    	die("Connection failed: " . mysqli_connect_error());
	}

	$username = $_SESSION['userName'];
	$sql="DELETE FROM `users` WHERE `users`.`username` = '$username';";
	
	if (mysqli_query($conn, $sql)) {
	    echo "Record deleted successfully";
	    header("Location:userlist.php");

	} else {
	    echo "Error deleting record: " . mysqli_error($conn);
	}

	mysqli_close($conn);
}else{
	header("Location: userlist.php");
}
?>