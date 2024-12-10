--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: hitung_ipk(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hitung_ipk() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.hitung_ipk() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mahasiswa (
    nim character varying(10) NOT NULL,
    nama_mhs character varying(100),
    prodi character varying(50),
    jenis_kelamin character(1),
    email_mhs character varying(100),
    kelas character varying(10),
    ipk numeric,
    CONSTRAINT mahasiswa_jenis_kelamin_check CHECK ((jenis_kelamin = ANY (ARRAY['L'::bpchar, 'P'::bpchar])))
);


ALTER TABLE public.mahasiswa OWNER TO postgres;

--
-- Name: matakuliah; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matakuliah (
    id_matakuliah character varying(10) NOT NULL,
    nama_matakuliah character varying(100),
    jumlah_sks integer,
    dosen character varying(100),
    CONSTRAINT matakuliah_jumlah_sks_check CHECK ((jumlah_sks > 0))
);


ALTER TABLE public.matakuliah OWNER TO postgres;

--
-- Name: nilai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nilai (
    nilai integer,
    nim character varying(10),
    id_matakuliah character varying(10),
    CONSTRAINT nilai_nilai_check CHECK (((nilai >= 0) AND (nilai <= 100)))
);


ALTER TABLE public.nilai OWNER TO postgres;

--
-- Name: view_mahasiswa_ipk_tertinggi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_mahasiswa_ipk_tertinggi AS
 SELECT nim,
    nama_mhs,
    prodi,
    jenis_kelamin AS kelas,
    email_mhs,
    ipk
   FROM public.mahasiswa
  WHERE (ipk = '4'::numeric);


ALTER VIEW public.view_mahasiswa_ipk_tertinggi OWNER TO postgres;

--
-- Name: view_mahasiswa_laki_laki; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_mahasiswa_laki_laki AS
 SELECT nim,
    nama_mhs,
    prodi,
    kelas,
    email_mhs
   FROM public.mahasiswa
  WHERE (jenis_kelamin = 'L'::bpchar);


ALTER VIEW public.view_mahasiswa_laki_laki OWNER TO postgres;

--
-- Name: view_mahasiswa_perempuan; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.view_mahasiswa_perempuan AS
 SELECT nim,
    nama_mhs,
    prodi,
    kelas,
    email_mhs
   FROM public.mahasiswa
  WHERE (jenis_kelamin = 'P'::bpchar);


ALTER VIEW public.view_mahasiswa_perempuan OWNER TO postgres;

--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mahasiswa (nim, nama_mhs, prodi, jenis_kelamin, email_mhs, kelas, ipk) FROM stdin;
11323011	Ferry Siagian	Teknologi Informasi	L	ferry@itdel.ac.id	32TI1	\N
11323047	Agnes Sidabutar	Teknologi Informasi	P	agnes@itdel.ac.id	32TI2	\N
11323005	Abeloisa Pardosi	Teknologi Informasi	P	abeloisa@itdel.ac.id	32TI1	\N
12S13005	Mabeloisa Manurung	Sistem Informasi	L	mabeloisa@itdel.ac.id	32SI1	\N
14S23001	Aan Kiki Siahaan	Teknik Elektro	L	aankiki@itdel.ac.id	32TE1	\N
11423040	Noel Terompet Sitinjak	Teknologi Rekayasa Perangkat Lunak	L	terompet@itdel.ac.id	42TRPL1	\N
11S23019	Hanni Barus	Informatika	P	hanni@itdel.ac.id	32IF1	\N
21S23030	Ryka Simbolon	Manajemen Rekayasa	P	ryka@itdel.ac.id	32MR2	\N
13323045	Ripi Gramaldy Hugo	Teknologi Komputer	L	disinihugo@itdel.ac.id	32TK2	\N
12S13006	Monica Ginting	Sistem Informasi	P	monica@itdel.ac.id	32SI1	\N
12S13060	Erick Sitohang	Sistem Informasi	L	erick@itdel.ac.id	32SI2	\N
14S23002	Robert Sinaga	Teknik Elektro	L	robert@itdel.ac.id	32TE1	\N
14S23050	Yohana Samosir	Teknik Elektro	P	yohana@itdel.ac.id	32TE2	\N
11423041	Julius Hutabarat	Teknologi Rekayasa Perangkat Lunak	L	julius@itdel.ac.id	42TRPL1	\N
11423042	Merry Marpaung	Teknologi Rekayasa Perangkat Lunak	P	merry@itdel.ac.id	42TRPL2	\N
11S23020	Joshua Sitanggang	Informatika	L	joshua@itdel.ac.id	32IF1	\N
11S23021	Clara Nababan	Informatika	P	clara@itdel.ac.id	32IF2	\N
21S23031	Samuel Siahaan	Manajemen Rekayasa	L	samuel@itdel.ac.id	32MR1	\N
21S23032	Gabriela Simarmata	Manajemen Rekayasa	P	gabriela@itdel.ac.id	32MR2	\N
13323046	Budi Pardede	Teknologi Komputer	L	budi@itdel.ac.id	32TK2	\N
13323041	Siska Manurung	Teknologi Komputer	P	siska@itdel.ac.id	32TK1	\N
11323010	Franklyn Lumbantoruan	Teknologi Informasi	L	franklyn@itdel.ac.id	32TI1	4.0000000000000000
\.


--
-- Data for Name: matakuliah; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matakuliah (id_matakuliah, nama_matakuliah, jumlah_sks, dosen) FROM stdin;
MK001	Basis Data	3	Dr. Chintya
MK002	Dasar Pemrograman	3	Dr. Rudy Manurung
MK003	Matematika Diskrit	3	Dr. Pusi Simarmata
MK004	Jaringan Komputer	3	Dr. Siringo-ringo
MK005	Sistem Operasi	2	Dr. Janri Simbolon
MK006	Algoritma dan Pemrograman	3	Dr. Indra Lumbantoruan
MK007	Kecerdasan Buatan	2	Dr. Manalu
\.


--
-- Data for Name: nilai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nilai (nilai, nim, id_matakuliah) FROM stdin;
78	11323011	MK001
82	11323011	MK003
88	11323047	MK002
76	11323005	MK003
89	12S13005	MK003
75	12S13006	MK004
88	12S13060	MK006
80	14S23001	MK004
78	14S23002	MK006
85	14S23050	MK007
93	11423040	MK006
90	11423041	MK005
88	11423042	MK004
95	11S23019	MK007
89	11S23020	MK001
84	11S23021	MK002
77	21S23030	MK003
88	21S23031	MK004
92	21S23032	MK005
81	13323045	MK001
87	13323046	MK002
79	13323041	MK003
90	11323010	MK001
90	11323010	MK002
\.


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (nim);


--
-- Name: matakuliah matakuliah_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matakuliah
    ADD CONSTRAINT matakuliah_pkey PRIMARY KEY (id_matakuliah);


--
-- Name: nilai trigger_hitung_ipk; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_hitung_ipk AFTER INSERT OR DELETE OR UPDATE ON public.nilai FOR EACH ROW EXECUTE FUNCTION public.hitung_ipk();


--
-- Name: nilai nilai_id_matakuliah_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_matakuliah_fkey FOREIGN KEY (id_matakuliah) REFERENCES public.matakuliah(id_matakuliah) ON DELETE CASCADE;


--
-- Name: nilai nilai_nim_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_nim_fkey FOREIGN KEY (nim) REFERENCES public.mahasiswa(nim) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

