class Buku {
  String judul;
  String penulis;
  int tahunTerbit;

  Buku({required this.judul, required this.penulis, required this.tahunTerbit});

  // Mengonversi Buku ke Map untuk penyimpanan
  Map<String, dynamic> toMap() {
    return {
      'judul': judul,
      'penulis': penulis,
      'tahunTerbit': tahunTerbit,
    };
  }

  // Mengonversi Map ke Buku
  factory Buku.fromMap(Map<String, dynamic> map) {
    return Buku(
      judul: map['judul'],
      penulis: map['penulis'],
      tahunTerbit: map['tahunTerbit'],
    );
  }
}