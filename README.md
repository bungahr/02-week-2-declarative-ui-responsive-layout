# RuangKita - Dashboard Ketersediaan Lab Komputer

## 1. Identitas Mahasiswa, Varian NIM, dan Kode UI
* **Nama:** Bunga Hendryanda Ramadhani
* **NIM:** 362558302031
* **Varian (Digit Terakhir NIM):** 1
* **Kode UI:** M02-2031
* **Nama Project:** `02-week-2-declarative-ui-responsive-layout`

---

## 2. Ringkasan Arsitektur Widget dan Alasan Menggunakan StatefulWidget

### Ringkasan Arsitektur Widget
Aplikasi RuangKita ini dibuat pakai widget bawaan Flutter SDK tanpa package tambahan. Susunan widgetnya seperti ini:
* Di bagian paling luar, saya pakai `Center` dan `ConstrainedBox` biar pas dibuka di web/laptop tampilannya nggak melar ke samping.
* Untuk bagian atas (header), saya pakai `Card` buat nampilin biodata saya, isinya ada `Row`, `Column`, sama `CircleAvatar`.
* Buat tombol filternya, saya pakai widget `Wrap` dan `ChoiceChip` biar tombolnya bisa menyesuaikan lebar layar.
* Konten utamanya dibungkus pakai `LayoutBuilder` buat ngatur responsif, lalu di dalamnya ada `GridView.builder` buat nampilin daftar lab.
* Bagian kartu lab (card) dibuat pakai `Card`, `InkWell` biar bisa diklik, serta `Row` dan `Column` buat atur posisi teks. Biar teksnya nggak berantakan, saya pakai `Expanded`. Terus di pojok kanan atas kartu, saya pasang badge status pake `Stack` dan `Positioned`.

### Alasan Menggunakan StatefulWidget
Saya pakai `StatefulWidget` di halaman utama karena ada bagian tampilan yang harus bisa berubah-ubah pas aplikasi dipakai, contohnya:
1. **Filter Status Ruangan:** Pas kita klik tombol `ChoiceChip`, pilihan filternya bakal berubah pakai `setState()`. Setelah itu daftar card lab yang muncul bakal ikut berubah sesuai filter tanpa harus restart aplikasi.
2. **Ganti Tema (Light/Dark Mode):** Tombol di AppBar bisa mengubah warna aplikasi dari mode terang ke mode gelap secara langsung.
3. **Switch Pengingat:** Tombol sakelar "Ingatkan saya" yang ada di dalam bottom sheet bisa diaktifkan atau dimatikan oleh pengguna.

---

## 3. Tabel Tiga Breakpoint Layout Responsif

Jumlah kolom pada daftar lab komputer diatur otomatis berdasarkan lebar layar (`constraints.maxWidth`) lewat widget `LayoutBuilder`:

| Ukuran Layar | Jumlah Kolom | Widget yang Digunakan | Alasan |
| :--- | :---: | :--- | :--- |
| **Kurang dari 600 dp** | 1 Kolom | `LayoutBuilder`, `GridView`, `Card` | Biar card tetap kelihatan jelas dan nyaman dibaca di layar HP yang kecil. |
| **600 sampai 839 dp** | 2 Kolom | `LayoutBuilder`, `GridView`, `Card` | Biar bisa memanfaatkan layar tablet yang lebih lebar tanpa bikin card-nya kelihatan sempit. |
| **840 dp atau lebih** | 3 Kolom | `LayoutBuilder`, `GridView`, `Card` | Biar bisa nampilin lebih banyak card dalam satu baris pas dibuka di layar komputer/web yang luas. |

---

## 4. Empat Screenshot Running Aplikasi
Ini adalah foto bukti pas aplikasi RuangKita dijalankan:

### Mobile - Light Mode
![Mobile Light](screenshots/01_mobile_light.png)

### Tablet Layout
![Tablet](screenshots/02_tablet.png)

### Expanded / Web Layout
![Expanded](screenshots/03_expanded.png)

### Dark Mode
![Dark Mode](screenshots/04_dark_mode.png)

---

## 5. Tautan Commit Final
* **Link Repository:** [Repository GitHub RuangKita](https://github.com/bungahr/02-week-2-declarative-ui-responsive-layout)

---

## 6. Jawaban Refleksi

### (1) Mengapa Expanded membantu Text di dalam Row?
Menurut saya, `Expanded` itu membantu banget karena bikin `Text` bisa dapat sisa ruang yang ada di dalam `Row`. Kalau teks kegiatannya terlalu panjang dan nggak dikasih batas ruang pake `Expanded`, layout aplikasinya bisa rusak atau error nabrak batas layar (overflow). Di aplikasi ini, saya juga tambahkan `maxLines` dan `TextOverflow.ellipsis` biar teks yang kepanjangan otomatis dipotong rapi dan diganti titik-titik `...` biar card-nya tetap bagus.

### (2) Mengapa LayoutBuilder lebih tepat untuk layout lokal daripada hanya MediaQuery?
Saya pilih `LayoutBuilder` karena widget ini bisa melihat ukuran ruang asli yang tersedia di bagian layout yang lagi dibuat. Dengan `LayoutBuilder`, saya bisa pakai `constraints.maxWidth` buat menentukan jumlah kolom card secara lokal. Jadi kalau ukuran ruangnya berubah, perubahan kolomnya langsung diterapkan di grid lab itu sendiri. Kalau cuma pakai `MediaQuery`, yang dibaca adalah ukuran total satu layar HP, jadi kurang pas buat ngatur grid yang ada di dalam halaman.

### (3) Apa yang berubah pada widget tree ketika setState() dipanggil?
Saat kita panggil `setState()`, Flutter bakal menjalankan ulang fungsi `build()` pada `StatefulWidget` tersebut. Di dalam susunan widget (*widget tree*), widget yang butuh data baru bakal dibuat ulang. Contohnya di aplikasi saya, pas pengguna klik `ChoiceChip`, nilai filternya berubah. Setelah `setState()` jalan, grid yang menampilkan daftar card lab bakal dibangun kembali biar isi card-nya berubah sesuai status filter yang baru saja dipilih.
