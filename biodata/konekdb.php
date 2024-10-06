<?php 
header('Access-Control-Allow-Origin: *');

$nm_database = "sekolah";
$nm_server = "localhost";
$nm_user = "root";
$nm_pass = "";

// Buat objek PDO dengan dbname yang benar
$db = new PDO("mysql:host={$nm_server};dbname={$nm_database};charset=utf8", $nm_user, $nm_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>
