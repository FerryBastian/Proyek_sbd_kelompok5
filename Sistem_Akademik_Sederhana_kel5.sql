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
	nilai INT CHECK (nilai >= 0 AND nilai <= 100),
	NIM VARCHAR(10),
	id_matakuliah VARCHAR(10),
	Foreign Key (NIM) references mahasiswa(NIM) ON DELETE CASCADE,
	foreign key (id_matakuliah) references matakuliah(id_matakuliah) ON DELETE CASCADE
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

SELECT * FROM mahasiswa;
SELECT * FROM matakuliah;
SELECT * FROM nilai;


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

