<?php
// Ganti dengan konfigurasi database kamu
$host = 'localhost';
$dbname = 'biodata'; // Ganti dengan nama database kamu
$username = 'root'; // Ganti dengan username kamu
$password = ''; // Ganti dengan password kamu

header('Content-Type: application/json');
include "konekdb.php";

try {
    // Membuat koneksi PDO
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    
    // Mengatur mode error PDO
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Query SQL
    $sql = 'SELECT id, nis, nama FROM siswa'; // Ganti query dengan yang sesuai
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch data
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($results as $row) {
        echo $row['id'] . ' - ' . $row['nis'] . ' - ' . $row['nama'] . '<br>';
    }

} catch (PDOException $e) {
    // Menampilkan error jika koneksi gagal
    echo 'Connection failed: ' . $e->getMessage();
}
?>
