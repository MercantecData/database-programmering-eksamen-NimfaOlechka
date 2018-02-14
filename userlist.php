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
			echo $row["name"];
			echo "   <a href='?'>delete</a>";
			echo "<br>";
		}
	}else{
		echo "No more users left...";
	}
	
	?>
</body>
</html>