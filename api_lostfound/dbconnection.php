<?php

function dbconnection() {
    $con= mysqli_connect("localhost","root","","db_lostfound");
    return $con;
}