<?php
	$koneksi = new mysqli('localhost','root', '', 'db_lostfound');
	if (!$koneksi) {
		echo "Database connection faild";
	}

	$username = $_POST['username'];
	$password = $_POST['password'];
	$fullname = $_POST['fullname'];
	$email = $_POST['email'];


	$sql = "SELECT username FROM login WHERE username = '".$username."'";

	$result = mysqli_query($koneksi,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO login(username,password,fullname,email)VALUES('".$username."','".$password."','".$fullname."','".$email."')";
		$query = mysqli_query($koneksi,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>