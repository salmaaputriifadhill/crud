import 'package:flutter/material.dart';

import '../modells/buku.dart';
import '../service/buku_service.dart';

class DaftarBuku2Screen extends StatefulWidget {
  @override
  _DaftarBukuScreenState createState() => _DaftarBukuScreenState();
}

class _DaftarBukuScreenState extends State<DaftarBuku2Screen> {
  final BukuService bukuService = BukuService();

  void _tambahBuku() {
    String judulBaru = '';
    String penulisBaru = '';
    String tahunTerbitBaru = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Buku Baru'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Judul'),
                onChanged: (value) {
                  judulBaru = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Penulis'),
                onChanged: (value) {
                  penulisBaru = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Tahun Terbit'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tahunTerbitBaru = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                if (judulBaru.isNotEmpty &&
                    penulisBaru.isNotEmpty &&
                    tahunTerbitBaru.isNotEmpty &&
                    int.tryParse(tahunTerbitBaru) != null) {
                  setState(() {
                    bukuService.tambahBuku(Buku(
                      judul: judulBaru,
                      penulis: penulisBaru,
                      tahunTerbit: int.parse(tahunTerbitBaru),
                    ));
                  });
                  Navigator.of(context).pop();
                } else {
                  // Umpan balik ke pengguna
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Mohon isi semua data dengan benar!')),
                  );
                }
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahBuku,
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
        child: Icon(Icons.add),
      ),
    );
  }
}