<?php
$koneksi = new mysqli('localhost', 'root', '', 'db_lostfound');

$lost_id = $_POST['lost_id'];
$name = $_POST['name'];
$itempic = $_POST['itempic'];
$datelost = $_POST['datelost'];
$itemdesc = $_POST['itemdesc'];
$itemcat = $_POST['itemcat'];
$contact = $_POST['contact'];
$itemloc = $_POST['itemloc'];

$data = mysqli_query($koneksi, "update lost set 
name='$name', itempic='$itempic', datelost='$datelost', itemdesc='$itemdesc', itemcat='$itemcat', contact='$contact', itemloc='$itemloc' where lost_id='$lost_id'");

if ($data) {
    echo json_encode([
        'pesan'=>'updated'
    ]);  
} else {
    echo json_encode([
        'pesan'=>'failed'
    ]);  
}