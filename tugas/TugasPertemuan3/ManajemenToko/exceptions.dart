class StokHabisException implements Exception {
  final String namaProduk;
  StokHabisException(this.namaProduk);

  @override
  String toString() => 'Stok $namaProduk habis!';
}

class ProdukTidakAda implements Exception {
  final String namaProduk;
  ProdukTidakAda(this.namaProduk);

  @override
  String toString() => 'Produk "$namaProduk" Tidak ditemukan!';
}
