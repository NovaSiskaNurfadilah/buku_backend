-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2023 pada 16.47
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nomor` varchar(20) DEFAULT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `tanggal_terdaftar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nomor`, `nama`, `jenis_kelamin`, `alamat`, `no_hp`, `tanggal_terdaftar`) VALUES
(1, '1', 'Nova Siska Nurfadilah', 'Perempuan', 'Jl. Lembah Sari', '082344312567', '2023-06-17'),
(2, '2', 'Lusi Diah Wiranti', 'Perempuan', 'JL. Garuda Sakti, Gg Sepakat', '08234567873', '2023-06-17'),
(3, '3', 'Hendrawansyah', 'Laki-laki', 'Jl. Srikandi', '085345667890', '2023-06-18'),
(4, '4', 'Dina Arsita', 'Perempuan', 'Jl. Buluh Cina', '082345665431', '2023-06-17'),
(5, '5', 'Hendrawansyah', 'Laki-laki', 'Jl.Swadaya', '08232', '2023-06-19'),
(6, '6', 'Fayat', 'Laki-laki', 'Jl.Taman Karya', '08232', '2023-06-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `kode_kategori` varchar(50) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `tanggal_input` date DEFAULT NULL,
  `harga` varchar(200) DEFAULT NULL,
  `file_cover` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `kode`, `kode_kategori`, `judul`, `pengarang`, `penerbit`, `tahun`, `tanggal_input`, `harga`, `file_cover`) VALUES
(1, 'IC001', 'NOV001', 'Laskar Pelangi', 'Andrea Hirata', 'Benteng Pustaka', 2005, '2023-06-14', 'Rp.65.000', NULL),
(2, 'IC002', 'NOV002', 'Ki Hadjar Dewantara : pemikiran dan perjuangannya', 'Suhartono Wiryopranoto, dkk.', 'Museum Kebangkitan Nasional', 2017, '2023-06-14', 'Rp.50.000', NULL),
(3, 'IC003', 'NOV002', 'Keterampilan Berbicara', 'Elvi Susanti', 'PT RajaGrafindo Persada', 2018, '2023-06-14', 'Rp.87.000', NULL),
(4, 'IC004', 'NOV001', 'Bumi', 'Tere Liye', 'Gramedia Pustaka Utama', 2014, '2023-06-14', 'Rp.90.000', NULL),
(5, 'IC005', 'NOV001', 'Bulan', 'Tere Liye', 'Gramedia Pustaka Utama', 2015, '2023-06-14', 'Rp.85.000', NULL),
(6, 'IC006', 'NOV001', 'Matahari', 'Tere Liye', 'Gramedia Pustaka Utama', 2016, '2023-06-14', 'Rp.90.000', NULL),
(7, 'IC007', 'NOV001', 'Bintang', 'Tere Liye', 'Gramedia Pustaka Utama', 2017, '2023-06-14', 'Rp.85.000', NULL),
(8, 'IC008', 'NOV001', 'Ceros dan Batozar', 'Tere Liye', 'Gramedia Pustaka Utama', 2018, '2023-06-14', 'Rp.76.000', NULL),
(15, 'IC015', 'NOV002', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', 1980, '2023-06-15', 'Rp.75.000', NULL),
(16, 'IC016', 'NOV002', '\"Pemrograman Dasar dengan Bahasa Python\"', 'Retno Wulandari', 'Elex Media Komputindo', 2020, '2023-06-15', 'RP.100.000', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kode`, `kategori`) VALUES
(1, 'NOV001', 'Buku Fiksi'),
(2, 'NOV002', 'Buku Non-Fiksi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_detail`
--

CREATE TABLE `peminjaman_detail` (
  `id` int(11) NOT NULL,
  `id_peminjaman_master` int(11) DEFAULT NULL,
  `kode_buku` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman_detail`
--

INSERT INTO `peminjaman_detail` (`id`, `id_peminjaman_master`, `kode_buku`) VALUES
(1, 1, 'IC003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_master`
--

CREATE TABLE `peminjaman_master` (
  `id` int(11) NOT NULL,
  `tanggal_peminjaman` date DEFAULT NULL,
  `nomor_anggota` varchar(20) DEFAULT NULL,
  `status_peminjaman` enum('DIPINJAM','DIKEMBALIKAN') DEFAULT NULL,
  `tanggal_pengembalian` date DEFAULT NULL,
  `durasi_keterlambatan` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman_master`
--

INSERT INTO `peminjaman_master` (`id`, `tanggal_peminjaman`, `nomor_anggota`, `status_peminjaman`, `tanggal_pengembalian`, `durasi_keterlambatan`) VALUES
(1, '2023-07-01', '1', 'DIPINJAM', '2023-07-05', 1),
(2, '2023-07-01', '1', 'DIKEMBALIKAN', '2023-07-05', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD KEY `kode_kategori` (`kode_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indeks untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_peminjaman_master` (`id_peminjaman_master`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- Indeks untuk tabel `peminjaman_master`
--
ALTER TABLE `peminjaman_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomor_anggota` (`nomor_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `peminjaman_master`
--
ALTER TABLE `peminjaman_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`kode_kategori`) REFERENCES `kategori` (`kode`);

--
-- Ketidakleluasaan untuk tabel `peminjaman_detail`
--
ALTER TABLE `peminjaman_detail`
  ADD CONSTRAINT `peminjaman_detail_ibfk_1` FOREIGN KEY (`id_peminjaman_master`) REFERENCES `peminjaman_master` (`id`),
  ADD CONSTRAINT `peminjaman_detail_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `buku` (`kode`);

--
-- Ketidakleluasaan untuk tabel `peminjaman_master`
--
ALTER TABLE `peminjaman_master`
  ADD CONSTRAINT `peminjaman_master_ibfk_1` FOREIGN KEY (`nomor_anggota`) REFERENCES `anggota` (`nomor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
