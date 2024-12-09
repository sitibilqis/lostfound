<?php
$koneksi = new mysqli('localhost','root', '', 'db_lostfound');
$itempic = $_POST['itempic'];
$name = $_POST['name'];
$datefound = $_POST['datelost'];
$itemdesc = $_POST['itemdesc'];
$itemcat = $_POST['itemcat'];
$contact = $_POST['contact'];
$itemloc = $_POST['itemloc'];
$data = mysqli_query($koneksi, "insert into lost set itempic='$itempic', name='$name', datelost='$datefound', 
itemdesc='$itemdesc', itemcat='$itemcat', contact='$contact', itemloc='$itemloc'");
if ($data) {
    echo json_encode([
        'pesan'=>'success'
    ]);
}else{
    echo json_encode([
        'pesan'=>'failed'
    ]);
}