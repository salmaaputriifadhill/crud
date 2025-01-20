class Pengguna {
  String nama;
  String nomor;
  String email;
  String status;

  Pengguna(
      {required this.nama,
        required this.nomor,
        required this.email,
        required this.status});

  // Mengonversi Pengguna ke Map untuk penyimpanan
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'nomor': nomor,
      'email': email,
      'status': status,
    };
  }

  // Mengonversi Map ke Pengguna
  factory Pengguna.fromMap(Map<String, dynamic> map) {
    return Pengguna(
      nama: map['nama'],
      nomor: map['nomor'],
      email: map['email'],
      status: map['status'],
    );
  }
}