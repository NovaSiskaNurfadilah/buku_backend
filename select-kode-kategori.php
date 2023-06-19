
<?php
// Include file koneksi.php untuk mendapatkan koneksi ke database
include 'koneksi.php';

$conn = getConnection();

// Mendapatkan data yang dikirim melalui metode GET
$kode = isset($_GET['kode']) ? $_GET['kode'] : '';

try {
    // Query SQL untuk mengambil data kategori berdasarkan kode
    $query = "SELECT * FROM kategori WHERE kode = :kode";
    
    // Mempersiapkan statement PDO untuk eksekusi query
    $statement = $conn->prepare($query);
    
    // Mengikat parameter dengan nilai yang sesuai
    $statement->bindParam(':kode', $kode);
    
    // Eksekusi statement
    $statement->execute();
    
    // Mengambil hasil query dalam bentuk associative array
    $kategori = $statement->fetch(PDO::FETCH_ASSOC);
    
    if ($kategori) {
        // Jika kategori ditemukan, kirimkan response dengan status sukses dan data kategori
        $response = [
            'status' => 'success',
            'data' => $kategori
        ];
    } else {
        // Jika kategori tidak ditemukan, kirimkan response dengan status error
        $response = [
            'status' => 'error',
            'message' => 'Kategori tidak ditemukan'
        ];
    }
} catch(PDOException $e) {
    // Jika terjadi error, tampilkan pesan error
    $response = [
        'status' => 'error',
        'message' => 'Terjadi kesalahan saat mengambil data kategori: ' . $e->getMessage()
    ];
}

// Mengirimkan response dalam format JSON
header('Content-Type: application/json');
echo json_encode($response);

// Menutup koneksi
$conn = null;
?>