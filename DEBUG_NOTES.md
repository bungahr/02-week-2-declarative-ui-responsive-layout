# Debug Notes

## Masalah 1 - Tombol Light/Dark Mode Belum Berfungsi

### Gejala

Saat saya menambahkan fitur Light Mode dan Dark Mode, muncul error saat
menjalankan `flutter analyze`.

Error yang muncul adalah:

```text
The named parameter 'onThemeChanged' isn't defined.
The named parameter 'isDarkMode' isn't defined.
```

Tombol untuk mengganti tema juga belum bisa digunakan karena halaman Lab
Komputer belum menerima fungsi untuk mengubah tema dari `main.dart`.

### Screenshot Sebelum Perbaikan

![Error sebelum perbaikan](screenshots/debug/01_theme_before.png)

### Dugaan Penyebab

Di kode awal, halaman masih menggunakan class `LabKomputer`. Class tersebut
belum memiliki parameter `onThemeChanged` dan `isDarkMode`.

Sedangkan di `main.dart`, saya sudah mengirim dua parameter tersebut ke
halaman utama. Karena parameter pada class belum dibuat, Flutter menampilkan
error.

### Perubahan Kode

Saya mengganti nama class menjadi `LabKomputerPage` dan menambahkan dua
parameter berikut:

```dart
final VoidCallback onThemeChanged;
final bool isDarkMode;
```

Saya juga menambahkan constructor berikut:

```dart
const LabKomputerPage({
  super.key,
  required this.onThemeChanged,
  required this.isDarkMode,
});
```

Setelah itu, saya menambahkan tombol untuk mengganti tema di bagian AppBar.

```dart
IconButton(
  onPressed: widget.onThemeChanged,
  icon: Icon(
    widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
  ),
)
```

### Screenshot Sesudah Perbaikan

![Tombol tema setelah perbaikan](screenshots/debug/01_theme_after.png)

### Hasil

Tombol Light/Dark Mode sudah muncul di AppBar. Saat tombol ditekan, tampilan
aplikasi bisa berubah dari Light Mode ke Dark Mode atau sebaliknya.

---

## Masalah 2 - Badge Status Menutupi Nama Lab

### Gejala

Pada card, badge status seperti `Berlangsung` berada di kanan atas. Pada
tampilan awal, badge terlalu dekat dengan nama lab sehingga tulisan nama lab
bisa tertutup atau kurang jelas dibaca.

### Screenshot Sebelum Perbaikan

![Badge sebelum perbaikan](screenshots/debug/02_badge_before.png)

### Dugaan Penyebab

Badge dibuat menggunakan `Stack` dan `Positioned` di kanan atas, tetapi bagian
teks nama lab belum diberi ruang khusus. Akibatnya, badge dan teks nama lab
bisa bertabrakan saat ukuran card lebih sempit.

### Kode Bagian yang Terkait

```dart
Positioned(
  top: 12,
  right: 12,
  child: Container(
    child: Text(ruangan.status),
  ),
)
```

### Perubahan Kode

Saya menambahkan ruang di sebelah kanan teks menggunakan `Padding`. Tujuannya
agar teks nama lab tidak masuk ke bagian badge status.

```dart
Expanded(
  child: Padding(
    padding: const EdgeInsets.only(right: 90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ruangan.namaRuang,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  ),
)
```

Badge tetap menggunakan `Stack` dan `Positioned` karena itu merupakan salah
satu syarat pada tugas.

### Screenshot Sesudah Perbaikan

![Badge setelah perbaikan](screenshots/debug/02_badge_after.png)

### Hasil

Badge status tetap berada di kanan atas card, tetapi nama lab tidak tertutup
dan lebih mudah dibaca.