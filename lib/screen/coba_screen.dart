import 'package:flutter/material.dart';

class CobaScreen extends StatelessWidget {
  const CobaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5), // Warna background yang mirip
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'AKSES BUKU ADMIN',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('DETAIL BUKU'),
            Text('SYNOPSIS :'),
            SizedBox(height: 10),
            Text('JUDUL & TAHUN TERBIT :'),
            SizedBox(height: 10),
            Text('INPUT BUKU :'),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol INPUT
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                ),
                child: Text(
                  'INPUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('STATUS KETERSEDIAAN :'),
            SizedBox(height: 10),
            Text('INPUT ANGGOTA :'),
            Text('NAMA :'),
            Text('NO. ANGGOTA :'),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi untuk tombol INPUT
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(24),
                ),
                child: Text(
                  'INPUT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                'BOOKWORK EDITION',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}