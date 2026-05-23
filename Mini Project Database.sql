CREATE DATABASE IF NOT EXISTS lms_miniproject;
USE lms_miniproject;

CREATE TABLE users (
id_user int AUTO_INCREMENT,
name varchar(100),
email varchar(100),
role enum('student', 'instructor') NOT NULL DEFAULT 'student',
PRIMARY KEY (id_user),
UNIQUE (email)
);

CREATE TABLE course_categories (
id_category int AUTO_INCREMENT,
code_category varchar(5) NOT NULL,
name_category varchar(20),
desc_course_cat text,
PRIMARY KEY (id_category),
UNIQUE (code_category)
);


CREATE TABLE courses (
id_course int AUTO_INCREMENT,
code_course varchar(10) NOT NULL,
code_category varchar(5) NOT NULL,
id_instructor int NOT NULL,
name_course varchar(100) NOT NULL,
desc_course text,
price decimal(10,2) NOT NULL DEFAULT 0.00,
quota int NOT NULL DEFAULT 0,
PRIMARY KEY (id_course),
FOREIGN KEY (code_category) REFERENCES course_categories(code_category) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_instructor) REFERENCES users(id_user)
ON DELETE CASCADE ON UPDATE CASCADE,
UNIQUE (code_course)
);


CREATE TABLE enrollments (
id_enrollment int AUTO_INCREMENT,
id_user int,
code_course varchar(10) NOT null,
date_register timestamp DEFAULT CURRENT_TIMESTAMP(),
PRIMARY KEY (id_enrollment),
FOREIGN KEY (id_user) REFERENCES users (id_user)
	ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (code_course) REFERENCES courses (code_course)
	ON DELETE CASCADE ON UPDATE CASCADE	
);

INSERT INTO users (name, email, role) VALUES
('Budi Santoso', 'budi.santoso@email.com', 'instructor'),
('Siti Aminah', 'siti.aminah@email.com', 'instructor'),
('Rian Hidayat', 'rian.hidayat@email.com', 'instructor'),
('Dewi Lestari', 'dewi.lestari@email.com', 'instructor'),
('Eko Prasetyo', 'eko.prasetyo@email.com', 'instructor'),
('Andi Wijaya', 'andi.wijaya@email.com', 'student'),
('Citra Kirana', 'citra.kirana@email.com', 'student'),
('Dimas Saputra', 'dimas.saputra@email.com', 'student'),
('Elena Putri', 'elena.putri@email.com', 'student'),
('Fahmi Idris', 'fahmi.idris@email.com', 'student'),
('Gita Gutawa', 'gita.gutawa@email.com', 'student'),
('Hendra Wijaya', 'hendra.wijaya@email.com', 'student'),
('Indah Permata', 'indah.permata@email.com', 'student'),
('Joko Widodo', 'joko.widodo@email.com', 'student'),
('Kevin Sanjaya', 'kevin.sanjaya@email.com', 'student');

INSERT INTO course_categories (code_category, name_category, desc_course_cat) VALUES
('WEB', 'Web Development', 'Belajar membuat website modern dari dasar hingga mahir.'),
('DATA', 'Data Science', 'Analisis data, visualisasi, dan machine learning.'),
('MOB', 'Mobile Development', 'Pengembangan aplikasi Android dan iOS.'),
('MKT', 'Digital Marketing', 'Strategi pemasaran digital, SEO, dan iklan berbayar.'),
('UIUX', 'UI/UX Design', 'Desain antarmuka dan pengalaman pengguna aplikasi.'),
('CYBER', 'Cyber Security', 'Keamanan jaringan, ethical hacking, dan pertahanan data.'),
('CLOUD', 'Cloud Computing', 'Pengelolaan infrastruktur cloud AWS, Azure, dan GCP.'),
('GAME', 'Game Development', 'Membuat game 2D dan 3D menggunakan Unity.'),
('PM', 'Project Management', 'Metodologi Agile, Scrum, dan manajemen tim IT.'),
('DSN', 'Graphic Design', 'Belajar Photoshop, Illustrator, dan aset visual.'),
('FIN', 'Finance', 'Dasar-dasar keuangan usaha dan pencatatan akuntansi.'),
('WRITE', 'Copywriting', 'Seni menulis teks promosi yang menjual.'),
('LANG', 'Languages', 'Belajar bahasa asing untuk kebutuhan karier global.'),
('SPEAK', 'Public Speaking', 'Meningkatkan rasa percaya diri berbicara di depan umum.'),
('PHOTO', 'Photography', 'Teknik fotografi dasar dan editing foto.');

INSERT INTO courses (code_course, code_category, id_instructor, name_course, desc_course, price, quota) VALUES
('WEB-01', 'WEB', 1, 'HTML & CSS Dasar', 'Belajar struktur dasar website.', 45000.00, 50),
('WEB-02', 'WEB', 1, 'JavaScript Modern', 'Menguasai ES6 hingga Async Await.', 120000.00, 30),
('WEB-03', 'WEB', 2, 'ReactJS for Beginners', 'Membuat aplikasi web SPA dengan React.', 250000.00, 20),
('WEB-04', 'WEB', 2, 'Backend Node.js & Express', 'Membangun RESTful API berskala produk.', 350000.00, 15),
('WEB-05', 'WEB', 1, 'Fullstack Web dengan Laravel', 'Kelas komprehensif membuat aplikasi web.', 650000.00, 10),
('DATA-01', 'DATA', 3, 'Python untuk Data Science', 'Pengenalan NumPy, Pandas, dan Matplotlib.', 150000.00, 40),
('DATA-02', 'DATA', 3, 'Machine Learning Fundamental', 'Belajar algoritma regresi dan klasifikasi.', 550000.00, 0),
('DATA-03', 'DATA', 3, 'SQL Fundamental untuk Analyst', 'Menguasai query database dari nol.', 75000.00, 100),
('MOB-01', 'MOB', 4, 'Flutter Hybrid Mobile App', 'Satu codebase untuk Android dan iOS.', 450000.00, 25),
('MOB-02', 'MOB', 4, 'Android Native dengan Kotlin', 'Belajar pengembangan aplikasi Android resmi.', 600000.00, 12),
('MKT-01', 'MKT', 5, 'Mastering Google Ads', 'Optimasi iklan berbayar untuk bisnis.', 180000.00, 0),
('MKT-02', 'MKT', 5, 'SEO Specialist Bootcamp', 'Menaikkan peringkat website di Google.', 220000.00, 35),
('UIUX-01', 'UIUX', 4, 'UI/UX Design Fundamental', 'Wireframing hingga Prototyping di Figma.', 135000.00, 50),
('CYBER-01', 'CYBER', 2, 'Ethical Hacking Dasar', 'Belajar konsep dasar keamanan penetrasi.', 750000.00, 5),
('CLOUD-01', 'CLOUD', 2, 'AWS Cloud Practitioner', 'Persiapan sertifikasi AWS dasar.', 520000.00, 8);

INSERT INTO enrollments (id_user, code_course) VALUES
(6, 'WEB-01'),   
(6, 'WEB-02'),  
(7, 'WEB-01'), 
(7, 'WEB-03'),   
(8, 'DATA-01'), 
(8, 'DATA-03'),  
(9, 'UIUX-01'),  
(10, 'WEB-05'),  
(11, 'WEB-02'),  
(12, 'MOB-01'),  
(13, 'CYBER-01'),
(14, 'DATA-01'), 
(15, 'DATA-03'),  
(6, 'DATA-03'),   
(7, 'DATA-03');   


-- Tampilkan seluruh data course
SELECT * FROM courses;

-- Tampilkan nama course dan harga saja
SELECT name_course, price FROM courses;

-- Tampilkan course dengan harga antara 50.000 sampai 200.000
SELECT * FROM courses 
WHERE price BETWEEN 50000 AND 200000;

-- Tampilkan course yang memiliki kuota 0 ATAU harga di atas 500.000
SELECT * FROM courses 
WHERE quota = 0 OR price > 500000;

-- Tampilkan 5 course dengan harga tertinggi
SELECT * FROM courses 
ORDER BY price DESC 
LIMIT 5;



-- Hitung total user yang terdaftar
SELECT COUNT(id_user) AS total_user_terdaftar FROM users;

-- Hitung total course yang tersedia
SELECT COUNT(id_course ) AS total_course_tersedia FROM courses;

-- Hitung jumlah course per kategori
SELECT code_category, COUNT(id_course ) AS jumlah_course 
FROM courses 
GROUP BY code_category;

-- Hitung rata-rata harga course per kategori
SELECT code_category, AVG(price) AS rata_rata_harga 
FROM courses 
GROUP BY code_category;

-- Tampilkan kategori yang memiliki lebih dari 3 course
SELECT code_category, COUNT(code_course) AS jumlah_course 
FROM courses 
GROUP BY code_category 
HAVING COUNT(code_course) > 3;



-- Tampilkan daftar course beserta nama kategorinya
SELECT c.name_course, cc.name_category 
FROM courses c
INNER JOIN course_categories cc ON c.code_category = cc.code_category;

-- Tampilkan semua kategori meskipun belum memiliki course
SELECT cc.name_category, c.name_course 
FROM course_categories cc
LEFT JOIN courses c ON cc.code_category = c.code_category;

-- Tampilkan semua user meskipun belum pernah mengupload course
SELECT u.name, u.role, c.name_course 
FROM users u
LEFT JOIN courses c ON u.id_user = c.id_instructor;

-- Tampilkan daftar course beserta nama instructor yang membuat course tersebut
SELECT c.name_course, u.name AS name_instructor 
FROM courses c
INNER JOIN users u ON c.id_instructor = u.id_user;

-- Tampilkan jumlah course yang dibuat oleh masing-masing instructor
SELECT u.name AS name_instructor, COUNT(c.id_course) AS jumlah_course_dibuat
FROM users u
LEFT JOIN courses c ON u.id_user = c.id_instructor
WHERE u.role = 'instructor'
GROUP BY u.id_user, u.name;
