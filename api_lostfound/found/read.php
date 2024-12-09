<?php 
$koneksi = new mysqli('localhost','root', '', 'db_lostfound');
$query = mysqli_query($koneksi, "select * from found_items");
$data = mysqli_fetch_all($query, MYSQLI_ASSOC);
echo json_encode($data);
