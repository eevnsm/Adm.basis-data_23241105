-- Nama: Sami Sayyiddin
-- Nim : 23241105
-- Kelas: C
-- Modul : Modul-3 A database

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
-- tampilkan semua kolom dari table tr_penjualan dengan mengurutkan berdasarkan qty dan tgl_transaksi.
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;
-- tampilkan semua kolom dari table ms_pelanggan dengan mengurutkan berdasarkan qty dan nama_pelanggan.
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;
-- tampilkan semua kolom dari table ms_pelanggan dengan mngurutkan berdasarkan qty dan alamat.
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- Praktek 3
-- ambil nama produk, qty dari tb penjualan urutan qty besar ke kecil
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- Praktek 4
-- ambil nama produk, qty dari tb penjualan urut qty DESC, nama produk asc
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk ASC;
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- LATIHAN MANDIRI 2
-- ambil nama produk, qty dari tb penjualan urutan qty kecil ke besar
SELECT * FROM tr_penjualan ORDER BY tgl_transaksi DESC, qty ASC;
-- ambil nama produk, qty dari tabel ms_pelanggan urutan qty secara menaik dan nama_pelanggan secara menurun.
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;
-- ambil nama produk, qty dari tabel ms_pelanggan urutan qty secara menaik dan alamat secara menurun.
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- Praktek 5
-- menggunakan ORDER BY dari hasil perhitungan kolom
-- ambil nama produk, qty, harga dan perkalian qty*harga, urut qty*harga
SELECT nama_produk, qty, harga, qty*harga AS total
FROM tr_penjualan
ORDER BY total DESC;

-- LATIHAN MANDIRI 3
-- tampilkan semua data dari tabel tr_penjualan_dqlab dan hitung: Total harga (qty × harga), Diskon sebesar 10% dari total harg Total harga setelah diskon Urutkan hasil berdasarkan harga setelah diskon dari yang terbesar ke terkecil.
SELECT *, (qty * harga) AS harga_total,
       ((qty * harga) * 10 / 100) AS diskon,
       (qty * harga) - ((qty * harga) * 10 / 100) AS harga_setelah_diskon
FROM tr_penjualan
ORDER BY harga_setelah_diskon DESC;

-- WHERE Dengan ORDER BY 
-- Mengurutkan hasil filtering dari sebuah query
-- Praktek 6
-- Ambil nama produk dari qty untuk produk yang berawalan F urut qty besar kecil
SELECT nama_produk, qty FROM tr_penjualan WHERE nama_produk LIKE 'F%' ORDER BY qty DESC;

-- Fungsi Ggregasi
-- digunakan untuk mengolah beberapa baris dalam kolom data
-- Praktek 7
-- Hitung jumlah (SUM) qty terjual pada penjualan
SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan; -- ada 42 produk yang terjadi

-- Praktek 8
-- Hitung semua transaksi yang terjadi pada tr_penjualan
SELECT  COUNT(*) FROM tr_penjualan;

-- Praktek 9 
-- Hitung qty terjual dan hitung transaksi yang terjadi
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;
 
-- Praktek 10
-- Hitung rata-rata qty terjual per transaksi AVG()
-- Hitung qty terbanyak terjual per transaksi MAX()
-- Hitung qty paling sedikit terjual per transaksi MIN()
SELECT AVG(qty), MAX(qty), MIN(qty) FROM tr_penjualan;
 
-- COUNT(DISTINCT) / hanya menampilkan angka
-- digunakan untuk menghitung nilai unik terdapat pada sebuah kolom
-- Praktek 11
select count(nama_produk) from tr_penjualan; -- ada 15
select count(distinct nama_produk) from tr_penjualan; -- ada 10 produk

-- Praktek 12
select count(nama_produk), count(distinct nama_produk) from tr_penjualan;

-- Praktek 13
-- Ambil nama produk dan hitung nilai max (terbanyak) dari qty
select nama_produk, max(qty) from tr_penjualan;

-- Group BY 
-- (mengelompokkan isi data dari satu atau bnyk kolom) / untuk menampilkan semua nama produk pada agregasi(perhitungan)
-- biasanya digabung dengan fungsi agregasi
-- Praktek 14
-- menampilkan nama produk dari hasil pengelompokan berdasarkan nama produk
select nama_produk, max(qty) from tr_penjualan group by nama_produk;

-- Praktek 15
-- menampilkan nama produk dan qty dari hasil kelompok nama produk dan qty
select nama_produk, qty from tr_penjualan group by nama_produk, qty;

-- Praktek 16
-- tampilkan semua produk dan total qty terjual
select nama_produk, sum(qty) from tr_penjualan group by nama_produk;

-- Praktek 17
-- tampilkan semua produk dan total qty terjual urut dari qty terbanyak
select nama_produk, sum(qty) from tr_penjualan group by nama_produk order by sum(qty) desc;

-- Having
-- untuk filtering dari hasil fungsi agregasi dan group by
-- Praktek 18
-- ambil nama produk yang total qty terjualnya diatas 2
select nama_produk, sum(qty) from tr_penjualan group by nama_produk having sum(qty) > 2 order by sum(qty) desc;

-- LATIHAN MANDIRI 4
-- Melihat daftar nama produk yang total jumlah produk terjual per kelompok nama produk adalah di atas nilai 4
SELECT nama_produk, SUM(qty) AS total_terjual
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 4;
-- Melihat daftar  nama produk yang total jumlah produk terjual per kelompok nama produk sama dengan 9
SELECT nama_produk, SUM(qty) AS total_terjual
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) = 9;
-- Melihat daftar kelompok nama produk dan total nilai penjualan (harga dikalikan, jumlah dikurangi diskon) dengan dan urutan berdasarkan nilai penjualan terbesar
select nama_produk, sum(harga*qty-diskon_persen) as nilai_penjualan from tr_penjualan 
group by nama_produk order by nilai_penjualan desc;

-- LATIHAN MANDIRI 5
-- Tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan berdasarkan tgl_transaksi (descending) dan qty (ascending)
SELECT * FROM tr_penjualan
ORDER BY tgl_transaksi DESC, qty ASC;
-- Tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan nama_pelanggan secara descending
SELECT * FROM ms_pelanggan
ORDER BY nama_pelanggan DESC;
-- Tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan berdasarkan alamat secara descending
SELECT * FROM ms_pelanggan 
ORDER BY alamat DESC;

-- LATIHAN MANDIRI 6
-- Tampilkan semua kolom dari transaksi penjualan yang memiliki diskon dan diurutkan berdasarkan harga tertinggi
select * From tr_penjualan WHERE diskon_persen>0 order by harga desc;

-- Tampilkan kolom nama produk, kuantitas pembelian dan harga dari transaksi penjualan yang memiliki harga minimal seratus ribu rupiah dan diurutkan berdasarkan harga tertinggi
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;
-- Tampilkan kolom nama produk, qty, harga dari tabel transaksi. harga minimal 100k atau nama produk berawalan karakter T dan urut dari diskon tertinggi
select nama_produk, qty, harga from tr_penjualan where harga>=100000 or nama_produk like 'T%' order by diskon_persen desc;
DESCRIBE tr_penjualan;


	



