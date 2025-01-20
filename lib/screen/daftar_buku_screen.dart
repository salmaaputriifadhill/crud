import 'package:apk_perpus/screen/akses_anggota_screen.dart';
import 'package:apk_perpus/screen/pilih_buku_screen.dart'; // Pastikan file PilihBukuScreen sudah dibuat
import 'package:apk_perpus/service/buku_service.dart';
import 'package:flutter/material.dart';

import '../modells/buku.dart';
class DaftarBukuScreen extends StatelessWidget {
  final BukuService bukuService = BukuService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Buku Perpustakaan'),
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
      ),
      body: ListView.builder(
        itemCount: bukuService.getDaftarBuku().length,
        itemBuilder: (context, index) {
          Buku buku = bukuService.getDaftarBuku()[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Text(
                buku.judul,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Penulis: ${buku.penulis}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Tahun Terbit: ${buku.tahunTerbit}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Menavigasi ke halaman detail buku saat item ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AksesAnggotaScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman Pilih Buku
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PilihBukuScreen(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
        child: Icon(Icons.add),
      ),
    );
  }
}