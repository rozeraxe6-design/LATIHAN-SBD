-- =================================================================
-- MATA KULIAH: Praktikum Sistem Basis Data
-- MATERI: Pertemuan 1 s.d. Pertemuan 6 (DDL, DML, SELECT, UPDATE, DELETE)
-- =================================================================

-- 1. PERTEMUAN 1 & 2: MEMBUAT DATABASE & MENGENAL TIPE DATA (DDL)
DROP DATABASE IF EXISTS db_akademik_quiz;
CREATE DATABASE db_akademik_quiz;
USE db_akademik_quiz;

-- Membuat tabel 'mahasiswa' dengan berbagai tipe data (INT, VARCHAR, DATE, DECIMAL)
CREATE TABLE mahasiswa (
    id_mhs INT PRIMARY KEY,               -- Pertemuan 5: Primary Key (unik & tidak boleh NULL)
    nama_lengkap VARCHAR(50) NOT NULL,    -- Pertemuan 2: Tipe data teks variabel
    jenis_kelamin ENUM('L', 'P'),         -- Pertemuan 2: Tipe data pilihan tetap
    tanggal_lahir DATE,                   -- Pertemuan 2: Tipe data tanggal (YYYY-MM-DD)
    ipk DECIMAL(3,2)                      -- Pertemuan 2: Tipe data desimal (contoh: 3.75)
);


-- 2. PERTEMUAN 3: MENAMBAHKAN DATA KE TABEL (DML - INSERT)
-- Cara 1: Menyebutkan kolom secara spesifik (Direkomendasikan)
INSERT INTO mahasiswa (id_mhs, nama_lengkap, jenis_kelamin, tanggal_lahir, ipk) 
VALUES (1, 'Budi Santoso', 'L', '2004-05-12', 3.75);

-- Cara 2: Langsung memasukkan nilai sesuai urutan kolom tabel
INSERT INTO mahasiswa 
VALUES (2, 'Siti Aminah', 'P', '2005-01-20', 3.85);

-- Menambahkan beberapa data tambahan untuk latihan query
INSERT INTO mahasiswa (id_mhs, nama_lengkap, jenis_kelamin, tanggal_lahir, ipk) VALUES
(3, 'Ahmad Fauzi', 'L', '2004-11-05', 3.40),
(4, 'Dewi Lestari', 'P', '2005-03-15', 3.90),
(5, 'Rian Pratama', 'L', '2003-08-22', 2.95);


-- 3. PERTEMUAN 5: SELECT, PRIMARY KEY, & WHERE CLAUSE
-- A. Menampilkan seluruh kolom dan data dari tabel
SELECT * FROM mahasiswa;

-- B. Menampilkan kolom tertentu saja (Proyeksi)
SELECT nama_lengkap, ipk FROM mahasiswa;

-- C. Menggunakan WHERE untuk menyaring data (Contoh: mencari mahasiswa dengan IPK di atas 3.50)
SELECT * FROM mahasiswa 
WHERE ipk > 3.50;


-- 4. PERTEMUAN 6: UPDATE, DELETE, DAN ALIAS

-- A. UPDATE: Mengubah data yang sudah ada
-- CATATAN KUNCI: Wajib pakai WHERE agar tidak mengubah seluruh baris di tabel!
UPDATE mahasiswa 
SET ipk = 3.95, nama_lengkap = 'Budi Santoso, S.Kom.' 
WHERE id_mhs = 1;

-- B. DELETE: Menghapus baris data tertentu
-- CATATAN KUNCI: Wajib pakai WHERE agar tidak menghapus seluruh isi tabel!
DELETE FROM mahasiswa 
WHERE id_mhs = 5;

-- C. ALIAS (AS): Memberikan nama sementara pada kolom saat ditampilkan
SELECT 
    id_mhs AS ID, 
    nama_lengkap AS Nama_Mahasiswa, 
    ipk AS Indeks_Prestasi 
FROM mahasiswa;