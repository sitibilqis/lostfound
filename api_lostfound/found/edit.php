<?php
$koneksi = new mysqli('localhost','root', '', 'db_lostfound');
$found_id = $_POST['found_id'];
$itempic = $_POST['itempic'];
$name = $_POST['name'];
$datefound = $_POST['datefound'];
$itemdesc = $_POST['itemdesc'];
$itemcat = $_POST['itemcat'];
$contact = $_POST['contact'];
$itemloc = $_POST['itemloc'];
$data = mysqli_query($koneksi, "update found_items set itempic='$itempic', name='$name', datefound='$datefound', 
itemdesc='$itemdesc', itemcat='$itemcat', contact='$contact', itemloc='$itemloc' where found_id='$found_id'");
if ($data) {
    echo json_encode([
        'pesan'=>'Sukses update'
    ]);
}else{
    echo json_encode([
        'pesan'=>'Gagal update'
    ]);
}
