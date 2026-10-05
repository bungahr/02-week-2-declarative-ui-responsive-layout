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
Aplikasi RuangKita ini dibuat pakai widget bawaan dari Flutter SDK. Susunan widget yang saya gunakan yaitu:
* Di bagian paling luar, saya pakai `Center` dan `ConstrainedBox` supaya pas dibuka di web atau laptop tampilannya tidak melar ke samping.
* Untuk bagian header atas, saya pakai `Card` buat menampilkan biodata saya, yang di dalamnya ada susunan `Row`, `Column`, dan `CircleAvatar`.
* Buat bagian tombol filter status, saya pakai widget `Wrap` dan `ChoiceChip` agar tombolnya bisa otomatis turun ke bawah kalau layarnya sempit.
* Konten utamanya dibungkus pakai widget `LayoutBuilder` buat mengatur responsif layarnya, lalu di dalamnya ada `GridView.builder` buat memunculkan daftar lab.
* Untuk desain kartu informasi lab (card), saya pakai `Card` dan `InkWell` biar bisa diklik. Di dalamnya ada `Row` dan `Column` buat atur posisi teks, serta widget `Expanded` biar teksnya aman. Lalu di pojok kanan atas kartu, saya pasang badge status pakai widget `Stack` dan `Positioned`.

### Alasan Menggunakan StatefulWidget
Saya memilih pakai `StatefulWidget` di halaman utama karena ada beberapa bagian tampilan yang harus bisa berubah-ubah pas aplikasi sedang dijalankan, contohnya:
1. **Filter Status Ruangan:** Pas pengguna klik pilihan tombol `ChoiceChip`, nilai filternya bakal berubah pakai `setState()`. Setelah itu, daftar card lab yang muncul di layar akan langsung ikut berubah sesuai filter tanpa harus menjalankan ulang aplikasi dari awal.
2. **Ganti Tema (Light/Dark Mode):** Tombol di bagian AppBar bisa dipakai buat mengubah warna tema aplikasi secara langsung dari mode terang ke mode gelap.
3. **Switch Pengingat:** Tombol sakelar "Ingatkan saya" yang ada di dalam bottom sheet bisa diaktifkan atau dimatikan secara langsung oleh pengguna.

---

## 3. Tabel Tiga Breakpoint Layout Responsif

Jumlah kolom pada daftar kartu lab komputer diatur secara otomatis berdasarkan lebar layar yang tersedia (`constraints.maxWidth`) lewat widget `LayoutBuilder`:

| Ukuran Layar | Jumlah Kolom | Widget yang Digunakan | Alasan Penggunaan |
| :--- | :---: | :--- | :--- |
| **Kurang dari 600 dp** | 1 Kolom | `LayoutBuilder`, `GridView`, `Card` | Supaya card tetap kelihatan jelas dan nyaman dibaca pas dibuka di layar HP yang kecil. |
| **600 sampai 839 dp** | 2 Kolom | `LayoutBuilder`, `GridView`, `Card` | Memanfaatkan ruang layar tablet yang lebih lebar tanpa membuat card-nya kelihatan terlalu sempit. |
| **840 dp atau lebih** | 3 Kolom | `LayoutBuilder`, `GridView`, `Card` | Menampilkan lebih banyak card dalam satu baris pas aplikasi dibuka di layar komputer atau web yang luas. |

---

## 4. Empat Screenshot Running Aplikasi
Berikut adalah foto bukti pas aplikasi RuangKita dijalankan:

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
Menurut saya, widget `Expanded` itu membantu sekali karena membuat `Text` bisa mendapatkan sisa ruang kosong yang tersedia di dalam `Row`. Kalau teks kegiatannya terlalu panjang dan tidak diberi batas ruang pakai `Expanded`, teks tersebut bakal memanjang terus ke kanan sampai keluar layar dan menyebabkan error nabrak batas (overflow). Di aplikasi ini, saya juga tambahkan properti `maxLines` dan `TextOverflow.ellipsis` supaya teks yang kepanjangan otomatis terpotong rapi menjadi titik-titik `...` agar tampilan card tetap bagus.

### (2) Mengapa LayoutBuilder lebih tepat untuk layout lokal daripada hanya MediaQuery?
Saya memilih `LayoutBuilder` karena widget ini bisa melihat ukuran ruang asli yang tersedia di bagian tata letak yang sedang kita buat. Dengan `LayoutBuilder`, saya bisa pakai variabel `constraints.maxWidth` buat menentukan jumlah kolom card secara lokal. Jadi kalau ukuran ruangnya berubah, perubahan jumlah kolomnya langsung diterapkan di grid lab itu sendiri. Kalau cuma pakai `MediaQuery`, yang dibaca adalah ukuran total satu layar HP secara keseluruhan, jadi kurang pas buat mengatur grid yang posisinya ada di dalam sub-halaman.

### (3) Apa yang berubah pada widget tree ketika setState() dipanggil?
Saat kita memanggil fungsi `setState()`, Flutter bakal menjalankan ulang fungsi `build()` pada `StatefulWidget` tersebut. Di dalam susunan widget (*widget tree*), bagian halaman atau widget anak yang membutuhkan data baru akan dibuat ulang. Contohnya di aplikasi saya, pas pengguna klik tombol `ChoiceChip`, nilai filternya berubah. Setelah `setState()` jalan, grid yang menampilkan daftar card lab bakal dibangun kembali supaya isi card yang muncul di layar langsung berubah sesuai status filter yang baru saja dipilih.
