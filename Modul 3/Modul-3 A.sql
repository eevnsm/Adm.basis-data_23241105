-- Nama: Angga Saputra
-- Nim : 23241084
-- Kelas: C
-- Modul : Modul-3 database

-- menggunakan database
use ptic_mart;

-- ORDER BY
-- menggunakan data dari sebuah field/kolo, atau hasil oleh kolom
-- Praktek 1
-- ambil nama produk dan qty dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- Praktek 2
-- ambil nama produk, qty dari tb penjualan urutkan qty dan nama produk
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- LATIHAN MANDIRI 1
-- tampilkan semua kolom dari table tr_penjualan_dqlab dengan mengurutkan berdasarkan qty dan tgl_transaksi.
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
SELECT * FROM ms_pelanggan_dqlab ORDER BY qty, nama_pelanggan;
SELECT * FROM ms_pelanggan ORDER BY qty, alamat;

-- Praktek 3
-- ambil nama produk, qty dari tb penjualan urutan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Praktek 4
-- ambil nama produk, qty dari tb penjualan urut qty DESC, nama produk asc
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk ASC;
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- LATIHAN MANDIRI 2
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
SELECT * FROM ms_pelanggan ORDER BY qty, nama_pelanggan DESC;
SELECT * FROM ms_pelanggan ORDER BY qty, alamat DESC;

-- Praktek 5
-- menggunakan ORDER BY dari hasil perhitungan kolom
-- ambil nama produk, qty, harga dan perkalian qty*harga, urut qty*harga
SELECT nama_produk, qty, harga, qty*harga AS total
FROM tr_penjualan
ORDER BY total DESC;

-- LATIHAN MANDIRI 3



