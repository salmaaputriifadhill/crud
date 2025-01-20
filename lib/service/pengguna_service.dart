import 'package:get_storage/get_storage.dart';
import '../modells/pengguna.dart';

class ListAnggotaService {
  final GetStorage storage = GetStorage();
  final String storageKey = 'daftarPengguna';

  ListAnggotaService() {
    // Inisialisasi GetStorage
    GetStorage.init();
  }

  // Menambahkan pengguna baru
  void tambahPengguna(Pengguna pengguna) {
    List<Pengguna> daftarPengguna = getDaftarPengguna();
    daftarPengguna.add(pengguna);
    storage.write(storageKey,
        daftarPengguna.map((pengguna) => pengguna.toMap()).toList());
  }

  // Mengambil semua pengguna
  List<Pengguna> getDaftarPengguna() {
    List<dynamic> storedPengguna = storage.read(storageKey) ?? [];
    return storedPengguna
        .map((penggunaMap) => Pengguna.fromMap(penggunaMap))
        .toList();
  }

  // Memperbarui pengguna berdasarkan nomor
  void updatePengguna(String nomor, Pengguna penggunaBaru) {
    List<Pengguna> daftarPengguna = getDaftarPengguna();
    for (int i = 0; i < daftarPengguna.length; i++) {
      if (daftarPengguna[i].nomor == nomor) {
        daftarPengguna[i] = penggunaBaru;
        break;
      }
    }
    storage.write(storageKey,
        daftarPengguna.map((pengguna) => pengguna.toMap()).toList());
  }

  // Menghapus pengguna berdasarkan nomor
  void hapusPengguna(String nomor) {
    List<Pengguna> daftarPengguna = getDaftarPengguna();
    daftarPengguna.removeWhere((pengguna) => pengguna.nomor == nomor);
    storage.write(storageKey,
        daftarPengguna.map((pengguna) => pengguna.toMap()).toList());
  }
}