-- Nama : Sami Sayyiddin
-- Nim  : 23241105
-- Kelas: C
-- Kelas: Pendidikan Teknologi Informasi

-- Membat Database 
CREATE DATABASE pti_mart;

-- Menggunakan Database
USE pti_mart;

-- Membuat Tabel
CREATE TABle Pelanggan(
id_pelanggan INT PRIMARY KEY NOT NULL,
nama_pelanggan VARCHAR (50),
alamat VARCHAR (100),
kota VARCHAR (20),
no_tlp VARCHAR (15)
);
     
CREATE TABLE produk(
id_produk int PRIMARY KEY NOT NULL,
nama_produk VARCHAR (50),
kategori VARCHAR (20),
harga int (17),
stok int (10)
);

-- membuat tabel dengan forign key
CREATE TABLE transaksi(
id_transaksi int PRIMARY KEY NOT NULL,
tgl_transaksi DATE,
id_produk int,
id_pelanggan int,
qty int,
total_harga int,
FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

-- mengisi data dalam tabel
INSERT INTO pelanggan(
id_pelanggan, alamat, kota, no_tlp
)VALUES
(007," Skayzone", "Jl pemuda No.  255", "Mataram", "0897709");

INSERT INTO produk(
id_produk, nama_produk, kategori, harga, stok
)VALUES
(211, "mie", "makanan", "25.000", "2"),
(007,"Leviathan", "Jl pemuda No. 565", "Mataram", "08266600721");
(008,"bobrock", "Jl suranadi No.19", "Mataram", "0829857464848");
(008,"skayzone", "Jl kuta No.26", "Mataram", "0829858464948");
(008,"bobrock", "Jl datok lopan No.10", "Mataram", "0829859464808");

-- cek apakah data ada
SELECT FROM pelanggan;
SELECT FROM produk;

-- mengisi data pada tabel yang ada foreign key
INSERT INTO transaksi
set id_transaksi = 2911,
tgl_transaksi = "2025-02-22",
id_produk = (
SELECT id_produk FROM produk
WHERE id_produk = 211),
id_pelanggan = (
SELECT id_pelanggan FROM pelanggan
WHERE id_pelanggan = 007),
qty = 1,
total_harga = (
SELECT harga FROM produk
WHERE id_produk = 211) * qty;

SELECT * FROM transaksi
     
