-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Mar 2023 pada 11.41
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
-- Database: `plate`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kendaraan`
--

CREATE TABLE `kendaraan` (
  `nomor_plat` varchar(30) NOT NULL,
  `nama_pemilik` varchar(30) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `manufacture_year` varchar(30) NOT NULL,
  `cc` int(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `fuel_type` varchar(30) NOT NULL,
  `regist_year` int(30) NOT NULL,
  `date_exp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kendaraan`
--

INSERT INTO `kendaraan` (`nomor_plat`, `nama_pemilik`, `brand`, `type`, `manufacture_year`, `cc`, `color`, `fuel_type`, `regist_year`, `date_exp`) VALUES
('B1970SSW', 'Kevin', 'Hyundai', 'Santa Fe', '2022', 2500, 'white', 'diesel', 2023, '2028'),
('B2658CBE', 'Abel', 'Honda', 'HRV', '2017', 1800, 'white', 'gasoline', 2017, '2027'),
('B505WLG', 'Muzi', 'Toyota', 'Yaris', '2021', 1500, 'hitam', 'gasoline', 2021, '2026'),
('G1130BM', 'Filo', 'Toyota', 'Kijang Innova', '2012', 2500, 'grey', 'diesel', 2013, '2027'),
('MH12DE1433', 'Bariq', 'Ford', 'Focus', '2014', 1200, 'grey', 'gasoline', 2015, '2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_03_15_161945_create_user_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`created_at`, `updated_at`, `firstname`, `lastname`, `email`, `password`) VALUES
('2023-03-21 11:26:53', '2023-03-21 11:26:53', 'Kevin', 'Naserwan', 'kevinnaserwan@gmail.com', '1234'),
('2023-03-21 11:26:58', '2023-03-21 11:26:58', 'Kevin', 'Naserwan', 'kevinnaserwan@gmail.com', '1234'),
('2023-03-21 11:28:39', '2023-03-21 11:28:39', 'Filo', 'Naserwan', 'kevin@gmail.com', 'abcd'),
('2023-03-21 11:31:26', '2023-03-21 11:31:26', 'Kevin', 'Putra', 'naser@gmail.com', '12'),
('2023-03-23 21:01:26', NULL, 'Kevin', 'Naserwan', 'kevinnaserwan@gmail.com', '$2y$10$JFGfcHTvtehN.MxZSBXf4OlJhp0wXTEDvwnNHGaqtmwqj8vGLtGJa'),
('2023-03-23 21:02:34', NULL, 'Kevin', 'Naserwan', 'naserwan@gmail.com', '$2y$10$Ak5C02o4uasm608P.uzJu.10wXn/S2foKpCTJ/jUqglPIqDPJ3Wkq'),
('2023-03-24 01:16:40', '2023-03-24 01:16:40', 'k', 'n', 'n@gmail.com', '$2y$10$TsHSfdCd/UxWChSSLTsXHOKhxziX/1djhDhgmFkhcObdsV4Q0.KCS');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`nomor_plat`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
