import 'package:apk_perpus/screen/akses_admin_screen.dart';
import 'package:apk_perpus/screen/daftar_buku_screen.dart';
import 'package:apk_perpus/screen/profil_screen.dart';
import 'riwayat_peminjaman_anggota_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nama = "MENU";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
        backgroundColor: Color.fromARGB(255, 168, 126, 10), // Warna AppBar berubah
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  nama = "MENU";
                });
              },
              icon: Icon(Icons.add_a_photo)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuItem(
                Icons.book, "Pilih Buku", context, DaftarBukuScreen()),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.history, "Riwayat Buku", context, RiwayatPeminjamanAnggotaScreen()),
            const SizedBox(height: 16),
            _buildMenuItem(Icons.person, "Profil", context, ProfilScreen()),
            const SizedBox(height: 16),
            _buildMenuItem(
                Icons.menu_book, "Akses Buku", context, null), // Nonaktifkan navigasi ke AksesAdminScreen
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      IconData icon, String label, BuildContext context, Widget? halaman) {
    return GestureDetector(
      onTap: halaman != null
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => halaman),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label diakses')),
        );
      }
          : null, // Nonaktifkan aksi jika halaman null
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 168, 126, 10).withOpacity(0.2), // Warna latar belakang item menu
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Icon(icon, size: 48, color: Color.fromARGB(255, 168, 126, 10)), // Warna icon berubah
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 168, 126, 10), // Warna teks berubah
              ),
            ),
          ],
        ),
      ),
    );
  }
}
