<title>Admin Page</title>
<?php

if(isset($_POST["submit"])) {
	//db connection
	$conn = mysqli_connect("localhost", "root", "", "databaseexam");
	//error handling
	$username=mysqli_real_escape_string($conn,$_POST['username']);
	$password=mysqli_real_escape_string($conn,$_POST['password']);
	
	if(empty($username) || empty($password)){
		header("Location: admin.php?login=empty");
		exit();
	}else{
		$sql = "SELECT * FROM `adminusers` WHERE username = '$username';";
		$result = $conn->query($sql);
		
		if($result->num_rows > 0) {
			if($row=mysqli_fetch_assoc($result)){

				//dehashing password and cheking
				$hashedPswCheck =password_verify($password,$row['password']);
				
				if($hashedPswCheck = false){
					header('Location:admin.php?login=error');
					exit();
				}elseif($hashedPswCheck = true){

					//Log in the user
					header("Location: userlist.php");			
					exit();
				}
			}
		} else {
			echo "<p style='color:red'>Wrong Username/Password</p>";
		}
	}
}
?>

<form action="admin.php" method="POST">
	username:<input type="text" name="username">
	password:<input type="password" name="password">
	<!--input type="hidden" name="strongkey" value="Lzk34yR71?hrIP"-->
	<input type="submit" name="submit" value="login">
</form>