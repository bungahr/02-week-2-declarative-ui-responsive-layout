class RoomSession {
  final String namaRuang;
  final String kegiatan;
  final String kategori;
  final String waktu;
  final String status;
  final String deskripsi;
  final int kapasitas;

  RoomSession({
    required this.namaRuang,
    required this.kegiatan,
    required this.kategori,
    required this.waktu,
    required this.status,
    required this.deskripsi,
    required this.kapasitas,
  });
}

List<RoomSession> dataRuangan = [
  RoomSession(
    namaRuang: 'Lab Pemrograman A',
    kegiatan: 'Praktikum Pemrograman Perangkat Bergerak',
    kategori: 'Pemrograman',
    waktu: '08:00 - 10:00',
    status: 'Berlangsung',
    deskripsi: 'Praktikum membuat tampilan aplikasi mobile sederhana menggunakan Flutter dan memahami struktur dasar widget.',
    kapasitas: 30,
  ),
  RoomSession(
    namaRuang: 'Lab Pemrograman B',
    kegiatan: 'Praktikum Algoritma dan Struktur Data',
    kategori: 'Pemrograman',
    waktu: '10:00 - 12:00',
    status: 'Akan Datang',
    deskripsi: 'Kegiatan membahas algoritma dasar dan penerapannya dalam pembuatan program sederhana.',
    kapasitas: 30,
  ),
  RoomSession(
    namaRuang: 'Lab Basis Data',
    kegiatan: 'Praktikum Pengelolaan Basis Data',
    kategori: 'Basis Data',
    waktu: '08:00 - 10:00',
    status: 'Selesai',
    deskripsi: 'Mahasiswa mempraktikkan proses pembuatan tabel, input data, dan pencarian data menggunakan perintah SQL.',
    kapasitas: 25,
  ),
  RoomSession(
    namaRuang: 'Lab Jaringan',
    kegiatan: 'Konfigurasi Jaringan Komputer Lokal',
    kategori: 'Jaringan',
    waktu: '13:00 - 15:00',
    status: 'Akan Datang',
    deskripsi: 'Lab digunakan untuk melakukan konfigurasi jaringan lokal dan menguji koneksi antarperangkat menggunakan kabel jaringan.',
    kapasitas: 30,
  ),
  RoomSession(
    namaRuang: 'Lab Sistem Operasi',
    kegiatan: 'Instalasi dan Pengelolaan Sistem Operasi',
    kategori: 'Sistem Operasi',
    waktu: '09:00 - 11:00',
    status: 'Tersedia',
    deskripsi: 'Ruangan tersedia untuk kegiatan instalasi sistem operasi dan praktik pengelolaan perangkat komputer.',
    kapasitas: 25,
  ),
  RoomSession(
    namaRuang: 'Lab Mobile',
    kegiatan: 'Pembuatan Dashboard Ketersediaan Ruang Laboratorium',
    kategori: 'Mobile',
    waktu: '13:00 - 16:00',
    status: 'Berlangsung',
    deskripsi: 'Kegiatan digunakan untuk membuat aplikasi mobile menggunakan Flutter dengan memperhatikan responsive layout dan pengelolaan state.',
    kapasitas: 35,
  ),
  RoomSession(
    namaRuang: 'Lab Multimedia',
    kegiatan: 'Pengolahan Gambar Digital',
    kategori: 'Multimedia',
    waktu: '15:00 - 17:00',
    status: 'Tersedia',
    deskripsi: 'Lab dapat digunakan untuk pengolahan gambar digital dan penyusunan materi visual.',
    kapasitas: 15,
  ),
  RoomSession(
    namaRuang: 'Lab Perakitan',
    kegiatan: 'Perakitan dan Pemeriksaan Komponen Komputer',
    kategori: 'Perangkat Keras',
    waktu: '07:30 - 09:30',
    status: 'Selesai',
    deskripsi: 'Kegiatan membahas cara memasang komponen komputer dan melakukan pemeriksaan sederhana terhadap perangkat.',
    kapasitas: 20,
  ),
];
