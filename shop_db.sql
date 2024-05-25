-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jan 2024 pada 06.50
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `name`, `price`, `quantity`, `image`) VALUES
(79, 18, 'Algoritma dan Pemrograman C++', 200000, 1, 'buku1.jpg'),
(80, 18, '7 in 1 Pemrograman Web Pemula', 79000, 1, 'buku3.jpg'),
(81, 18, 'Ngenest 3 : Ngetawain Hidup Ala Ernest', 70000, 1, 'buku12.jpg'),
(82, 18, 'Pemrograman Berorientasi Objek', 70000, 1, 'buku6.jpg'),
(83, 18, 'Sebuah Seni untuk Bersikap Bodo Amat', 95000, 3, 'buku9.png'),
(84, 18, 'R : Raja Ratu & Rahasia', 85000, 1, 'buku11.jpg'),
(119, 16, '7 in 1 Pemrograman Web Pemula', 79000, 1, 'buku3.jpg'),
(120, 16, 'Ngenest 3 : Ngetawain Hidup Ala Ernest', 70000, 1, 'buku12.jpg'),
(121, 16, 'Marmut Merah Jambu', 70000, 1, 'buku10.jpg'),
(124, 21, 'Algoritma dan Pemrograman C++', 200000, 1, 'buku1.jpg'),
(125, 21, '7 in 1 Pemrograman Web Pemula', 79000, 1, 'buku3.jpg'),
(126, 21, 'Matematika Diskrit Revisi Ketujuh', 110000, 1, 'buku4.jpg'),
(150, 3, 'Matematika Diskrit Revisi Ketujuh', 110000, 1, 'buku4.jpg'),
(151, 3, '7 in 1 Pemrograman Web Pemula', 79000, 100, 'buku3.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
--

CREATE TABLE `message` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(10, 1, 'made', 'made@gmail.com', '9999', 'halo, semoga nilai pwl di kelompok kita dapet A semua.'),
(13, 16, 'ayla', 'ayla@gmail.com', '081288997676', 'ini pesan, ini kritik!'),
(14, 23, 'Sissy', 'azzahirahsyifa1@gmail.com', '081299416815', 'Semoga toko buku ini semakin maju serta hubungan Syifa dan Hyun Joong pun semakin langgeng kedepannya :D'),
(15, 23, 'Baek Seong Jo', 'baekseongjo@gmail.com', '822123456789', 'Tolong diperbanyak lagi buku matematikanya ya kak!'),
(16, 23, 'jiwoniii', 'geewonii@gmail.com', '829988776655', 'Perbanyak buku humor yeahhh :)'),
(18, 3, 'abclimadasar', 'abclimadasar@gmail.com', '082123456789', 'toko bukunya bagus'),
(19, 3, 'jamal', 'jamal@gmail.com', '081312345678', 'tes kritik'),
(20, 22, 'juankim', 'juankim@gmail.com', '08111234578', 'mantapp'),
(21, 22, 'mejikuhibiniu', 'mejikuhibiniu@gmail.com', '085212345678', 'semoga makin berkembang'),
(22, 22, 'User 10', 'user10@gmail.com', '082287654321', 'kerenn'),
(23, 23, 'Syifa', 'azzahirahsyifa1@gmail.com', '0812', 'Kritik saran...');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(12, 16, 'noel', '081099773366', 'ada@gmail.com', 'paypal', 'flat no. 8, Jl. Mawar, Bandung, Indonesia - 40111', ', R : Raja Ratu & Rahasia (1) , Statistika & Probabilitas (1) , Basis Data (1) , Marmut Merah Jambu (1) , Algoritma dan Pemrograman C++ (1) , Dasar-dasar Metode Numerik (1) ', 575000, '05-Jan-2024', 'Completed'),
(13, 3, 'pp', '99', 'plo@gmail.com', 'credit card', 'flat no. 9, n, n, u - 9', ', 7 in 1 Pemrograman Web Pemula (1) , Matematika Diskrit Revisi Ketujuh (1) , Algoritma dan Pemrograman C++ (1) , Dasar-dasar Metode Numerik (1) , Pemrograman Berorientasi Objek (1) , Ngenest 3 : Ngetawain Hidup Ala Ernest (1) , Statistika & Probabilitas (1) , Organisasi dan Arsitektur Komputer (1) ', 779000, '05-Jan-2024', 'Pending'),
(14, 3, 'iiii', '998', 'ii@gmail.com', 'credit card', 'flat no. 8, n, h, h - 3', ', Algoritma dan Pemrograman C++ (1) , 7 in 1 Pemrograman Web Pemula (1) ', 279000, '05-Jan-2024', 'completed'),
(15, 3, 'uuuu', '887', 'uu@gmail.com', 'credit card', 'flat no. 8, hhh, h, hhh - 7', ', Algoritma dan Pemrograman C++ (1) , Sebuah Seni untuk Bersikap Bodo Amat (2) ', 390000, '05-Jan-2024', 'completed'),
(16, 3, 'ea', '8', 'ea@gmail.com', 'credit card', 'flat no. 87, hh, hu, uh - 76', ', Dasar-dasar Metode Numerik (1) , 7 in 1 Pemrograman Web Pemula (1) ', 129000, '05-Jan-2024', 'Completed'),
(17, 3, 'jj', '99', 'jj@gmail.com', 'credit card', 'flat no. 8, hb, bbv, v - 8', ', Sebuah Seni untuk Bersikap Bodo Amat (1) ', 95000, '05-Jan-2024', 'Completed'),
(18, 23, 'Syifa Azzahirah', '081299416815', 'azzahirahsyifa1@gmail.com', 'paypal', 'flat no. 0217864373, Jl. KH. M. Usman No. 10 F RT 005/002 Kukusan, Beji, Depok, Indonesia - 16425', ', Sebuah Seni untuk Bersikap Bodo Amat (1) , R : Raja Ratu & Rahasia (1) ', 180000, '07-Jan-2024', 'Completed'),
(19, 23, 'Kim Hyun Joong', '821223344556', 'hyunjoong@gmail.com', 'credit card', 'flat no. 82727112233, 123, Gangnam-daero, Seocho-gu, Anyang-si, South Korea - 06543', ', Matematika Diskrit Revisi Ketujuh (1) , Dasar-dasar Metode Numerik (1) ', 160000, '07-Jan-2024', 'Completed'),
(20, 23, 'Kim Ji Won', '829988776655', 'geewonii@gmail.com', 'paypal', 'flat no. 8276543210, 456, Insadong-gil, Jongno-gu, Seoul, South Korea - 03042', ', Marmut Merah Jambu (1) , Ngenest 3 : Ngetawain Hidup Ala Ernest (1) ', 140000, '07-Jan-2024', 'Completed'),
(21, 23, 'Baek Seong Jo', '822123456789', 'baekseongjo@gmail.com', 'paypal', 'flat no. 8220304050, 789, Myeongdong-ro, Jung-gu, Seoul, South Korea - 04551', ', Basis Data (1) , Statistika & Probabilitas (1) , Dasar-dasar Metode Numerik (1) ', 220000, '07-Jan-2024', 'Completed'),
(22, 3, 'user1', '888', 'user1@gmail.com', 'credit card', 'flat no. 8, hh, hjh, jhj - 8', ', Algoritma dan Pemrograman C++ (1) , Matematika Diskrit Revisi Ketujuh (1) , Organisasi dan Arsitektur Komputer (1) ', 440000, '08-Jan-2024', 'pending'),
(23, 3, 'user1', '00', 'user1@gmail.com', 'Transfer Bank', 'flat no. 8, hjh, jh, hj - 8', ', 7 in 1 Pemrograman Web Pemula (1) , Algoritma dan Pemrograman C++ (1) ', 279000, '08-Jan-2024', 'Completed'),
(24, 3, 'user1', '88', 'user1@gmail.com', 'COD', 'flat no. 8, uhj, hjb, hugyv - 7', ', Sebuah Seni untuk Bersikap Bodo Amat (1) , Organisasi dan Arsitektur Komputer (1) ', 225000, '08-Jan-2024', 'pending'),
(25, 14, 'user2', '8989', 'user2@gmail.com', 'Transfer Bank', 'flat no. 8, ghgh, ghg, u - 77', ', Marmut Merah Jambu (1) , Basis Data (1) , R : Raja Ratu & Rahasia (1) , Algoritma dan Pemrograman C++ (1) , Statistika & Probabilitas (1) , 7 in 1 Pemrograman Web Pemula (1) , Hujan (1) ', 684000, '10-Jan-2024', 'Completed'),
(26, 3, 'user1', '888', 'user1@gmail.com', 'Transfer Bank', 'flat no. 7, bjjb, hh, uyu - 7', ', 7 in 1 Pemrograman Web Pemula (2) , Matematika Diskrit Revisi Ketujuh (1) , Algoritma dan Pemrograman C++ (1) ', 468000, '10-Jan-2024', 'Completed'),
(27, 3, 'user1', '898', 'user1@gmail.com', 'Transfer Bank', 'flat no. 909, hjh, hjh, hh - 9', ', Marmut Merah Jambu (1) , Pemrograman Berorientasi Objek (1) , Basis Data (1) , Algoritma dan Pemrograman C++ (1) , Ngenest 3 : Ngetawain Hidup Ala Ernest (1) ', 515000, '14-Jan-2024', 'Completed'),
(28, 23, 'Syifa Azzahirah', '0812', 'azzahirahsyifa1@gmail.com', 'Transfer Bank', 'flat no. 8, Depok, Depok, Indo - 10890', ', 7 in 1 Pemrograman Web Pemula (1) , Matematika Diskrit Revisi Ketujuh (1) , Pemrograman Berorientasi Objek (1) ', 259000, '19-Jan-2024', 'Completed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `nama_penulis` varchar(100) NOT NULL,
  `nama_penerbit` varchar(100) NOT NULL,
  `bahasa_buku` varchar(100) NOT NULL,
  `deskripsi_buku` varchar(6000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `nama_penulis`, `nama_penerbit`, `bahasa_buku`, `deskripsi_buku`) VALUES
(2, 'Algoritma dan Pemrograman C++', 200000, 'buku1.jpg', 'Rinaldi Munir', 'Informatika', 'Bahasa Indonesia', 'Algoritma adalah sekumpulan instruksi yang terstruktur dan terbatas yang diimplementasikan kedalam bentuk program komputer untuk menyelesaikan suatu masalah komputasi tertentu. Dalam matematika dan ilmu komputer, algoritme adalah prosedur langkah-demi-langkah untuk penghitungan. Algoritme digunakan untuk penghitungan, pemrosesan data, dan penalaran otomatis.\r\n\r\n<br><br>\r\n\r\nAlgoritme adalah metode efektif diekspresikan sebagai rangkaian terbatas dari instruksi-instruksi yang telah didefinisikan dengan baik untuk menghitung sebuah fungsi. Dimulai dari sebuah kondisi awal dan input awal (mungkin kosong), instruksi-instruksi tersebut menjelaskan sebuah komputasi yang, bila dieksekusi, diproses lewat sejumlah urutan kondisi terbatas yang terdefinisi dengan baik, yang pada akhirnya menghasilkan \"keluaran\" dan berhenti di kondisi akhir. Transisi dari satu kondisi ke kondisi selanjutnya tidak harus deterministik; beberapa algoritme, dikenal dengan algoritme pengacakan, menggunakan masukan acak.\r\n\r\n<br><br>\r\n\r\nWalaupun algorism-nya al-Khawarizmi dirujuk sebagai aturan-aturan melakukan aritmetika menggunakan bilangan Hindu-Arab dan solusi sistematis dan persamaan kuadrat, sebagian formalisasi yang nantinya menjadi algoritme modern dimulai dengan usaha untuk memecahkan permasalahan keputusan (Entscheidungsproblem) yang diajukan oleh David Hilbert pada tahun 1928. Formalisasi selanjutnya dilihat sebagai usaha untuk menentukan \"penghitungan efektif\" atau \"metode efektif\"; formalisasi tersebut mengikutkan Godel-Herbrand-Kleene fungsi rekursif-nya Kurt Godel - Jacques Herbrand - Stephen Cole Kleene pada tahun 1930, 1934, dan 1935, kalkulus lambda-nya Alonzo Church pada tahun 1936, \"Formulasi 1\"-nya Emil Post pada tahun 1936, dan Mesin Turing-nya Alan Turing pada tahun 1936-7 dan 1939. Dari definisi formal dari algoritme di atas, berkaitan dengan konsep intuituf, masih tetap ada masalah yang menantang. apa itu algoritma?\r\n\r\n<br><br>\r\n\r\nSinopsis <br>\r\nBuku Algoritma dan Pemrograman dalam Bahasa Pascal, C, dan C++ merupakan edisi baru dari buku sebelumnya, yaitu Algoritma dan Pemrograman dalam Bahasa Pascal dan C. Buku ini disusun bagi siapapun (siswa, mahasiswa, umum) yang ingin mempelajari bidang pemrograman.\r\n\r\nSetiap materi diperkaya dengan banyak contoh pemecahan masalah. Diharapkan buku ini dapat mengajarkan pembacanya menjadi seorang pemrogram yang dapat memprogram dengan kaidah yang benar.\r\n\r\n<br><br>\r\n\r\n- Tebal : 682 halaman <br>\r\n- Berat : 0,75 kg <br>\r\n- Format : Soft Cover <br>\r\n- Tanggal Terbit : 5 Feb 2016 <br>\r\n- Dimensi : 16 x 24 cm.'),
(4, '7 in 1 Pemrograman Web Pemula', 79000, 'buku3.jpg', 'Rohi Abdulloh', 'Elex Media Komputindo', 'Indonesia', 'Adanya sebuah website bukan tanpa manfaat. Banyak sekali manfaat web atau website bagi individu, perusahaan, sampai pemerintahan. Website bisa digunakan untuk menampilkan profil, memajang portofolio atau hasil karya, sehingga memberi kemudahan untuk proses belanja secara online. Di dalam sebuah website akan ada banyak halaman mulai dari blog, menu, halaman kontak, dan sebagainya yang bisa diakses secara langsung melalui halaman beranda.\r\n\r\n<br><br>\r\n\r\nMembuat sebuah website bukanlah hal mudah, Anda memerlukan kemahiran programming seperti PHP-MySQL, HTML, CSS, ataupun Javascript. Bagi Anda yang sama sekali tidak punya basic dunia programming, membuat website sama seperti kembali belajar dari dasar.\r\n\r\n<br><br>\r\n\r\nTeknologi pemrograman web berkembang begitu cepat. Bagi pemula, tentu akan sangat tertinggal jika tidak cepat mengejarnya. Buku ini membahas 7 materi utama dalam mempelajari pemrograman web. Ketujuh bahasan ini akan sangat membantu pemula yang ingin menjadi web programmer dalam waktu yang singkat. Pembahasan dimulai dari pengetahuan dasar tentang pemrograman web, dilanjutkan dengan pembahasan 7 materi pemrograman web satu per satu disertai dengan contoh skrip beserta hasilnya.\r\n\r\n<br><br>\r\n\r\nDisertai juga pembuatan aplikasi sederhana yang akan membantu pembaca menguasai pembuatan modul aplikasi. Untuk menunjang latihan pembaca, penulis juga menyertakan puluhan bonus skrip aplikatif. Pembahasan dalam buku mencakup: <br>\r\n\r\n- Dasar-dasar web programming <br>\r\n- HTML <br>\r\n- CSS <br>\r\n- MySQL <br>\r\n- PHP <br>\r\n- Javascript <br>\r\n- jQuery <br>\r\n- Bootstrap Keterampilan: Pemula, Menengah Kelompok: Pemrograman Jenis buku: Referensi, Tutorial. <br><br>\r\n\r\n- Jumlah halaman : 336 <br>\r\n- Tanggal terbit : 3 September 2018 <br>\r\n- ISBN : 9786020479439 <br>\r\n- Berat : 0.4 kg <br>\r\n- Lebar : 21 cm <br>\r\n- Panjang : 20.5 cm <br>\r\n- Format : Soft cover.'),
(5, 'Matematika Diskrit Revisi Ketujuh', 110000, 'buku4.jpg', 'Rinaldi Munir', 'Informatika', 'Bahasa Indonesia', 'Karena buku ini berkategori umum maka siapa saja dapat membacanya. Namun biasanya buku ini banyak dicari dan dibaca oleh kalangan remaja hingga orang dewasa yang memiliki keterkaitan terhadap ilmu matematika terkhususnya pada cabang ilmu matematika diskrit. <br><br>\r\n\r\nMatematika diskrit atau diskret adalah cabang matematika yang membahas segala sesuatu yang bersifat diskrit. Diskrit disini artinya tidak saling berhubungan (lawan dari kontinu). Objek yang dibahas dalam Matematika Diskrit - seperti bilangan bulat, graf, atau kalimat logika - tidak berubah secara kontinu, tetapi memiliki nilai yang tertentu dan terpisah. Beberapa hal yang dibahas dalam matematika ini adalah teori himpunan, teori kombinatorial, teori bilangan, permutasi, fungsi, rekursif, teori graf, dan lain-lain. Matematika diskrit merupakan mata kuliah utama dan dasar untuk bidang ilmu komputer atau informatika. <br><br>\r\n\r\nSinopsis <br>\r\nBuku Matematika Diskrit (Revisi Ketujuh) disusun sebagai buku teks mahasiswa yang mengambil mata kuliah Matematika Diskrit. Matematika Diskrit merupakan mata kuliah yang fundamental dalam pendidikan ilmu komputer atau Teknik Informatika, Bahkan, saat ini Matematika Diskrit merupakan mata kuliah wajib pada program pendidikan yang termasuk ke dalam kelompok teknologi informasi. <br><br>\r\n\r\n- Tebal : 548 halaman <br>\r\n- Berat : 0.565 kg <br>\r\n- Format : Soft Cover <br>\r\n- Tanggal Terbit : 11 Des 2020 <br>\r\n- Dimensi : 15.8 x 24 cm <br>\r\n- ISBN : 9786237131373.'),
(6, 'Dasar-dasar Metode Numerik', 50000, 'buku5.jpg', 'Drs. Alit Bondan, M. Kom.', 'Pena Nusantara', 'Bahasa Indonesia', 'Dasar-dasar Metode Numerik. <br><br>\r\n\r\n- Jumlah Halaman : 158 halaman <br>\r\n- Tanggal Terbit : 10 Apr 2014 <br>\r\n- ISBN : SCOOPG38208.'),
(13, 'Pemrograman Berorientasi Objek', 70000, 'buku6.jpg', 'Adam Mukharil Bachtiar & Firman Nizammudin Fakhrul', 'Informatika', 'Bahasa Indonesia', 'Java merupakan salah satu bahasa pemrograman yang paling populer saat ini. Java sendiri dipelopori oleh James Gosling yang merupakan engineer di Sun Microsystem. Java mulai dibangun pada tahun 1991 dan dirilis pada tahun 1995, yaitu 4 tahun setelah project Java diinisiasi. Per Januari 2018, Java sudah mencapai versi Java SE9. <br><br>\r\n\r\nBuku “Pemrograman Berorientasi Objek Menggunakan Java” ini ditujukan untuk pengembang perangkat lunak pemula, mahasiswa, dosen, atau siapapun yang ingin mempelajari tentang pemrograman yang berorientasi objek dengan menggunakan Java.\r\nAdapun pembahasan di dalam buku ini meliputi: <br>\r\n- Halo Java <br>\r\n- Struktur Kontrol, Method, dan Struktur Data Sederhana <br>\r\n- Pemrograman Berorientasi Objek <br>\r\n- Implementasi Pemrograman Berorientasi Objek <br>\r\n- Generic Programming dan Collection <br>\r\n- Relasi Pada Diagram Kelas dan juga Penerapannya <br>\r\n- Exception dan Error Handling <br>\r\n- Concurrent Programming <br>\r\n- Ekspresi Lambda <br>\r\n- Membuat Program yang GUI dengan Menggunakan JAVAFX <br><br>\r\n\r\nTidak hanya itu saja, dalam buku ini juga telah dilengkapi dengan deret contoh-contoh kasus yang menarik dan juga pengimplementasian kelas diagram menjadi baris kode, ini bertujuan agar para pembaca menjadi lebih mudah dalam memahami materi yang telah disampaikan di dalam buku ini. <br><br>\r\n\r\n- ISBN: 9786026232694 <br>\r\n- Jumlah Halaman: 262 halaman <br>\r\n- Berat: 0,380 kg <br>\r\n- Lebar: 16 cm <br>\r\n- Panjang: 24 cm <br>\r\n- Tanggal Terbit : 8 Agt 2018.'),
(14, 'Organisasi dan Arsitektur Komputer', 130000, 'buku7.jpg', 'Maman Abdurohman', 'Informatika', 'Bahasa Indonesia', 'Arsitektur komputer adalah konsep perencanaan dan struktur pengoperasian dasar dari suatu sistem komputer. Biasanya mempelajari atribut-atribut sistem komputer yang terkait dengan eksekusi logis sebuah program. <br><br>\r\n\r\nOrganisasi komputer adalah bagian yang terkait dengan unit. Unit operasional dan interkoneksi antar komponen penyusun sistem komputer dalam merealisasikan aspek arsitekturnya. Biasanya mempelajari bagian yang terkait dengan unit-unit operasional komputer dan hubungan komponen-komponen komputer. <br><br>\r\n\r\nSinopsis <br>\r\nPada edisi keempat ini terdapat satu bab yang ditambahkan yaitu tentang \"Pengenalan : Organisasi dan Arsitektur Komputer\". Bab ini ditambahkan pada awal buku sebagai pengenalan, semacam warming up konsep organisasi dan arsitektur komputer. Dalam Bab I ini dibahas secara umum konsep arsitektur dan organisasi komputer serta cara pandang terhadap perangkat keras dan perangkat lunak sistem komputer. <br><br>\r\n\r\nDisamping penambahan Bab I, terdapat revisi pada bab-bab lain untuk memperdalam konsep yang telah dibahas sebelumnya. Pada Bab 2 dilakukan perluasan pembahasan tentang tren teknologi. Pada Bab 3 yang tadinya hanya membahas representasi data teks, gambar, video dan suara secara umum, pada edisi ini ada pendalaman untuk keempat materi tersebut. Pada Bab 6, 7 dan 8 terdapat penambahan komponen-komponen yang dijelaskan pada bab komponen kombinasional, sekuensial dan komponen-komponen yang terdapat pada level register. Pada Bab 21 berkenaan dengan komputer kinerja tinggi, telah ditambahkan pembahasan tentang framework Hadoop. <br><br>\r\n\r\n- Format : Soft cover <br>\r\n- Jumlah halaman : 667 halaman <br>\r\n- Tanggal terbit : 22 Desember 2017 <br>\r\n- Panjang : 24 cm <br>\r\n- Lebar : 16 cm <br>\r\n- Berat : 0.67 kg <br>\r\n- ISBN : 9786026232403.'),
(16, 'Sebuah Seni untuk Bersikap Bodo Amat', 95000, 'buku9.png', 'Mark Manson', 'Gramedia Widiasarana Indonesia', 'Bahasa Indonesia', 'Selama beberapa tahun belakangan, Mark Manson—melalui blognya yang sangat populer—telah membantu mengoreksi harapan-harapan delusional kita, baik mengenai diri kita sendiri maupun dunia. Ia kini menuangkan buah pikirnya yang keren itu di dalam buku hebat ini. <br><br>\r\n\r\n“Dalam hidup ini, kita hanya punya kepedulian dalam jumlah yang terbatas. Makanya, Anda harus bijaksana dalam menentukan kepedulian Anda.” Manson menciptakan momen perbincangan yang serius dan mendalam, dibungkus dengan cerita-cerita yang menghibur dan “kekinian”, serta humor yang cadas. Buku ini merupakan tamparan di wajah yang menyegarkan untuk kita semua, supaya kita bisa mulai menjalani kehidupan yang lebih memuaskan, dan apa adanya.\" <br><br>\r\n\r\n- Jumlah Halaman : 256 Halaman <br>\r\n- Tanggal Terbit : 19 Mar 2009 <br>\r\n- Berat : 0.4 kg <br>\r\n- ISBN : 9786020528571 <br>\r\n- Lebar : 14 cm <br>\r\n- Panjang : 21 cm.'),
(17, 'Marmut Merah Jambu', 70000, 'buku10.jpg', 'Raditya Dika', 'Bukune', 'Bahasa Indonesia', 'Raditya Dika merupakan seorang penulis, komedian, dan aktor yang berasal dari Indonesia. Ia terkenal sebagai penulis di internet (blog) dan buku-buku komedi. Sosok yang kerap disapa Radit ini menuliskan pengalaman kesehariannya, tulisan-tulisan yang dibuat berasal dari blog pribadinya yang kemudian diangkat menjadi sebuah buku. Salah satu bukunya adalah Marmut Merah Jambu.\r\nMarmut Merah Jambu adalah kumpulan tulisan komedi Raditya Dika. Sebagian besar dari tiga belas tulisan ngawur di dalamnya adalah pengalaman dan observasi Radit dalam menjalani hal paling absurd di dunia yaitu jatuh cinta. Dalam buku ini, penulis memang lebih fokus menceritakan tentang cinta yang tetap dicampur dengan ciri khasnya yaitu unsur komedi. Namun, tidak semata-mata kisah cinta saja, penulis juga tetap menyelipkan beberapa kisah keluarganya. Secara keseluruhan buku ini menarik, terutama penulis yang membagikan kisahnya tentang cinta diam-diam. Sosok Radit yang menggambarkan bagaimana seseorang mencintai seseorang tetapi takut untuk mengungkapkannya, karena hal tersebut pasti pernah dirasakan oleh hampir semua orang. <br><br>\r\n\r\nNovel ini memiliki penyampaian cerita yang dapat membuat pembaca tertawa dan terhibur dengan menggunakan istilah sehari-hari sehingga dapat memberikan kemudahan kepada para pembaca ketika mengikuti alur cerita yang dihadirkan. Penyampaian kisah cinta seorang Raditya Dika yang aslinya tragis menjadi “konyol” akan membuat pembaca tersenyum ketika sedang membaca novel ini. <br><br>\r\n\r\n- Halaman: 220 halaman <br>\r\n- Tanggal Terbit: 18 Juli 2017 <br>\r\n- Berat: 0.20 kg <br>\r\n- ISBN: 9786022202325 <br>\r\n- Dimensi: 20x13 cm.'),
(18, 'R : Raja Ratu & Rahasia', 85000, 'buku11.jpg', 'Wulanfadi', 'Best Media', 'Bahasa Indonesia', 'Kisahnya, Ratu tengah berduka karena kedua orang tuanya meninggal dunia. Dia juga merasakan kesepian karena sang kakak, Reon, sibuk dengan pekerjaannya. Suatu ketika, Ratu memutuskan bergabung dengan sebuah komplotan rahasia di sekolahnya. Dalam sebuah kegiatan ekstrakurikuler ilegal tersebut, Ratu menemukan kesenangan dan melupakan kesedihannya. <br><br>\r\n\r\n- Tanggal Terbit : 20 Nov 2017 <br>\r\n- Berat : 0.50 kg <br>\r\n- ISBN : 9786026940261 <br>\r\n- Panjang : 20cm.'),
(20, 'Statistika & Probabilitas', 70000, 'buku13.jpg', 'Prof. Ir. Leksmono Suryo Putranto, M.T., Ph.D., I.P.M.', 'Andi Offset', 'Bahasa Indonesia', 'Statistika & Probabilitas. <br><br>\r\n\r\n- Jumlah Halaman : 246 halaman <br>\r\n- Tanggal Terbit : 30 Sep 2022 <br>\r\n- Berat : 0.345 kg <br>\r\n- ISBN : 9786230129704 <br>\r\n- Lebar : 15.5 cm <br>\r\n- Panjang : 23 cm.'),
(21, 'Basis Data', 100000, 'buku8.jpg', 'Fathansyah', 'Informatika', 'Bahasa Indonesia', 'Buku ini merupakan revisi dalam rangka penyesuaian dengan situasi terkini, setelah sekian tahun lamanya rencana revisi itu tertunda. Revisi ini sekaligus juga berbentuk penggabungan dari 2 (dua) buku sebelumnya, yaitu Basis Data dan Sistem Basis Data. <br><br>\r\n\r\nBuku ini mencoba fokus pada ketiga hal, yaitu: basis data, model data dan bagaimana membuat model data yang baik. Dalam berbagai pembahasan, niscaya kita akan melihat perancangan basis data yang baik juga senantiasa mempertimbangkan prosedur (aturan-aturan) yang berlaku di dalam sistem. Karena itu, pembahasan tentang contoh-contoh aturan yang berlaku di lapangan yang terefleksikan dalam perancangan juga banyak mewarnai isi buku ini. Sejumlah aspek lain yang relevan, seperti DBMS, aplikasi basis data dan perkembangan teknologi terbaru, juga turut dibahas. <br><br>\r\n\r\nBuku ini memang lebih ditujukan untuk membantu para mahasiswa, apapun program studinya, yang tengah mempelajari mata kuliah Basis Data yang lebih menekankan pada aspek perancangan basis data. Karena itu, berbagai contoh yang disajikan dalam buku ini juga diambil dari fakta yang dekat dengan dunia kemahasiswaan. Kendati demikian, buku ini sesungguhnya juga terbuka dan bermanfaat bagi siapa saja yang memerlukan penguasaan pada aspek-aspek dasar ke-basis data-an. <br><br>\r\n\r\nBahasan Meliputi: Apa Itu Basis Data, Sistem Basis Data, Basis Data Relasional, Normalisasi Data, Model Data, Penerapan Basis Data, Denormalisasi Basis Data, Bahasa Query, Pemrosesan Query, Backup dan Recovery, Pengamanan Basis Data, Pengendalian Persaingan, Basis Data Terdistribusi, Transaksi Lanjutan, Aplikasi Basis Data, Bunga Rampai Basis Data, Komparasi DBMS, Basis Data dalam MySQL. <br><br>\r\n\r\n- Jumlah Halaman : 540 <br>\r\n- Tanggal Terbit : 2 Nov 2015 <br>\r\n- Berat : 0.6000 kg <br>\r\n- ISBN : 9786021514870 <br>\r\n- Lebar : 16 cm.'),
(23, 'Ngenest 3 : Ngetawain Hidup Ala Ernest', 75000, 'buku12.jpg', 'Ernest Prakasa', 'Niaga Swadaya', 'Bahasa Indonesia', 'Ngetawain Hidup Ala Ernest. <br><br>\r\n\r\n- Jumlah Halaman : 176 halaman <br>\r\n- Tanggal Terbit : 9 Jun 2015 <br>\r\n- Berat : 0.1870 kg <br>\r\n- ISBN : 9786027114081 <br>\r\n- Lebar : 14 cm.'),
(24, 'Tentang Kamu', 80000, 'buku14.jpg', 'Tere Liye', 'PENERBIT SABAK GRIP', 'Bahasa Indonesia', 'Novel yang berjudul Tentang Kamu ini merupakan karya dari Tere Liye dan dapat dinikmati oleh pembaca baik dari kalangan remaja maupun orang dewasa. <br><br>\r\n\r\nBukan persoalan cinta, novel Tentang Kamu lebih tepatnya digolongkan sebagai novel misteri ataupun seperti detektif. Akan tetapi, selayaknya berbagai karya tulis novel Tere Liye lainnya, novel ini erat dengan berbagai nilai, seperti makna sebuah perjuangan, persahabatan, dan kekeluargaan. <br><br>\r\n\r\nCerita dalam novel ini diawali dengan sebuah logika yang bisa dikatakan cukup simpel dan sederhana untuk diikuti oleh sebagian pembacanya. Namun, kisah tersebut beranak-pinak menjadi kisah yang rumit dan terkesan tidak realistis saat menjelang bagian akhir–yang mana muncul seorang tokoh antagonis. <br><br>\r\n\r\nSinopsis <br>\r\nTerima kasih untuk kesempatan mengenalmu, itu adalah salah satu anugerah terbesar hidupku. Cinta memang tidak perlu ditemukan, cintalah yang akan menemukan kita. \r\n\r\nTerima kasih. Nasihat lama itu benar sekali, aku tidak akan menangis karena sesuatu telah berakhir, tapi aku akan tersenyum karena sesuatu itu pernah terjadi.\r\n\r\nMasa lalu. Rasa sakit. Masa depan. Mimpi-mimpi. Semua akan berlalu, seperti sungai yang mengalir. Maka biarlah hidupku mengalir seperti sungai kehidupan. <br><br>\r\n\r\n- Tebal : 503 halaman <br>\r\n- Berat : 0.41 kg <br>\r\n- Format : Soft Cover <br>\r\n- Tanggal Terbit : 4 Feb 2021 <br>\r\n- Dimensi : 20.5 x 13.5 cm <br>\r\n- ISBN : 9786239554569.'),
(25, 'Rembulan Tenggelam Di Wajahmu', 75000, 'buku15.jpg', 'Tere Liye', 'PENERBIT SABAK GRIP', 'Bahasa Indonesia', 'Tutup mata kita. Tutup pikiran kita dari carut marut kehidupan. Mari berpikir takzim sejenak. Bayangkan saat ini ada satu malaikat bersayap indah datang kepada kita, lantas lembut berkata: \"Aku memberikan kau kesempatan hebat. Lima kesempatan untuk bertanya tentang rahasia kehidupan, dan aku akan menjawabnya langsung sekarang. Lima pertanyaan. Lima jawaban. Apakah pertanyaan pertamamu?\"\r\n\r\nMaka apakah kita akan bertanya: Apakah cinta itu? Apakah hidup ini adil? Apakah kaya adalah segalanya? Apakah kita memiliki pilihan dalam hidup? Apakah makna kehilangan? Ray, tokoh utama dalam kisah ini, ternyata memiliki kecamuk pertanyaan sendiri. Lima pertanyaan sebelum akhirnya dia mengerti makna hidup dan kehidupannya. <br><br>\r\n\r\nSiapkan energi Anda untuk memasuki dunia \'fantasi\' tere-liye tentang perjalanan hidup. Di sini hanya ada satu rumus: semua urusan adalah sederhana. Mala mulailah membaca dengan menghela nafas lega.\r\n\r\nNovel Rembulan Tenggelam Di Wajahmu menceritakan tentang perjalanan hidup seorang pria yang bernama Rehan Raujana atau yang biasa dipanggil Ray. Pria itu berumur enam puluh tahun. Dia adalah seorang Pria pemilik kongsi bisnis terbesar yang pernah ada. Pria pemilik imperium terbesar yang menggurita. Yang sayangnya, sedang sekarat. <br><br>\r\n\r\nAwal kisah ini bermula di sebuah panti asuhan yang berada di sebuah kota kecil. Tempat Ray dibesarkan hingga remaja. Tempat dimana awal penyiksaan dan penderitaan yang Ray rasakan. Tempat dimana Ray menjadi seorang pemberontak dan pembangkang. Tempat bermulanya pertanyaan pertama Ray. Tapi meskipun Ray adalah anak yang nakal sebenarnya ia adalah anak yang baik selama ini. Selama berada di panti, Ray mempunyai pertanyaan besar “Apakah aku tidak memiliki kesempatan untuk memilih pada saat aku dilahirkan?” Dirinya suka sekali memandang rembulan, yang seakan mengerti akan kesedihannya. <br><br>\r\n\r\n- ISBN : 9786239607449 <br>\r\n- Ukuran : 13,5 x 20,5 cm <br>\r\n- Berat : 0,335 kg <br>\r\n- Jumlah Halaman : 436 <br>\r\n- Tanggal Terbit : 15 Apr 2021.'),
(26, 'Bumi', 92000, 'buku16.jpg', 'Tere Liye', 'SABAKGRIP', 'Bahasa Indonesia', '“Namaku Raib, usiaku 15 tahun, kelas sepuluh. Aku anak perempuan seperti kalian, adik-adik kalian, tetangga kalian. Aku punya dua kucing, namanya si Putih dan si Hitam. Mama dan papaku menyenangkan. Guru-guru di sekolahku seru. Teman-temanku baik dan kompak.” <br><br>\r\n\r\nSinopsis <br>\r\n\r\nTere Liye kembali mengkreasikan imajinasinya kedalam kedalam beberapa rangkaian novel.\r\n\r\nBumi, merupakan rangkaian awal dari kisah sekelompok anak remaja berkemampuan istimewa. Menceritakan tentang Raib, Ali, dan Seli yang bertualang ke dunia paralel. Mereka yang istimewa, mampu pergi ke dunia pararel bumi, bertemu dengan klan lain dan berhadapan dengan Tamus yang memiliki ambisi membebaskan si Tanpa Mahkota dan kemudian, menguasai bumi. <br><br>\r\n\r\nPerkenalkan, Raib, seorang gadis belia berusia lima belas tahun yang tidak biasa. Dia bisa menghilang. Jangan beritahu siapapun, Itu adalah rahasia terbesar yang tak pernah ia ceritakan pada siapapun, termasuk kedua orangtuanya. Kehidupannya tetap berjalan normal, meskipun untuk dirinya sendiri. Tidak jarang Raib menjahili orang tuanya dengan tiba-tiba menghilang, lalu muncul kembali secara tiba-tiba membuat kaget kedua orangtuanya. \r\n\r\nTidak hanya menyuguhkan cerita fantasi, novel ini juga memberikan pesan moral tentang keluarga, dan persahabatan. Tere Liye sukses membangun kisah persahabatan antara Raib, Ali, dan Seli terasa nyata. Hubungan antara Raib dan keluarganya membuat pembaca penasaran sekaligus tersadar akan cara berkomunikasi dengan orang tua. <br><br>\r\n\r\nTere Liye memberikan banyak kejutan di tiap halaman yang direpresentasikan oleh Raib, membuat pembaca dapat menikmati cerita yang seolah tidak akan ada habisnya. Tere Liye berhasil meracik buku ini sebagai bahan baca para pecinta novel sastra maupun fantasi. <br><br>\r\n\r\n- Lebar : 14 cm <br>\r\n- Tinggi : 21 cm <br>\r\n- Berat : 0,45 gr <br>\r\n- ISBN : 9786020000000 <br>\r\n- Sampul : Soft cover\r\n- Jumlah Halaman : 438 halaman <br>\r\n- Tanggal Terbit : 30 Agt 2022 <br>\r\n- Panjang : 20.0cm'),
(27, 'Hujan', 80000, 'buku17.jpg', 'Tere Liye', 'PENERBIT SABAK GRIP', 'Bahasa Indonesia', 'Novel Hujan merupakan novel yang mengisahkan kisah cinta serta perjuangan hidup Lail. Saat usianya baru menginjak 13 tahun, Lail menjadi seorang yatim piatu akibat ayah dan ibu Lail yang terkena letusan Gunung Api Purba dan gempa yang membuat kota tempat mereka tinggal hancur. \r\n\r\nLail yang pada saat itu juga termasuk korban bencana berhasil diselamatkan oleh anak laki-laki bernama Esok. Lail dan Esok akhirnya menjadi sepasang yang tak terpisahkan sampai akhirnya mereka harus berpisah karena tempat pengungsian yang mereka tinggali tutup. Lail akhirnya menetap di sebuah panti sosial dan Esok diangkat menjadi anak salah satu keluarga. <br><br>\r\n\r\nMereka menjalani kehidupannya masing-masing. Pertemuan mereka untuk melepas rindu dilakukan rutin sebulan sekali meski akhirnya jadwal pertemuan harus diubah akibat Esok yang harus meneruskan pendidikan di Ibu Kota. Pertemuan mereka berubah menjadi setiap Esok berlibur semester. Frekuensi pertemuan keduanya semakin jarang. \r\n\r\nSampai suatu ketika, ayah angkat Esok, wali kota, menemui Lail dan memohon agar Lail menolak tiket yang akan diberikan esok agar tiket tersebut dapat diberikan ke anaknya. Kesalahpahaman pun terjadi. Lail tak kunjung mendapatkan kabar dari Esok. Akhirnya, Lail memutuskan untuk masuk ke ruang modifikasi ingatan. Lail ingin semua memori dan beban yang ada di ingatannya menghilang. Lantas apa yang akan terjadi pada kisah Lail dan Esok? <br><br>\r\n\r\nSinopsis Buku <br>\r\n\r\nNovel HUJAN berkisah tentang persahabatan, tentang cinta, tentang perpisahan, tentang melupakan, dan tentang hujan. <br><br>\r\n\r\n- Cover : Soft Cover <br>\r\n- Tebal : 320 Halaman <br>\r\n- ISBN : 9786020324784 <br>\r\n- Berat : 0.4 kg <br>\r\n- Dimensi : 14.0 cm x 21.0 cm <br>\r\n- Tanggal Terbit : 5 Sep 2022'),
(28, 'Negeri Para Bedebah', 89000, 'buku18.jpg', 'Tere Liye', 'PENERBIT SABAK GRIP', 'Bahasa Indonesia', 'Tere liye dan karyanya selalu menjadi legenda. Sebagai salah satu penulis asli Indonesia yang paling rajin menduduki jajaran best seller, Tere Liye kembali menyajikan sebuah karya tulis dengan warna yang berbeda, Negeri Para Bedebah. Jika biasanya kita selalu melihat kisah-kisah romantis anak manusia, kali ini Tere Liye mengajak kita masuk ke dalam dunia baru yang jauh lebih luas melalui karyanya ini. dunia politik, ekonomi hingga hukum. Seperti biasa, tanpa tanggung-tanggung Tere Liye memberikan berbagai hasil penelusuran, pembelajaran dan ilmunya pada kita melalui setiap inci cerita untuk memberikan nuansa baru yang terasa amat nyata. <br><br>\r\n\r\nMelalui novel ini, mampu membukakan pintu baru bagi kita yang masih awam dengan dunia ekonomi politik. Kendati hanya sebatas kisah fiksi, namu alur ceritanya seolah menjadi refleksi kita di dunia nyata. Tidak heran apabila saat membacanya membuat kita bertanya-tanya apakah benar adanya? Apakah ‘lingkaran setan’ dalam dunia ekonomi politik memang se-’menakutkan’ itu? Apakah di negara ini ada kisah nyata seperti ini? <br><br>\r\n\r\nSinopsis <br>\r\nNegeri para bedebah, negerinya para musang berbulu domba, negerinya pencuri berdasi. Tempat dimana kehidupan terasa jauh lebih fiksi dari pada novel fiksi itu sendiri. Dimana realita terasa jauh lebih nyata. Sebab di negeri para bedebah segala hal bisa terjadi selama melibatkan materi dan kedudukan. Manusia bisa berubah menjadi musang paling manipulatif selama itu demi kekayaan. Namun di negeri para bedebah pula masih menyimpan kebaikan, kemanusiaan dan kesetiaan. \r\n\r\nBercerita tentang Thomas, seorang konsultan keuangan yang sangat terkenal. Keahliannya dalam bidangnya ini membuat dirinya bahkan sering diundang menjadi pembicara dalam berbagai kesempatan seperti talk show dan seminar hingga luar negeri. <br><br>\r\n\r\nThomas bisa dibilang merupakan salah satu figure paling berpengaruh dalam bidang perekonomian hingga mampu mendirikan firma konsultannya bernama Thomas & Co. Ketenaran Thomas membuat banyak orang ingin mengulik sisi dari dirinya yang amat misterius dan latar belakangnya yang gelap. Sampai suatu ketika pemilik Bank nasional yakni Bank Semesta sedang tersandung kasus akibat kelalaiannya dan perbuatannya yang dinilai melanggar undang-undang bisnis perbankan. Thomas berlandaskan rasa kekeluargaan membantu Bank Semesta agar tidak bangkrut. <br><br>\r\n\r\n- Jumlah Halaman : 433 halaman <br>\r\n- Tanggal Terbit : 9 Apr 2023 <br>\r\n- Berat : 0.355 kg <br>\r\n- ISBN : 9786238829620 <br>\r\n- Lebar : 13.5 cm <br>\r\n- Panjang : 20cm'),
(29, 'Pulang - Pergi', 80000, 'buku19.jpeg', 'Tere Liye', 'Sabak Grip Nusantara', 'Bahasa Indonesia', 'Buku novel Pulang - Pergi ini merupakan karya dari penulis terkenal, yaitu Tere Liye. Buku ini bercerita tentang Bujang yang kembali harus berpetualang setelah pergi dan pulang. Saat Bujang sedang berada di pusara mamak dan bapaknya, Bujang mendapatkan sebuah pesan dari Krestiny Otets, pemimpin brotherhood Bratva. \r\n\r\nIsi pesan tersebut adalah perintah untuk Bujang dalam dua hari kedepan untuk bertunangan dengan Maria, putri Otets. Jika Bujang tidak hadir dalam acara pertunangan tersebut, berarti Bujang telah membuat malu dan menyakiti hati Maria. Sebagai balasannya, jika Bujang mengingkari pertunangannya, pusara kedua orangtuanya akan Otets ratakan. <br><br>\r\n\r\nBujang yang tidak mau membuat masalah dengan Otets, pada akhirnya memilih untuk pergi dan terbang ke Rusia. Namun, Bujang tidak sendiri, ia ditemani oleh Salonga dan murid menembaknya, Junior. \r\n\r\nKehadiran Salonga diharapkan dapat menunda perjodohan antara Bujang dan Maria. Salonga siap untuk bernegosiasi dengan Otets agar dapat membantu Bujang menunda perjodohan atau bahkan membatalkannya. <br><br>\r\n\r\nSinopsis <br>\r\nAda jodoh yang ditemukan lewat tatapan pertama.\r\nAda persahabatan yang diawali lewat sapa hangat.\r\nBagaimana jika takdir bersama ternyata,\r\ndiawali dengan pertarungan mematikan?\r\nLantas semua cerita berkelindan dengan,\r\npengejaran demi pengejaran mencari jawaban?\r\nPulang-Pergi <br><br>\r\n\r\n- Tebal : 417 halaman <br>\r\n- Berat : 0,42 kg <br>\r\n- Format : Soft Cover <br>\r\n- Tanggal Terbit : 1 Jan 2021 <br>\r\n- Dimensi : 18 x 13 cm <br>\r\n- ISBN : 9786239554521'),
(47, 'Harry ', 100000, 'buku20.jpg', 'Jk Row', 'Gramedia', 'Inggris', 'Deskripsi...');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
(2, 'admin1', 'admin1@gmail.com', 'e00cf25ad42683b3df678c61f42c6bda', 'admin'),
(3, 'user1', 'user1@gmail.com', '24c9e15e52afc47c225b757e7bee1f9d', 'user'),
(5, 'admin2', 'admin2@gmail.com', 'c84258e9c39059a89ab77d846ddab909', 'admin'),
(6, 'admin3', 'admin3@gmail.com', '32cacb2f994f6b42183a1300d9a3e8d6', 'admin'),
(7, 'admin4', 'admin4@gmail.com', 'fc1ebc848e31e0a68e868432225e3c82', 'admin'),
(8, 'admin5', 'admin5@gmail.com', '26a91342190d515231d7238b0c5438e1', 'admin'),
(9, 'admin6', 'admin6@gmail.com', 'c6b853d6a7cc7ec49172937f68f446c8', 'admin'),
(10, 'admin7', 'admin7@gmail.com', '788073cefde4b240873e1f52f5371d7d', 'admin'),
(11, 'admin8', 'admin8@gmail.com', '8762eb814817cc8dcbb3fb5c5fcd52e0', 'admin'),
(12, 'admin9', 'admin9@gmail.com', 'eed57216df3731106517ccaf5da2122d', 'admin'),
(13, 'admin10', 'admin10@gmail.com', '4fbd41a36dac3cd79aa1041c9648ab89', 'admin'),
(14, 'user2', 'user2@gmail.com', '7e58d63b60197ceb55a1c487989a3720', 'user'),
(15, 'user3', 'user3@gmail.com', '92877af70a45fd6a2ed7fe81e1236b78', 'user'),
(16, 'user4', 'user4@gmail.com', '3f02ebe3d7929b091e3d8ccfde2f3bc6', 'user'),
(17, 'user5', 'user5@gmail.com', '0a791842f52a0acfbb3a783378c066b8', 'user'),
(18, 'user6', 'user6@gmail.com', 'affec3b64cf90492377a8114c86fc093', 'user'),
(19, 'user7', 'user7@gmail.com', '3e0469fb134991f8f75a2760e409c6ed', 'user'),
(20, 'user8', 'user8@gmail.com', '7668f673d5669995175ef91b5d171945', 'user'),
(21, 'user9', 'user9@gmail.com', '8808a13b854c2563da1a5f6cb2130868', 'user'),
(22, 'user10', 'user10@gmail.com', '990d67a9f94696b1abe2dccf06900322', 'user'),
(23, 'Syifa Azzahirah', 'azzahirahsyifa1@gmail.com', '1db7faed0921b4ab88da5e284ba45767', 'user'),
(24, 'Kim Hyun Joong', 'hyunjoong@gmail.com', 'c87ad9f4990585884977c8f7366635c9', 'admin'),
(25, 'user11', 'user11@gmail.com', '03aa1a0b0375b0461c1b8f35b234e67a', 'user'),
(27, 'admin13', 'admin13@gmail.com', '588e57b852a16b297af73ae818065474', 'admin'),
(29, 'admin15', 'admin15@gmail.com', 'b26c077af60ba02d12c8436110256029', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT untuk tabel `message`
--
ALTER TABLE `message`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
