import 'package:flutter/material.dart';

import 'modul02/studi_kasus/lab_komputer.dart';

void main() {
  runApp(const RuangKitaApp());
}

class RuangKitaApp extends StatefulWidget {
  const RuangKitaApp({super.key});

  @override
  State<RuangKitaApp> createState() => _RuangKitaAppState();
}

class _RuangKitaAppState extends State<RuangKitaApp> {
  ThemeMode modeTema = ThemeMode.light;

  void gantiTema() {
    setState(() {
      if (modeTema == ThemeMode.light) {
        modeTema = ThemeMode.dark;
      } else {
        modeTema = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RuangKita',
      themeMode: modeTema,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: LabKomputerPage(
        modeGelap: modeTema == ThemeMode.dark,
        onGantiTema: gantiTema,
      ),
    );
  }
}
