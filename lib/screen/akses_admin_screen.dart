import "package:apk_perpus/screen/daftar_buku2_screen.dart";
import 'package:apk_perpus/screen/daftar_pengguna_screen.dart';
import 'package:apk_perpus/screen/riwayat_pinjaman_screen.dart';
import 'package:flutter/material.dart';

class AksesAdminScreen extends StatefulWidget {
  const AksesAdminScreen({Key? key}) : super(key: key);

  @override
  _AksesAdminScreenState createState() => _AksesAdminScreenState();
}

class _AksesAdminScreenState extends State<AksesAdminScreen> {
  String statusKetersediaan = "Tersedia"; // Default status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EDE5),
      appBar: AppBar(
        title: const Text("Akses Buku Admin"),
        backgroundColor: const Color.fromARGB(255, 168, 126, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Buku
            const Text(
              'Judul Buku: Laut Bercerita',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Karya
            const Text(
              'Karya : Leila S. Chudori',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),

            // Tahun Terbit
            const Text(
              'Tahun Terbit: 2017',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Sinopsis
            const Text(
              'Sinopsis : Buku ini menggambarkan kekejaman rezim Orde Baru terhadap aktivis mahasiswa dan mengangkat tema kehilangan, perjuangan dan pengkhianatan. Cerita ini terbagi menjadi dua sudut pandang berbeda, bagian pertama melalui mata Biru laut dan bagian kedua diceritakan dari perspektif Asmara Jati.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Status Ketersediaan
            Row(
              children: [
                const Text(
                  'Status Ketersediaan: ',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: statusKetersediaan,
                  items: <String>['Tersedia', 'Tidak Tersedia']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      statusKetersediaan = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tombol Tambah Anggota, Tambah Buku, dan Riwayat Peminjaman Sejajar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Tambah Anggota
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika login di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaftarPenggunaScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tambah anggota baru')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 10, 126, 168),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                  ),
                  child: const Text(
                    'Tambah Anggota',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                // Tombol Tambah Buku
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika login di sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaftarBuku2Screen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tambah buku baru')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 126, 168, 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                  ),
                  child: const Text(
                    'Tambah Buku',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tombol Riwayat Peminjaman
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  RiwayatPeminjamanScreen()),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menampilkan riwayat peminjaman')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 10, 44, 168),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Riwayat Peminjaman',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
