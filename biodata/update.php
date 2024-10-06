<?php
header('Content-Type: application/json');
include "konekdb";

$id = $_POST['id'];
$nama = $_POST['nama'];
$nis = $_POST['nis'];
$tplahir = $_POST['tplahir'];
$tglahir = $_POST['tglahlir'];
$kelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$alamat = $_POST['alamat'];

$stmt = $db->prepare("UPDATE siswa SET nis = ?, nama = ?, tplahir = ?, tglahir = ?, kelamlin = ?, agama = ?, alamat = ? WHERE id = ?");
$result = $stmt->execute([$nis, $nama, $tplahir, $tglahir, $kelamin, $kelamin, $agama, $alamat, $id]);

echo json_encode([
    'succes' => $result
]);

?>