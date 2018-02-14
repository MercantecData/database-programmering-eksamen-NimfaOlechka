<?php
	$conn = mysqli_connect("localhost", "root", "", "databaseexam");
	$sql = "SELECT * FROM `users`";
	$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html>
<head>
	<title>User List</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		
	</script>
</head>
<body>
	<h1>Users:</h1>
	<?php 
	if($result->num_rows > 0){
		while($row = $result->fetch_assoc()){
			$_SESSION['userName']=$row['username'];
			//echo $row["name"];
			echo "<form action='delete.php' method='POST'>";
			echo $row["name"];
			echo"<button type ='submit' name='submit'>delete</button></form>";
			echo "<br>";
		}
	}else{
		echo "No more users left...";
	}
	
	
	?>
</body>
</script>
</html>

