-- nama : Sami Sayyiddin
-- NIM : 23241105
-- kelas : C

-- Melihat database yang ada
show DATABASES ;

-- melihat database
USE mysql;
-- melihat tabel dalam database mysql
show TABLES

--Mendeskripsikan sebuah table yang di pilih ex. tabel 'user'
DESCRIBE user;
--Melihat isi tabel user, khusu untuk kolom host, user dan password
select host, user, password FROM user
