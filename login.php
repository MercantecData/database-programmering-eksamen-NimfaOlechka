<?php
session_start();

if (isset($_POST['submit'])){
	//db connection
	$conn = mysqli_connect("localhost", "root", "", "databaseexam");
	//checking for injection from user input
	$username=mysqli_real_escape_string($conn,$_POST['username']);
	$password=mysqli_real_escape_string($conn,$_POST['password']);


	if(empty($username) || empty($password)){
		header("Location: index.php?login=empty");
		exit();
	}else{
		$sql = "SELECT `id`, `name` FROM `users` WHERE username = '$username' AND password = '$password';";
		$result=mysqli_query($conn,$sql);
		$resultCheck=mysqli_num_rows($result);
		if($result->num_rows < 1){
			header("Location:index.php?login=error");
			exit();
		}else{
			if($row=mysqli_fetch_assoc($result)){

				//dehashing password and cheking
				$hashedPswCheck =password_verify($password,$row['password']);
				if($hashedPswCheck = false){
					header('Location:index.php?login=password');
					exit();
				}elseif($hashedPswCheck = true){

					//Log in the user
					$_SESSION['userID']=$row['id'];
					$_SESSION['userName']=$row['name'];
					
					header('Location:index.php?login=success');
					exit();
				}
			}
		}

	}
}else{
	header('Location:index.php?login=error');
	exit();
}