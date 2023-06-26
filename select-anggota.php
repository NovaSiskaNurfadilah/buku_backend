<?php
// Menghubungkan ke database menggunakan file koneksi.php
include 'koneksi.php';

try {
  // Membuat objek PDO dan menghubungkan ke database
  $pdo = new PDO("mysql:host=localhost;dbname=buku", "root", "");
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  // Menyiapkan pernyataan SQL untuk melakukan SELECT
  $sql = "SELECT * FROM anggota";
  $stmt = $pdo->query($sql);

  // Mengambil seluruh data anggota
  $anggota = $stmt->fetchAll(PDO::FETCH_ASSOC);

  // Mengubah data anggota menjadi format JSON
  $json = json_encode($anggota);

  // Menampilkan data anggota dalam format JSON
  echo $json;
} catch (PDOException $e) {
  // Menampilkan pesan error jika terjadi kesalahan
  echo "Error: " . $e->getMessage();
}
?>
