<?php 

include "konekdb.php"; // Pastikan database telah dipilih di sini
header('Content-Type: application/json');

$nama = $_POST['nama'];
$nis = $_POST['nis'];
$tplahir = $_POST['tplahir'];
$tglahir = $_POST['tglahir'];
$nkelamin = $_POST['kelamin'];
$agama = $_POST['agama'];
$alamat = $_POST['alamat'];

// Gunakan $db, bukan $nm_database
$stmt = $db->prepare("INSERT INTO siswa (nis, nama, tplahir, tglahir, kelamin, agama, alamat) VALUES (?, ?, ?, ?, ?, ?, ?)" );
$result = $stmt->execute([$nis, $nama, $tplahir, $tglahir, $nkelamin, $agama, $alamat]);

echo json_encode([
    'success' => $result
]);

?>
