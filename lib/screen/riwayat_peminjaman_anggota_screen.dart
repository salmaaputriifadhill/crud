import 'package:flutter/material.dart';

class RiwayatPeminjamanAnggotaScreen extends StatelessWidget {
  const RiwayatPeminjamanAnggotaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5),
      appBar: AppBar(
        title: Text("Riwayat Peminjaman Anggota"),
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riwayat Peminjaman Buku',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),

            // Tabel Riwayat Peminjaman
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Judul Buku')),
                  DataColumn(label: Text('Tanggal Pinjam')),
                  DataColumn(label: Text('Tanggal Kembali')),
                  DataColumn(label: Text('Status')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Buku A')),
                      DataCell(Text('01/01/2024')),
                      DataCell(Text('08/01/2024')),
                      DataCell(Text('Dikembalikan')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Buku B')),
                      DataCell(Text('05/01/2024')),
                      DataCell(Text('12/01/2024')),
                      DataCell(Text('Dipinjam')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Buku C')),
                      DataCell(Text('10/12/2023')),
                      DataCell(Text('17/12/2023')),
                      DataCell(Text('Dikembalikan')),
                    ],
                  ),
                  // Tambahkan lebih banyak DataRow di sini sesuai kebutuhan
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
