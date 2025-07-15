-- Nama  : Angga Saputra
-- NIM   : 23241084
-- Kelas : C  
-- Modul : Modul 1 SELECT, PREFIX dan ALIAS

-- Menggunakan database
USE ptic_mart;

-- SELECT statment
-- praktek 1
-- Ambil kolom nama produk dari tabel produk
SELECT nama_produk FROM ms_produk;

-- Praktek 2
-- Ambil kolom nama produk dan harga dari tabel produk
SELECT nama_produk, harga FROM ms_produk;

-- Praktek 3
-- Ambil semua kolom dari tabel
SELECT *FROM ms_produk;

-- Praktek 4
-- Ambil kolom kode_Produk, nama_Produk dari tabel ms_produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- Praktek 5
-- Ambil nama produk dari tabel produk, gunakan tabel sebagai prefix
SELECT ms_produk.nama_produk FROM ms_produk;


-- Praktek 6
-- Ambil nama Produk dari tabel produk dan gunakan tabel dan database
SELECT ptic_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS
-- Praktek 7
-- Ambil nama produk dari tabel produk, aliaskan nama produk dengan np
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- Praktek 8
-- ambil nama produk dari tabel produk, Aliaskan tabel produk dengan msp
SELECT nama_produk FROM ms_produk AS msp;

-- Praktek 9
-- menggunakan alias dan prefix secara bersamaan
-- ambil nama produk dari tabel produk, aliaskan tabel produk dengan msp, dan jadikan prefix untuk kolom
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
-- ambil nama pelanggan dan alamat dari tabel ms_pelanggan
SELECT nama_pelanggan, alamat FROM ms_pelanggan;

-- CASE 2
-- ambil produk dan harga dari tabel ms_produk
SELECT nama_produk, harga FROM ms_produk;


