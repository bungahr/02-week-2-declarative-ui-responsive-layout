import 'package:flutter/material.dart';

import '../../models/room_session.dart';

class LabKomputerPage extends StatefulWidget {
  final VoidCallback onGantiTema;
  final bool modeGelap;

  const LabKomputerPage({
    super.key,
    required this.onGantiTema,
    required this.modeGelap,
  });

  @override
  State<LabKomputerPage> createState() => _LabKomputerPageState();
}

class _LabKomputerPageState extends State<LabKomputerPage> {
  String filterStatus = 'Semua';

  List<RoomSession> get dataYangDitampilkan {
    if (filterStatus == 'Semua') {
      return dataRuangan;
    }

  return dataRuangan
        .where ( (data) => data.status == filterStatus)
        .toList();
  }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar (
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('RuangKita'),
              Text(
                'Dashboard Lab Komputer',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Center(
              child: Text(
              'M02-2031',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: widget.onGantiTema,
          icon: Icon(
            widget.modeGelap
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined,
          ),
        ),
      ],
    ),
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, ukuran) {
          int jumlahKolom;

          if (ukuran.maxWidth < 600) {
          jumlahKolom = 1;
          } else if (ukuran.maxWidth < 840) {
          jumlahKolom = 2;
          } else {
          jumlahKolom = 3;
          }

          return _buatIsiHalaman(jumlahKolom);
        },
      ),
    ),
  );
}

Widget _buatIsiHalaman(int jumlahKolom) {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter (
        child: _buatHeader(),
      ),
      SliverToBoxAdapter (
        child: _buatFilter(),
      ),
      if (dataYangDitampilkan.isEmpty)
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text('Data tidak ditemukan'),
          ),
        )
      else
      SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final data = dataYangDitampilkan[index];

              return _buatCard(data);
            },
            childCount: dataYangDitampilkan.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: jumlahKolom,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 280,
          ),
        ),
      ),
    ],
  );
}

Widget _buatHeader() {
  return Padding(
    padding: const EdgeInsets. fromLTRB(16, 20, 16, 8),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon (
              Icons.computer_outlined,
              size: 42,
              color: Theme.of(context) .colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment. start,
                children: [
                  Text (
                    'Ketersediaan Lab Hari Ini',
                    style: Theme.of(context) .textTheme. titleLarge,
                  ),
const SizedBox (height: 6),
Text(
'${dataYangDitampilkan.length} data sedang ditampilkan',
maxLines: 2,
overflow: TextOverflow. ellipsis,

):

Widget _buatFilter() {
final daftarStatus = [
'Semua',
'Berlangsung',
'Akan Datang',
'Selesai',
'Tersedia',

1;

return Padding(
padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
child: Wrap(
spacing: 8,
runSpacing: 8,
children: daftarStatus.map((status) {
return ChoiceChip(
label: Text(status),
selected: filterStatus == status,
onSelected: (dipilih) {
setState(() {
filterStatus = status;
});

);
}). toList(),
Widget _buatCard(RoomSession data) {
return Card(
clipBehavior: Clip.antiAlias,
child: InkWell(
onTap: () {
_tampilkanDetail(data) ;

child: Stack(
children: [
Padding (
padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
child: Column(

crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox (height: 24),
Row (
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon (
Icons.meeting_room_outlined,
color: Theme.of(context) .colorScheme.primary,

const SizedBox(width: 8),
Expanded (
child: Text(

data.namaRuang,
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: Theme.of (context) .textTheme. titleMedium,
),

),

),
const SizedBox (height: 12),
Text(
data.kegiatan,
),

maxLines: 2,
overflow: TextOverflow.ellipsis,

const Spacer(),
Row (

children: [
const Icon (
Icons.schedule_outlined,
size: 18,

),
const SizedBox(width: 6),
Expanded (
child: Text(

data.waktu,
maxLines: 1,
overflow: TextOverflow. ellipsis,

),

),
Text('${data.kapasitas} kursi'),

1,

),
const SizedBox (height: 8),
Text (

data.deskripsi,
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: Theme.of(context) . textTheme.bodySmall,

),

1,

),

),

Positioned (
top: 12,
right: 12,
child: _buatBadgeStatus (data.status),

1,

);
Widget _buatBadgeStatus(String status) {
Color warna;

if (status == 'Berlangsung') {
warna = Colors.orange;
} else if (status == 'Akan Datang') {
warna = Colors.blue;
'Selesai')
warna = Colors.grey;
else {
warna = Colors.green;

else if (status :

}

return Container (
padding: const EdgeInsets. symmetric(
horizontal: 10,
vertical: 6,

),

decoration: BoxDecoration(
color: warna.withValues (alpha: 0.18),
borderRadius: BorderRadius.circular (20),
),
child: Text(

status,
style: TextStyle(
color: warna,
fontSize: 12,
fontWeight: FontWeight.bold,

),

);

void _tampilkanDetail(RoomSession data) {
showModalBottomSheet(

context: context,
isScrollControlled: true,
showDragHandle: true,
builder: (context) {
bool ingatkanSaya = false;
return StatefulBuilder (
builder: (context, ubahStateSheet) {
return SafeArea (

child: SingleChildScrollView(
padding: const EdgeInsets. fromLTRB(20, 8, 20, 24),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(

data.namaRuang,
style: Theme.of(context) .textTheme.headlineSmall,

const SizedBox (height: 16),
Text('Kegiatan: ${data.kegiatan} '),
const SizedBox (height: 8),
Text('Waktu: ${data.waktu} '),
const SizedBox(height: 8),
Text('Status: ${data. status} '),
const SizedBox(height: 8),
Text('Kapasitas: ${data. kapasitas} orang'),

),
const SizedBox(height: 16),
Text(data.deskripsi),
const SizedBox (height: 16),
SwitchListTile(
contentPadding: EdgeInsets.zero,
title: const Text('Ingatkan saya'),
value: ingatkanSaya,
onChanged: (nilaiBaru) {
ubahStateSheet(() {
ingatkanSaya = nilaiBaru;

,١

1.

):

);

},

);
}
}
