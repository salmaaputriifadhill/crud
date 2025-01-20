import 'package:apk_perpus/screen/akses_admin_screen.dart';
import 'package:apk_perpus/screen/akses_anggota_screen.dart';
import 'package:apk_perpus/screen/daftar_buku2_screen.dart';
import 'package:apk_perpus/screen/daftar_buku_screen.dart';
import 'package:apk_perpus/screen/daftar_pengguna_screen.dart';
import 'package:apk_perpus/screen/login_screen.dart';
import 'package:apk_perpus/screen/pilih_buku_screen.dart';
import 'package:apk_perpus/screen/riwayat_pinjaman_screen.dart';
import 'package:apk_perpus/screen/riwayat_peminjaman_anggota_screen.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}