const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware untuk parsing data form
app.use(bodyParser.urlencoded({ extended: true }));
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));


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

// // Folder untuk menyimpan gambar screenshot
// const uploadFolder = path.join(__dirname, 'uploads');
// if (!fs.existsSync(uploadFolder)) {
//     fs.mkdirSync(uploadFolder);
// }

// // Konfigurasi multer untuk menyimpan file gambar
// const storage = multer.diskStorage({
//     destination: (req, file, cb) => {
//         cb(null, uploadFolder);
//     },
//     filename: (req, file, cb) => {
//         const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
//         const ext = path.extname(file.originalname);
//         cb(null, `violation_${timestamp}${ext}`);
//     },
// });

// const upload = multer({ storage });


// // Rute untuk menangani permintaan POST dari Python
// app.post('/upload', upload.single('gambar_screenshot'), (req, res) => {
//     const nama = req.body.nama;
//     const nomorIndukSiswa = req.body.nomor_induk_siswa;
//     const waktu = req.body.waktu;

//     if (!req.file) {
//         return res.status(400).send('File gambar tidak ditemukan');
//     }

//     const filePath = req.file.path;
//     console.log('nama:', nama);
//     console.log('Nomor Induk Siswa:', nomorIndukSiswa);
//     console.log('Waktu Pengambilan:', waktu);
//     console.log('File tersimpan di:', filePath);

//     const query = `INSERT INTO violations (nama, nomor_induk_siswa, waktu, file_path) VALUES (?, ?, ?, ?)`;
//     db.query(query, [nama, nomorIndukSiswa, waktu, filePath], (err, result) => {
//         if (err) {
//             console.error('Gagal menyimpan ke database:', err);
//             return res.status(500).send('Gagal menyimpan ke database');
//         }
//         console.log('Data berhasil disimpan ke database.');
//         res.status(200).send('Screenshot berhasil diterima dan disimpan ke database');
//     });
// });

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

// Rute untuk menangani permintaan POST dari Python
app.post('/upload', upload.single('gambar_screenshot'), (req, res) => {
    const nama = req.body.nama;
    const nomorIndukSiswa = req.body.nomor_induk_siswa;
    const waktu = req.body.waktu;

    if (!req.file) {
        return res.status(400).send('File gambar tidak ditemukan');
    }

    // Simpan relative path, bukan absolute path
    const filePath = path.join('uploads', path.relative(uploadFolder, req.file.path));

    console.log('nama:', nama);
    console.log('Nomor Induk Siswa:', nomorIndukSiswa);
    console.log('Waktu Pengambilan:', waktu);
    console.log('File tersimpan di:', filePath);

    const query = `INSERT INTO violations (nama, nomor_induk_siswa, waktu, file_path) VALUES (?, ?, ?, ?)`;
    db.query(query, [nama, nomorIndukSiswa, waktu, filePath], (err, result) => {
        if (err) {
            console.error('Gagal menyimpan ke database:', err);
            return res.status(500).send('Gagal menyimpan ke database');
        }
        console.log('Data berhasil disimpan ke database.');
        res.status(200).send('Screenshot berhasil diterima dan disimpan ke database');
    });
});

//peh
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
  });

  app.get('/history', (req, res) => {
    res.sendFile(__dirname + '/history.html');
  });

// Endpoint untuk menampilkan form (optional)
app.get('/form', (req, res) => {
    res.sendFile(__dirname + '/form.html');
  });
  
  // Endpoint untuk menyimpan data ke database
  app.post('/submit', (req, res) => {
    const { nama, nomor_induk, webcam_stream } = req.body;
  
    const query = 'INSERT INTO data_webcam (nama, nomor_induk, webcam_stream) VALUES (?, ?, ?)';
    db.query(query, [nama, nomor_induk, webcam_stream], (err, result) => {
      if (err) {
        console.error(err);
        // res.status(500).send('Gagal menyimpan data ke database.');
        res.status(500).send(`
          <p>Gagal menyimpan data ke database.</p>
          <script>
            setTimeout(() => {
              window.location.href = '/';
            }, 2000);
          </script>
        `);
      } else {
        // res.send('Data berhasil disimpan!');
        res.send(`
          <p>Data berhasil disimpan!</p>
          <script>
            setTimeout(() => {
              window.location.href = '/';
            }, 2000);
          </script>
        `);
      }
    });
  });

  // Endpoint untuk mendapatkan data pengguna
  app.get('/api/users', (req, res) => {
    const query = 'SELECT nama, nomor_induk, webcam_stream FROM data_webcam';
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error executing query:', err.message);
        res.status(500).send('Error fetching data');
      } else {
        res.json(results); // Kirim semua data sebagai array
      }
    });
  });

  // Endpoint untuk mendapatkan data kecurangan
  app.get('/api/history', (req, res) => {
    // const query = 'SELECT id, nama, nomor_induk_siswa, waktu, file_path FROM violations';
    // db.query(query, (err, results) => {
    //   if (err) {
    //     console.error('Error executing query:', err.message);
    //     res.status(500).send('Error fetching data');
    //   } else {
    //     res.json(results); // Kirim semua data sebagai array
    //   }
    // });
    const query = 'SELECT id, nama, nomor_induk_siswa, waktu, REPLACE(file_path, "\\\\", "/") AS file_path FROM violations';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error executing query:', err.message);
            res.status(500).send('Error fetching data');
        } else {
            res.json(results);
        }
    });

  });


  // Endpoint DELETE untuk menghapus data
app.delete('/api/users/:id', (req, res) => {
  const id = req.params.id;
  const sql = 'DELETE FROM data_webcam WHERE nomor_induk = ?';

  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send('Gagal menghapus data');
      return;
    }

    res.send({ message: `Data dengan Nomor Induk ${id} berhasil dihapus.` });
  });
});

  

// Jalankan server pada port yang ditentukan
app.listen(port, () => {
    console.log(`Server berjalan di http://localhost:${port}`);
});
