# AI USAGE - RuangKita

## 1. Identitas
* **Nama:** Bunga Hendryanda Ramadhani
* **NIM:** 362558302031
* **Nama Aplikasi:** RuangKita
* **Kode UI:** M02-2031
* **Nama Project:** `02-week-2-declarative-ui-responsive-layout`

---

## 2. Alat / Model AI yang Dipakai
Saya menggunakan **ChatGPT** untuk membantu saya sebagai asisten coding selama menyelesaikan tugas Flutter Modul 02 ini.

---

## 3. Tujuan Penggunaan AI
* Membantu memahami apa saja instruksi di tugas Modul 02 dan menentukan struktur folder proyek.
* Mempelajari cara kerja `StatefulWidget`, fungsi `setState()`, dan bagaimana `LayoutBuilder` dipakai untuk membuat tampilan responsif.
* Membantu mencari tahu penyebab error dan solusinya ketika saya menjalankan perintah `flutter analyze`.

---

## 4. Ringkasan Prompt
Beberapa contoh pertanyaan yang saya ajukan ke ChatGPT:
* *"Bantu saya membuat model RoomSession dan data lokal untuk aplikasi Lab Komputer sesuai ketentuan tugas."*
* *"Bagaimana cara menggunakan LayoutBuilder dan constraints.maxWidth untuk membagi kolom grid menjadi responsif?"*
* *"Muncul error parameter onThemeChanged dan isDarkMode belum tersedia di kelas halaman utama, bagaimana cara memperbaikinya?"*
* *"Bagaimana cara memberikan jarak pada teks di dalam Stack agar tidak tertutup oleh badge status di kanan atas?"*

---

## 5. Bagian Kode yang Terpengaruh
* **`lib/models/room_session.dart`**: Pembuatan bagian model data dan pilihan status untuk ruangan lab.
* **`lib/main.dart`**: Pengaturan tema Light Mode dan Dark Mode memakai skema `ColorScheme.fromSeed`.
* **`lib/modul02/studi_kasus/lab_komputer.dart`**: Pembuatan filter status memakai `Wrap` dan `ChoiceChip`, pengaturan grid responsif memakai `LayoutBuilder`, dan desain kartu informasi lab memakai `Stack` serta `Positioned`.

---

## 6. Apa yang Saya Ubah Setelah Menerima Saran AI
Setelah berdiskusi dengan ChatGPT dan melihat contoh kodenya, saya menyesuaikan dan mengubah beberapa bagian kode secara mandiri:
1. **Memperbaiki Parameter Tema:** Saya mengubah nama class menjadi `LabKomputerPage` dan menambahkan parameter `onThemeChanged` serta `isDarkMode`. Ini saya lakukan agar tombol ganti tema di halaman utama bisa terhubung langsung dengan logika di file `main.dart`. Langkah ini berhasil membuat error di `flutter analyze` hilang.
2. **Menyesuaikan Jarak Teks Kartu:** Saya menambahkan `Padding` di sebelah kanan pada bagian teks nama lab di dalam card. Tujuannya agar teks yang terlalu panjang otomatis terpotong menjadi titik tiga (`ellipsis`) sebelum menabrak badge status di pojok kanan atas.
3. **Membatasi Lebar Layar Web:** Saya membungkus konten grid utama memakai widget `Center` dan `ConstrainedBox` dengan batas maksimal 1200 dp. Ini saya lakukan agar ketika aplikasi dibuka di browser laptop atau web yang layarnya lebar, ukuran kartu tidak melar terlalu lebar.

---

## 7. Pernyataan Penutup
Meskipun saya melihat saran dan contoh kode dari ChatGPT, **saya tetap mengetik kodenya sendiri, mencoba jalannya aplikasi di perangkat atau browser secara mandiri, dan memahami penuh cara kerja dari setiap baris kode** yang ada di proyek RuangKita ini.

---

**Tautan Riwayat Chat ChatGPT:** [Klik di sini untuk melihat chat](https://chatgpt.com/share/6abafd41-f6c8-83ec-a428-329f0b206f1d)
