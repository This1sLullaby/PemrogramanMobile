import 'dart:async';

import 'models.dart';
import 'cart.dart';
import 'exceptions.dart';

class TokoService {
  final List<Produk> _databaseProduk = [];

  void tambahProduk(Produk produk) => _databaseProduk.add(produk);

  Future<Produk?> cariProduk(String nama) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      return _databaseProduk.firstWhere(
        (p) => p.nama.toLowerCase().contains(nama.toLowerCase()),
      );
    } catch (_) {
      throw ProdukTidakAda(nama);
    }
  }

  Future<void> prosesCheckout(Keranjang keranjang) async {
    await Future.delayed(const Duration(microseconds: 400));

    if (keranjang.items.isEmpty) {
      throw Exception('Keranjang kosong, tidak bisa checkout!');
    }

    print('Checkout berhasil!');
    print('Total Pembayaran: Rp${keranjang.totalHarga().toStringAsFixed(0)}');
  }
}
