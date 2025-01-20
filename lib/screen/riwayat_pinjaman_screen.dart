import 'package:flutter/material.dart';

class RiwayatPeminjamanScreen extends StatefulWidget {
  const RiwayatPeminjamanScreen({super.key});

  @override
  _RiwayatPeminjamanScreenState createState() => _RiwayatPeminjamanScreenState();
}

class _RiwayatPeminjamanScreenState extends State<RiwayatPeminjamanScreen> {
  List<Map<String, String>> riwayatPeminjaman = [];

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _tanggalPinjamController = TextEditingController();
  final TextEditingController _tanggalKembaliController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  int? _editingIndex;

  void _tambahAtauEditData() {
    if (_judulController.text.isNotEmpty &&
        _tanggalPinjamController.text.isNotEmpty &&
        _tanggalKembaliController.text.isNotEmpty &&
        _statusController.text.isNotEmpty) {
      setState(() {
        final data = {
          'judul': _judulController.text,
          'tanggalPinjam': _tanggalPinjamController.text,
          'tanggalKembali': _tanggalKembaliController.text,
          'status': _statusController.text,
        };

        if (_editingIndex == null) {
          // Tambah data baru
          riwayatPeminjaman.add(data);
        } else {
          // Edit data yang ada
          riwayatPeminjaman[_editingIndex!] = data;
          _editingIndex = null;
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_editingIndex == null
              ? 'Data peminjaman berhasil ditambahkan'
              : 'Data peminjaman berhasil diperbarui'),
        ),
      );

      _judulController.clear();
      _tanggalPinjamController.clear();
      _tanggalKembaliController.clear();
      _statusController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi')),
      );
    }
  }

  void _isiFormUntukEdit(int index) {
    setState(() {
      _editingIndex = index;
      final data = riwayatPeminjaman[index];
      _judulController.text = data['judul'] ?? '';
      _tanggalPinjamController.text = data['tanggalPinjam'] ?? '';
      _tanggalKembaliController.text = data['tanggalKembali'] ?? '';
      _statusController.text = data['status'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0EDE5),
      appBar: AppBar(
        title: const Text("Riwayat Peminjaman Buku"),
        backgroundColor: const Color.fromARGB(255, 168, 126, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Input Data Peminjaman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul Buku'),
            ),
            TextField(
              controller: _tanggalPinjamController,
              decoration: const InputDecoration(labelText: 'Tanggal Pinjam (DD/MM/YYYY)'),
            ),
            TextField(
              controller: _tanggalKembaliController,
              decoration: const InputDecoration(labelText: 'Tanggal Kembali (DD/MM/YYYY)'),
            ),
            TextField(
              controller: _statusController,
              decoration: const InputDecoration(labelText: 'Status Buku'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _tambahAtauEditData,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 168, 126, 10),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                _editingIndex == null ? 'Tambah Data' : 'Simpan Perubahan',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Riwayat Peminjaman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: riwayatPeminjaman.length,
                itemBuilder: (context, index) {
                  final data = riwayatPeminjaman[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(data['judul'] ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal Pinjam: ${data['tanggalPinjam']}'),
                          Text('Tanggal Kembali: ${data['tanggalKembali']}'),
                          Text('Status: ${data['status']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _isiFormUntukEdit(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
