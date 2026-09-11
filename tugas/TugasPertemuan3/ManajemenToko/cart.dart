import 'models.dart';
import 'exceptions.dart';

class Keranjang {
  final List<Produk> items = [];

  void tambah(Produk produk) {
    if (produk.Stok <= 0) throw StokHabisException(produk.nama);
    items.add(produk);
    produk.Stok--;
  }

  void hapus(Produk produk) {
    if (items.remove(produk)) {
      produk.Stok++;
    }
  }

  double totalHarga() => items.fold(0, (total, item) => total + item.harga);
}
