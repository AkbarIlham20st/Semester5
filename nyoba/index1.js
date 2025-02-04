const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const mysql = require('mysql2');

const app = express();
const port = 3000;

// Middleware untuk mengurai JSON
app.use(express.json());

// Koneksi ke database MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',         // Sesuaikan dengan user MySQL Anda
    password: '',         // Kosongkan jika Anda tidak memakai password (default XAMPP)
    database: 'db_siswa'  // Nama database yang telah Anda buat
});

db.connect(err => {
    if (err) throw err;
    console.log('Terhubung ke database MySQL.');
});

// Folder untuk menyimpan gambar screenshot
const uploadFolder = path.join(__dirname, 'uploads');
if (!fs.existsSync(uploadFolder)) {
    fs.mkdirSync(uploadFolder);
}

// Konfigurasi multer untuk menyimpan file gambar
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, uploadFolder);
    },
    filename: (req, file, cb) => {
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
        const ext = path.extname(file.originalname);
        cb(null, `violation_${timestamp}${ext}`);
    },
});

const upload = multer({ storage });

// Rute untuk menerima data autentikasi dari Python
app.post('/auth', (req, res) => {
    const nomorIndukSiswa = req.body.nomor_induk_siswa;
    const rtspLink = req.body.rtsp_link;

    if (!nomorIndukSiswa || !rtspLink) {
        return res.status(400).send('Data nomor_induk_siswa atau rtsp_link tidak lengkap');
    }

    // Simpan data ke database
    const query = `INSERT INTO auth_logs (nomor_induk_siswa, rtsp_link, waktu) VALUES (?, ?, ?)`;
    const waktu = new Date();
    db.query(query, [nomorIndukSiswa, rtspLink, waktu], (err, result) => {
        if (err) {
            console.error('Gagal menyimpan data autentikasi ke database:', err);
            return res.status(500).send('Gagal menyimpan data autentikasi ke database');
        }
        console.log('Data autentikasi berhasil disimpan ke database.');
        res.status(200).send('Data autentikasi berhasil diterima dan disimpan');
    });
});

// Rute untuk menangani permintaan POST dari Python untuk upload gambar screenshot
app.post('/upload', upload.single('gambar_screenshot'), (req, res) => {
    const nomorIndukSiswa = req.body.nomor_induk_siswa;
    const waktu = req.body.waktu;

    if (!req.file) {
        return res.status(400).send('File gambar tidak ditemukan');
    }

    const filePath = req.file.path;
    console.log('Nomor Induk Siswa:', nomorIndukSiswa);
    console.log('Waktu Pengambilan:', waktu);
    console.log('File tersimpan di:', filePath);

    // Simpan data ke database
    const query = `INSERT INTO violations (nomor_induk_siswa, waktu, file_path) VALUES (?, ?, ?)`;
    db.query(query, [nomorIndukSiswa, waktu, filePath], (err, result) => {
        if (err) {
            console.error('Gagal menyimpan ke database:', err);
            return res.status(500).send('Gagal menyimpan ke database');
        }
        console.log('Data berhasil disimpan ke database.');
        res.status(200).send('Screenshot berhasil diterima dan disimpan ke database');
    });
});

// Jalankan server pada port yang ditentukan
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
