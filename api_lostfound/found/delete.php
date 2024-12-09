<?php
$koneksi = new mysqli('localhost','root', '', 'db_lostfound');
$found_id = $_POST['found_id'];
$data = mysqli_query($koneksi, "delete from found_items where found_id='$found_id'");
if ($data) {
    echo json_encode([
        'pesan'=>'Sukses delete'
    ]);
}else{
    echo json_encode([
        'pesan'=>'Gagal delete'
    ]);
}
