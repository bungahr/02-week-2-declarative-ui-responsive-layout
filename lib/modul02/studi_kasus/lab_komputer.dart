import 'package:flutter/material.dart';

import '../../models/room_session.dart';

class LabKomputerPage extends StatefulWidget {
  final VoidCallback onThemeChanged;
  final bool isDarkMode;

  const LabKomputerPage({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  @override
  State<LabKomputerPage> createState() => _LabKomputerPageState();
}

class _LabKomputerPageState extends State<LabKomputerPage> {
  String selectedStatus = 'Semua';

  final List<String> statusList = [
    'Semua',
    'Berlangsung',
    'Akan Datang',
    'Selesai',
    'Tersedia',
  ];

  // Data yang ditampilkan berdasarkan filter
  List<RoomSession> get filteredRooms {
    if (selectedStatus == 'Semua') {
      return dataRuangan;
    }

    return dataRuangan
        .where((ruangan) => ruangan.status == selectedStatus)
        .toList();
  }

  // Menentukan jumlah kolom berdasarkan lebar layar
  int getColumnCount(double width) {
    if (width < 600) {
      return 1;
    } else if (width < 840) {
      return 2;
    } else {
      return 3;
    }
  }

  // Warna badge berdasarkan status
  Color getStatusColor(String status) {
    if (status == 'Berlangsung') {
      return Colors.orange;
    } else if (status == 'Akan Datang') {
      return Colors.blue;
    } else if (status == 'Selesai') {
      return Colors.grey;
    } else {
      return Colors.green;
    }
  }

  // Menampilkan detail ruangan
  void showRoomDetail(RoomSession ruangan) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        bool ingatkanSaya = false;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      ruangan.namaRuang,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Kegiatan',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(ruangan.kegiatan),

                    const SizedBox(height: 12),

                    Text(
                      'Waktu',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(ruangan.waktu),

                    const SizedBox(height: 12),

                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(ruangan.status),

                    const SizedBox(height: 12),

                    Text(
                      'Kapasitas',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text('${ruangan.kapasitas} orang'),

                    const SizedBox(height: 12),

                    Text(
                      'Deskripsi',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(ruangan.deskripsi),

                    const SizedBox(height: 12),

                    // Kontrol lokal pada bottom sheet
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Ingatkan saya'),
                      value: ingatkanSaya,
                      onChanged: (value) {
                        setModalState(() {
                          ingatkanSaya = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RuangKita'),
            Text('Dashboard Lab Komputer', style: TextStyle(fontSize: 14)),
          ],
        ),

        // Tombol Light / Dark Mode
        actions: [
          IconButton(
            onPressed: widget.onThemeChanged,
            tooltip: widget.isDarkMode
                ? 'Gunakan Light Mode'
                : 'Gunakan Dark Mode',
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),

          const SizedBox(width: 4),

          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Text(
                'M02-2031',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Filter status
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: statusList.map((status) {
                  return ChoiceChip(
                    label: Text(status),
                    selected: selectedStatus == status,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selectedStatus = status;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),
          ),

          // Daftar card
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final columnCount = getColumnCount(constraints.maxWidth);

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columnCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,

                        // Tinggi card dibuat lebih aman
                        // untuk teks yang panjang.
                        childAspectRatio: 1.5,
                      ),
                      itemCount: filteredRooms.length,
                      itemBuilder: (context, index) {
                        final ruangan = filteredRooms[index];

                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              showRoomDetail(ruangan);
                            },
                            child: Stack(
                              children: [
                                // Isi card
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Icon lab
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.computer,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                        ),
                                      ),

                                      const SizedBox(width: 12),

                                      // Isi teks
                                      Expanded(
                                        child: Padding(
                                          // Ruang kosong di kanan
                                          // untuk badge status.
                                          padding: const EdgeInsets.only(
                                            right: 90,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ruangan.namaRuang,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),

                                              const SizedBox(height: 6),

                                              Text(
                                                ruangan.kegiatan,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),

                                              const SizedBox(height: 8),

                                              // Waktu
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      ruangan.waktu,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 6),

                                              // Kapasitas
                                              Text(
                                                'Kapasitas '
                                                '${ruangan.kapasitas} orang',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Badge status
                                Positioned(
                                  top: 12,
                                  right: 12,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxWidth: 90,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: getStatusColor(ruangan.status),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        ruangan.status,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
