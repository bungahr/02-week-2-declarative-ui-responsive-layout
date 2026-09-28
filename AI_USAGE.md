# AI USAGE - RuangKita

## 1. Identitas
* **Nama:** Bunga Hendryanda Ramadhani
* **NIM:** 362558302031
* **Nama Aplikasi:** RuangKita
* **Kode UI:** M02-2031
* **Nama Project:** `02-week-2-declarative-ui-responsive-layout`

---

## 2. Alat / Model AI yang Dipakai
Saya menggunakan **ChatGPT** sebagai asisten pemrograman selama pengerjaan tugas Flutter Modul 02 ini.

---

## 3. Tujuan Penggunaan AI
* Membantu memahami instruksi tugas Modul 02 dan menentukan struktur folder proyek.
* Mempelajari konsep dasar `StatefulWidget`, `setState()`, dan cara kerja `LayoutBuilder` untuk membuat layout yang responsif.
* Membantu mencari solusi dan penyebab ketika terjadi error saat menjalankan perintah `flutter analyze`.

---

## 4. Ringkasan Prompt
Beberapa contoh pertanyaan/prompt yang saya ajukan kepada AI:
* *"Bantu saya membuat model RoomSession dan data lokal untuk aplikasi Lab Komputer sesuai ketentuan tugas."*
* *"Bagaimana cara menggunakan LayoutBuilder dan constraints.maxWidth untuk membagi kolom grid menjadi responsif?"*
* *"Muncul error parameter onThemeChanged dan isDarkMode belum tersedia di kelas halaman utama, bagaimana cara memperbaikinya?"*
* *"Bagaimana cara memberikan jarak pada teks di dalam Stack agar tidak tertutup oleh badge status di kanan atas?"*

---

## 5. Bagian Kode yang Terpengaruh
* **`lib/models/room_session.dart`**: Pembuatan struktur model data dan enum status ruangan.
* **`lib/main.dart`**: Konfigurasi tema Light/Dark Mode dengan `ColorScheme.fromSeed`.
* **`lib/modul02/studi_kasus/lab_komputer.dart`**: Implementasi filter menggunakan `Wrap` dan `ChoiceChip`, layout grid responsif dengan `LayoutBuilder`, serta pembuatan struktur kartu informasi menggunakan `Stack` dan `Positioned`.

---

## 6. Apa yang Saya Ubah Setelah Menerima Saran AI
Setelah berdiskusi dengan AI dan mendapatkan saran perbaikan, saya memodifikasi kodenya secara mandiri sebagai berikut:
1. **Perbaikan Parameter Tema:** Saya mengubah nama class menjadi `LabKomputerPage` dan menambahkan parameter `onThemeChanged` serta `isDarkMode` agar tombol ganti tema di halaman utama bisa terhubung langsung dengan logika di `main.dart`. Langkah ini berhasil menyelesaikan masalah error pada `flutter analyze`.
2. **Penyesuaian Jarak Teks (Badge):** Saya menambahkan `Padding` kanan pada widget teks di dalam kartu ruangan agar teks nama lab otomatis terpotong titik tiga (`ellipsis`) sebelum menabrak badge status yang ada di pojok kanan atas.
3. **Pembatasan Lebar Web:** Saya membungkus struktur grid utama menggunakan widget `Center` dan `ConstrainedBox` dengan batas maksimal 1200 dp agar ukuran kartu tidak melar terlalu lebar saat dibuka di browser web laptop.

---

## 7. Pernyataan Penutup
Meskipun saya mendapatkan saran kode dari AI, **saya tetap mengetik, melakukan pengujian jalannya aplikasi di perangkat/browser secara mandiri, dan memahami secara penuh cara kerja setiap baris kode** yang ada di dalam proyek RuangKita ini.
