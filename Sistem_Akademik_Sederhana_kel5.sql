-- Kelompok Lima: "Sistem Akademik Sederhana"
-- 1. Franklyn Lumbantoruan_11323010
-- 2. Ferry Siagian_11323011
-- 3. Agnes Sidabutar_11323047
-- 4. Abeloisa Pardosi_11323005


-- Database: kelompok_lima

-- DROP DATABASE IF EXISTS kelompok_lima;

-- create table --
CREATE DATABASE kelompok_lima
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Indonesian_Indonesia.1252'
    LC_CTYPE = 'Indonesian_Indonesia.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE mahasiswa (
    NIM VARCHAR(10) PRIMARY KEY,
    nama_mhs VARCHAR(100),
    prodi VARCHAR(50),
    jenis_kelamin CHAR(1) CHECK (jenis_kelamin IN ('L', 'P')),
    email_mhs VARCHAR(100),
    kelas VARCHAR(10)
);

CREATE TABLE matakuliah (
	id_matakuliah VARCHAR(10) PRIMARY KEY,
	nama_matakuliah VARCHAR(100),
	jumlah_sks INT CHECK (jumlah_sks > 0),
	dosen VARCHAR(100)
);

CREATE TABLE nilai (
	nilai NUMERIC(10, 2) CHECK (nilai >= 0 AND nilai <= 100),
	NIM VARCHAR(10),
    id_matakuliah VARCHAR(10),
    Foreign Key (NIM) references mahasiswa(NIM) ON DELETE CASCADE,
    foreign key (id_matakuliah) references matakuliah(id_matakuliah) ON DELETE CASCADE

);

CREATE TABLE jadwal_mata_kuliah (
    id SERIAL PRIMARY KEY,
    Tanggal DATE,
    Hari TEXT,
    "Mata Kuliah" TEXT,
    Waktu TEXT,
    Ruangan TEXT
);

-- insert dummy data --
INSERT INTO mahasiswa (NIM, nama_mhs, prodi, jenis_kelamin, email_mhs, kelas)
VALUES
('11323010', 'Franklyn Lumbantoruan', 'Teknologi Informasi', 'L', 'franklyn@itdel.ac.id', '32TI1'),
('11323011', 'Ferry Siagian', 'Teknologi Informasi', 'L', 'ferry@itdel.ac.id', '32TI1'),
('11323047', 'Agnes Sidabutar', 'Teknologi Informasi', 'P', 'agnes@itdel.ac.id', '32TI2'),
('11323005', 'Abeloisa Pardosi', 'Teknologi Informasi', 'P', 'abeloisa@itdel.ac.id', '32TI1'),
('12S13005', 'Mabeloisa Manurung', 'Sistem Informasi', 'L', 'mabeloisa@itdel.ac.id', '32SI1'),
('14S23001', 'Aan Kiki Siahaan', 'Teknik Elektro', 'L', 'aankiki@itdel.ac.id', '32TE1'),
('11423040', 'Noel Terompet Sitinjak', 'Teknologi Rekayasa Perangkat Lunak', 'L', 'terompet@itdel.ac.id', '42TRPL1'),
('11S23019', 'Hanni Barus', 'Informatika', 'P', 'hanni@itdel.ac.id', '32IF1'),
('21S23030', 'Ryka Simbolon', 'Manajemen Rekayasa', 'P', 'ryka@itdel.ac.id', '32MR2'),
('13323045', 'Ripi Gramaldy Hugo', 'Teknologi Komputer', 'L', 'disinihugo@itdel.ac.id', '32TK2'),
('12S13006', 'Monica Ginting', 'Sistem Informasi', 'P', 'monica@itdel.ac.id', '32SI1'),
('12S13060', 'Erick Sitohang', 'Sistem Informasi', 'L', 'erick@itdel.ac.id', '32SI2'),
('14S23002', 'Robert Sinaga', 'Teknik Elektro', 'L', 'robert@itdel.ac.id', '32TE1'),
('14S23050', 'Yohana Samosir', 'Teknik Elektro', 'P', 'yohana@itdel.ac.id', '32TE2'),
('11423041', 'Julius Hutabarat', 'Teknologi Rekayasa Perangkat Lunak', 'L', 'julius@itdel.ac.id', '42TRPL1'),
('11423042', 'Merry Marpaung', 'Teknologi Rekayasa Perangkat Lunak', 'P', 'merry@itdel.ac.id', '42TRPL2'),
('11S23020', 'Joshua Sitanggang', 'Informatika', 'L', 'joshua@itdel.ac.id', '32IF1'),
('11S23021', 'Clara Nababan', 'Informatika', 'P', 'clara@itdel.ac.id', '32IF2'),
('21S23031', 'Samuel Siahaan', 'Manajemen Rekayasa', 'L', 'samuel@itdel.ac.id', '32MR1'),
('21S23032', 'Gabriela Simarmata', 'Manajemen Rekayasa', 'P', 'gabriela@itdel.ac.id', '32MR2'),
('13323046', 'Budi Pardede', 'Teknologi Komputer', 'L', 'budi@itdel.ac.id', '32TK2'),
('13323041', 'Siska Manurung', 'Teknologi Komputer', 'P', 'siska@itdel.ac.id', '32TK1');

INSERT INTO matakuliah (id_matakuliah, nama_matakuliah, jumlah_sks, dosen)
VALUES
('MK001', 'Basis Data', 3, 'Dr. Chintya'),
('MK002', 'Dasar Pemrograman', 3, 'Dr. Rudy Manurung'),
('MK003', 'Matematika Diskrit', 3, 'Dr. Pusi Simarmata'),
('MK004', 'Jaringan Komputer', 3, 'Dr. Siringo-ringo'),
('MK005', 'Sistem Operasi', 2, 'Dr. Janri Simbolon'),
('MK006', 'Algoritma dan Pemrograman', 3, 'Dr. Indra Lumbantoruan'),
('MK007', 'Kecerdasan Buatan', 2, 'Dr. Manalu');

INSERT INTO nilai (nilai, NIM, id_matakuliah)
VALUES
(85, '11323010', 'MK001'),
(90, '11323010', 'MK002'),
(78, '11323011', 'MK001'),
(82, '11323011', 'MK003'),
(88, '11323047', 'MK002'),
(76, '11323005', 'MK003'),
(89, '12S13005', 'MK003'),
(75, '12S13006', 'MK004'),
(88, '12S13060', 'MK006'),
(80, '14S23001', 'MK004'),
(78, '14S23002', 'MK006'),
(85, '14S23050', 'MK007'),
(93, '11423040', 'MK006'),
(90, '11423041', 'MK005'),
(88, '11423042', 'MK004'),
(95, '11S23019', 'MK007'),
(89, '11S23020', 'MK001'),
(84, '11S23021', 'MK002'),
(77, '21S23030', 'MK003'),
(88, '21S23031', 'MK004'),
(92, '21S23032', 'MK005'),
(81, '13323045', 'MK001'),
(87, '13323046', 'MK002'),
(79, '13323041', 'MK003');

INSERT INTO jadwal_mata_kuliah (Tanggal, Hari, "Mata Kuliah", Waktu, Ruangan) VALUES
('2024-08-20', 'Selasa', 'PBO(T)', '08:00-08:50', 'GD 525'),
('2024-08-20', 'Selasa', 'IoT(T)', '09:00-09:50', 'GD 525'),
('2024-08-20', 'Selasa', 'SKADA(P)', '10:00-10:50', 'GD 516'),
('2024-08-20', 'Selasa', 'SKADA(P)', '11:00-11:50', 'GD 516'),
('2024-08-20', 'Selasa', 'PBO(P)', '13:00-13:50', 'GD 526'),
('2024-08-20', 'Selasa', 'PBO(P)', '14:00-14:50', 'GD 526'),
('2024-08-20', 'Selasa', 'JARKOM(P)', '15:00-15:50', 'GD 527'),
('2024-08-20', 'Selasa', 'JARKOM(P)', '15:50-16:50', 'GD 527'),
('2024-09-10', 'Selasa', 'PBO(T)', '08:00-08:50', 'GD 525');

SELECT * FROM mahasiswa;
SELECT * FROM matakuliah;
SELECT * FROM nilai;
SELECT * FROM jadwal_mata_kuliah;


-- join menampilkan semua data dari ketiga tabel --
SELECT 
    mhs.NIM,
    mhs.nama_mhs,
    mhs.prodi,
    mhs.jenis_kelamin,
    mhs.email_mhs,
    mhs.kelas,
    mk.id_matakuliah,
    mk.nama_matakuliah,
    mk.jumlah_sks,
    mk.dosen,
    nl.nilai
FROM 
    mahasiswa mhs
LEFT JOIN 
    nilai nl 
ON 
    mhs.NIM = nl.NIM
LEFT JOIN 
    matakuliah mk 
ON 
    nl.id_matakuliah = mk.id_matakuliah;

-- VIEW --
-- 1. membuat view untuk menampilkan data mahasiswa -- 
CREATE VIEW view_mahasiswa AS
SELECT 
    NIM,
    nama_mhs,
    prodi,
    jenis_kelamin,
    email_mhs,
    kelas
FROM 
    mahasiswa;
SELECT * FROM view_mahasiswa;

-- 2. Menampilkan data mata kuliah 
CREATE VIEW view_matakuliah AS
SELECT 
    id_matakuliah,
    nama_matakuliah,
    jumlah_sks,
    dosen
FROM 
    matakuliah;
SELECT * FROM view_matakuliah;

-- 3. Menampilkan Nilai mahasiswa -- 
CREATE VIEW view_nilai_mhs AS
SELECT 
    n.NIM, m.nama_mhs, mk.nama_matakuliah, n.nilai
FROM nilai n JOIN mahasiswa m ON n.NIM = m.NIM
JOIN matakuliah mk ON n.id_matakuliah = mk.id_matakuliah;
SELECT * FROM view_nilai_mhs;

-- 4. Menampilkan Rata-rata nilai mahasiswa-
CREATE VIEW rata_nilai AS
SELECT 
    NIM, AVG(nilai) AS rata_rata_nilai
FROM  nilai GROUP BY  NIM;
SELECT * FROM rata_nilai;


-- TRIGGER --
-- 1. Trigger untuk mencatat setiap perubahan atau penambahan nilai
CREATE TABLE log_nilai (
    id SERIAL PRIMARY KEY,
    nim VARCHAR(10),
    id_matakuliah VARCHAR(10),
    nilai_lama NUMERIC(10, 2),
    nilai_baru NUMERIC(10, 2),
    waktu_perubahan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Fungsi untuk mencatat log
CREATE OR REPLACE FUNCTION update_nilai()
RETURNS TRIGGER AS $$
BEGIN
    -- Masukkan data perubahan ke tabel log_nilai
    INSERT INTO log_nilai (nim, id_matakuliah, nilai_lama, nilai_baru)
    VALUES (OLD.NIM, OLD.id_matakuliah, OLD.nilai, NEW.nilai);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger untuk memanggil fungsi
CREATE TRIGGER nilai_update_trigger
AFTER UPDATE ON nilai
FOR EACH ROW
EXECUTE FUNCTION update_nilai();

-- Uji trigger
UPDATE nilai SET nilai = 95 WHERE NIM = '11323010' AND id_matakuliah = 'MK001';
-- Cek tabel
SELECT * FROM log_nilai;

-- AUTHORIZATION --
CREATE USER user_mhs with password 'mhs123';
-- Berikan akses atau izin
GRANT SELECT ON mahasiswa, matakuliah, nilai to user_mhs;
-- Set role nya menjadi user_mhs
SET ROLE user_mhs;
-- Uji Authorization
SELECT * FROM nilai;
INSERT INTO nilai VALUES(20, '11323010', 'MK001');
-- Reset role
RESET ROLE;

-- TRANSACTION --
-- Mulai transaksi
BEGIN;

-- Tambahkan data ke tabel mahasiswa
INSERT INTO mahasiswa (NIM, nama_mhs, prodi, jenis_kelamin, email_mhs, kelas)
VALUES ('11S23001', 'Dodi', 'Informatika', 'L', 'dodi@itdel.ac.id', '32IF2');

-- Tambahkan data ke tabel nilai
INSERT INTO nilai (nilai, NIM, id_matakuliah)
VALUES (60, '11S23001', 'MK005');

-- Jika semua berhasil, commit transaksi
COMMIT;
-- Jika tidak berhasil, rollback transaksi
ROLLBACK;
-- Cek hasil transaksi
SELECT * FROM mahasiswa where nama_mhs = 'Dodi';

-- ERROR HANDLING TRANSACTION--
DO $$
BEGIN
    -- Mulai transaksi
    BEGIN

    -- Tambahkan data ke tabel mahasiswa
    INSERT INTO mahasiswa (NIM, nama_mhs, prodi, jenis_kelamin, email_mhs, kelas)
    VALUES ('11323060', 'Joniana', 'Teknologi Informasi', 'P', 'nianadisini@itdel.ac.id', '32TI2');

    -- Tambahkan data ke tabel nilai
    INSERT INTO nilai (nilai, NIM, id_matakuliah)
    VALUES (100, '11323060', 'MK008');

    -- Commit transaksi jika semua berhasil
    COMMIT;

    RAISE NOTICE 'Data berhasil disimpan.';
EXCEPTION WHEN OTHERS THEN
    -- Rollback jika ada kesalahan
    ROLLBACK;
    RAISE NOTICE 'Terjadi kesalahan: %', SQLERRM;
END; 
END $$;

-- STORED PROCEDURE --
-- Menambahkan mahasiswa baru dengan validasi
CREATE OR REPLACE PROCEDURE tambah_mahasiswa(
    p_nim VARCHAR(10), 
    p_nama VARCHAR(100), 
    p_prodi VARCHAR(50), 
    p_jenis_kelamin CHAR(1), 
    p_email VARCHAR(100), 
    p_kelas VARCHAR(10)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Validasi input
    IF p_jenis_kelamin NOT IN ('L', 'P') THEN
        RAISE EXCEPTION 'Jenis kelamin harus "L" (Laki-laki) atau "P" (Perempuan)';
    END IF;

    -- Cek apakah NIM sudah ada
    IF EXISTS (SELECT 1 FROM mahasiswa WHERE NIM = p_nim) THEN
        RAISE EXCEPTION 'NIM % sudah terdaftar', p_nim;
    END IF;

    -- Tambahkan mahasiswa baru
    INSERT INTO mahasiswa (
        NIM, 
        nama_mhs, 
        prodi, 
        jenis_kelamin, 
        email_mhs, 
        kelas
    ) VALUES (
        p_nim, 
        p_nama, 
        p_prodi, 
        p_jenis_kelamin, 
        p_email, 
        p_kelas
    );

    -- Tampilkan pesan sukses
    RAISE NOTICE 'Mahasiswa % berhasil ditambahkan', p_nama;
END;
$$;

-- Contoh penggunaan stored procedure
CALL tambah_mahasiswa(
    '11323099',
    'Baru Sekali',
    'Teknologi Informasi',
    'L',
    'baru@itdel.ac.id',
    '32TI2'
);


-- CURSOR -- 
-- menampilkan data mahasiswa beserta nilai mereka pada setiap mata kuliah. --
DO $$
DECLARE
    studentRecord RECORD;
BEGIN
    -- Cursor untuk membaca data mahasiswa dan nilai mereka
    FOR studentRecord IN
        SELECT m.nim, m.nama_mhs, m.prodi, mk.nama_matakuliah, n.nilai
        FROM mahasiswa m
        JOIN nilai n ON m.nim = n.nim
        JOIN matakuliah mk ON n.id_matakuliah = mk.id_matakuliah
    LOOP
        -- Cetak data setiap baris yang diambil
        RAISE NOTICE 'NIM: %, Nama: %, Prodi: %, Mata Kuliah: %, Nilai: %',
            studentRecord.nim, studentRecord.nama_mhs, studentRecord.prodi,
            studentRecord.nama_matakuliah, studentRecord.nilai;
    END LOOP;
END $$;

-- FITUR UTAMA --
-- 1. Fungsi menghitung IPK otomatis
-- Tambahkan kolom ipk ke tabel mahasiswa
ALTER TABLE mahasiswa ADD COLUMN ipk NUMERIC(10, 2);
-- Function untuk menghitung IPK
CREATE OR REPLACE FUNCTION hitung_ipk()
RETURNS TRIGGER AS $$
DECLARE
    total_bobot DECIMAL := 0;
    total_sks INT := 0;
BEGIN
    -- Menghitung total bobot dan total SKS
    SELECT 
        SUM(CASE 
            WHEN n.nilai >= 79.5 THEN 4.0 * mk.jumlah_sks
            WHEN n.nilai >= 72 AND n.nilai < 79.5 THEN 3.5 * mk.jumlah_sks
            WHEN n.nilai >= 64.5 AND n.nilai < 72 THEN 3.0 * mk.jumlah_sks
            WHEN n.nilai >= 57 AND n.nilai < 64.5 THEN 2.5 * mk.jumlah_sks
            WHEN n.nilai >= 49.5 AND n.nilai < 57 THEN 2.0 * mk.jumlah_sks
            WHEN n.nilai >= 34 AND n.nilai < 49.5 THEN 1.0 * mk.jumlah_sks
            WHEN n.nilai >= 0 AND n.nilai < 34 THEN 0.0 * mk.jumlah_sks
            ELSE 0.0
        END),
        SUM(mk.jumlah_sks)
    INTO 
        total_bobot, total_sks
    FROM 
        nilai n
    JOIN 
        matakuliah mk ON n.id_matakuliah = mk.id_matakuliah
    WHERE 
        n.NIM = NEW.NIM;

    -- Menghindari pembagian dengan nol dan memperbarui IPK
    IF total_sks = 0 THEN
        UPDATE mahasiswa SET ipk = 0 WHERE NIM = NEW.NIM;
    ELSE
        UPDATE mahasiswa SET ipk = total_bobot / total_sks WHERE NIM = NEW.NIM;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Trigger untuk tabel nilai
CREATE TRIGGER trigger_hitung_ipk
AFTER INSERT OR UPDATE OR DELETE
ON nilai
FOR EACH ROW
EXECUTE FUNCTION hitung_ipk();

-- Uji
-- Perbarui nilai nim 11323010
UPDATE nilai SET nilai = 90 WHERE nim = '11323010';
-- Cek tabel mahasiswa
select * from mahasiswa where nim = '11323010';

-- 2.Menampilkan data mahasiswa berdasarkan kriteria tertentu.
--Menampilkan mahasiswa yang hanya berjenis kelamin laki-laki
CREATE VIEW view_mahasiswa_laki_laki AS
SELECT NIM, nama_mhs, prodi, kelas, email_mhs
FROM mahasiswa WHERE jenis_kelamin = 'L';
SELECT * FROM view_mahasiswa_laki_laki;

--Menampilkan mahasiswa yang hanya berjenis kelamin perempuan
CREATE VIEW view_mahasiswa_perempuan AS
SELECT NIM, nama_mhs, prodi, kelas, email_mhs
FROM mahasiswa WHERE jenis_kelamin = 'P';
SELECT * FROM view_mahasiswa_perempuan;

--Menampilkan nilai mahasiswa berdasarkan kelas -- 
CREATE VIEW view_nilai_mahasiswa_per_kelas AS
SELECT a.kelas, a.NIM, a.nama_mhs, mk.nama_matakuliah, n.nilai
FROM mahasiswa a JOIN nilai n ON a.NIM = n.NIM
JOIN  matakuliah mk ON n.id_matakuliah = mk.id_matakuliah
ORDER BY a.kelas, a.NIM;
SELECT * FROM view_nilai_mahasiswa_per_kelas;

--Menampilkan data mahasiswa berdasarkan IPK Tertinggi -- 
CREATE VIEW view_mahasiswa_ipk_tertinggi AS
SELECT NIM, nama_mhs, prodi, jenis_kelamin, kelas, email_mhs, ipk
FROM mahasiswa WHERE ipk = '4';
SELECT * FROM view_mahasiswa_ipk_tertinggi;