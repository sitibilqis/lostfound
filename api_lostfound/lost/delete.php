<?php
$koneksi = new mysqli('localhost', 'root', '', 'db_lostfound');

$lost_id = $_POST['lost_id'];

$data = mysqli_query($koneksi, "delete from lost where lost_id='$lost_id'");

if ($data) {
    echo json_encode([
        'pesan'=>'deleted'
    ]);  
} else {
    echo json_encode([
        'pesan'=>'failed'
    ]);  
}