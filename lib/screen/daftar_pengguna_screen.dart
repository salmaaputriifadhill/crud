import 'package:flutter/material.dart';
import '../modells/pengguna.dart';
import '../service/pengguna_service.dart';

class DaftarPenggunaScreen extends StatefulWidget {
  @override
  _DaftarPenggunaScreenState createState() => _DaftarPenggunaScreenState();
}

class _DaftarPenggunaScreenState extends State<DaftarPenggunaScreen> {
  final ListAnggotaService listAnggotaService = ListAnggotaService();

  void _tambahPengguna() {
    String namaBaru = '';
    String nomorBaru = '';
    String emailBaru = '';
    String statusBaru = 'Anggota'; // Default status

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Anggota Baru'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Nama'),
                    onChanged: (value) {
                      namaBaru = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Nomor'),
                    onChanged: (value) {
                      nomorBaru = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (value) {
                      emailBaru = value;
                    },
                  ),
                  DropdownButton<String>(
                    value: statusBaru,
                    items: ['Anggota', 'Admin']
                        .map((status) => DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          statusBaru = value;
                        });
                      }
                    },
                  ),
                ],
              );
            },
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
                if (namaBaru.isNotEmpty &&
                    nomorBaru.isNotEmpty &&
                    emailBaru.isNotEmpty) {
                  setState(() {
                    listAnggotaService.tambahPengguna(
                      Pengguna(
                        nama: namaBaru,
                        nomor: nomorBaru,
                        email: emailBaru,
                        status: statusBaru,
                      ),
                    );
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _editPengguna(Pengguna pengguna) {
    String namaBaru = pengguna.nama;
    String nomorBaru = pengguna.nomor;
    String emailBaru = pengguna.email;
    String statusBaru = pengguna.status;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Anggota'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Nama'),
                    controller: TextEditingController(text: namaBaru),
                    onChanged: (value) {
                      namaBaru = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Nomor'),
                    controller: TextEditingController(text: nomorBaru),
                    onChanged: (value) {
                      nomorBaru = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    controller: TextEditingController(text: emailBaru),
                    onChanged: (value) {
                      emailBaru = value;
                    },
                  ),
                  DropdownButton<String>(
                    value: statusBaru,
                    items: ['Anggota', 'Admin']
                        .map((status) => DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          statusBaru = value;
                        });
                      }
                    },
                  ),
                ],
              );
            },
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
                if (namaBaru.isNotEmpty &&
                    nomorBaru.isNotEmpty &&
                    emailBaru.isNotEmpty) {
                  setState(() {
                    listAnggotaService.updatePengguna(
                      pengguna.nomor,
                      Pengguna(
                        nama: namaBaru,
                        nomor: nomorBaru,
                        email: emailBaru,
                        status: statusBaru,
                      ),
                    );
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _hapusPengguna(String nomor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Anggota'),
          content: Text('Apakah Anda yakin ingin menghapus anggota ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  listAnggotaService.hapusPengguna(nomor);
                });
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5), // Warna latar belakang
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
        backgroundColor: Color.fromARGB(255, 168, 126, 10), // Warna AppBar
      ),
      body: ListView.builder(
        itemCount: listAnggotaService.getDaftarPengguna().length,
        itemBuilder: (context, index) {
          Pengguna pengguna = listAnggotaService.getDaftarPengguna()[index];
          return Card(
            color: Colors.grey[200], // Warna latar belakang Card
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              title: Text(
                pengguna.nama,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nomor: ${pengguna.nomor}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Email: ${pengguna.email}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    'Status: ${pengguna.status}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit,
                        color: Color.fromARGB(
                            255, 168, 126, 10)), // Warna ikon edit
                    onPressed: () => _editPengguna(pengguna),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete,
                        color: Colors.red), // Warna ikon hapus tetap merah
                    onPressed: () => _hapusPengguna(pengguna.nomor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahPengguna,
        backgroundColor:
        Color.fromARGB(255, 168, 126, 10), // Warna tombol tambah
        child: Icon(Icons.add, color: Colors.white), // Warna ikon tambah putih
      ),
    );
  }
}