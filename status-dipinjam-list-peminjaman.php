<?php
include 'koneksi.php';

$conn = getConnection();

// Mendapatkan daftar peminjaman dengan status DIPINJAM
$query = "SELECT * FROM peminjaman_master JOIN peminjaman_detail WHERE status_peminjaman = 'DIPINJAM'";
$result = $conn->query($query);

if ($result !== false && $result->rowCount() > 0) {
    $peminjaman = $result->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($peminjaman);
} else {
    echo "Tidak ada data peminjaman dengan status DIPINJAM.";
}

$conn = null;
?>
