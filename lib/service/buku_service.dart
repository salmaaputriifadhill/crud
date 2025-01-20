import 'package:get_storage/get_storage.dart';
import '../modells/buku.dart';


class BukuService {
  final GetStorage storage = GetStorage();
  final String storageKey = 'daftarBuku';

  BukuService() {
    // Inisialisasi GetStorage
    GetStorage.init();
  }

  // Menambahkan buku baru
  void tambahBuku(Buku buku) {
    List<Buku> daftarBuku = getDaftarBuku();
    daftarBuku.add(buku);
    storage.write(storageKey, daftarBuku.map((buku) => buku.toMap()).toList());
  }

  // Mengambil semua buku
  List<Buku> getDaftarBuku() {
    List<dynamic> storedBuku = storage.read(storageKey) ?? [];
    return storedBuku.map((bukuMap) => Buku.fromMap(bukuMap)).toList();
  }

  // Memperbarui buku berdasarkan judul
  void updateBuku(String judul, Buku bukuBaru) {
    List<Buku> daftarBuku = getDaftarBuku();
    for (int i = 0; i < daftarBuku.length; i++) {
      if (daftarBuku[i].judul == judul) {
        daftarBuku[i] = bukuBaru;
        break;
      }
    }
    storage.write(storageKey, daftarBuku.map((buku) => buku.toMap()).toList());
  }

  // Menghapus buku berdasarkan judul
  void hapusBuku(String judul) {
    List<Buku> daftarBuku = getDaftarBuku();
    daftarBuku.removeWhere((buku) => buku.judul == judul);
    storage.write(storageKey, daftarBuku.map((buku) => buku.toMap()).toList());
  }
}