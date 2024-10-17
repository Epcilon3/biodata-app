<?php 
header('Access-Control-Allow-Origin: *');

$nm_database = "biodata";
$nm_server = "localhost";
$nm_user = "root";
$nm_pass = "";

$db = new PDO("mysql:host={$nm_server}; database={$nm_database}; charset=utf8", $nm_user, $nm_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

?>