import 'package:flutter/material.dart';

class AksesAnggotaScreen extends StatelessWidget {
  const AksesAnggotaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5),
      appBar: AppBar(
        title: Text("DETAIL BUKU"),
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DETAIL BUKU

            // Judul Buku
            const Text(
              'Judul Buku : Laut Bercerita',
              style: TextStyle(fontSize: 20),
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
              'Tahun Terbit : 2017',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Sinopsis
            const Text(
              'Sinopsis : Buku ini menggambarkan kekejaman rezim Orde Baru terhadap aktivis mahasiswa dan mengangkat tema kehilangan, perjuangan dan pengkhianatan. Cerita ini terbagi menjadi dua sudut pandang berbeda, bagian pertama melalui mata Biru laut dan bagian kedua diceritakan dari perspektif Asmara Jati.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Tombol Hasil Pencarian dan Favorit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan aksi untuk hasil pencarian di sini
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Mengakses hasil pencarian...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 168, 126, 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: const Text(
                    'Hasil Pencarian',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Tambahkan aksi untuk menambahkan ke favorit
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Menambahkan ke favorit...')),
                    );
                  },
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  tooltip: 'Favorit',
                ),
              ],
            ),

            // Kalimat tentang ketersediaan buku
            const SizedBox(height: 16),
            const Text(
              'Status Buku : ...', // Ganti dengan 'Tidak Tersedia' jika perlu
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}