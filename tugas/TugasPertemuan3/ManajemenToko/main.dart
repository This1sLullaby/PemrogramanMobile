import 'dart:async';

import 'models.dart';
import 'cart.dart';
import 'services.dart';
import 'exceptions.dart';

void main() async {
  print("=== MANAJEMEN TOKO ONLINE ===");

  final toko = TokoService();
  toko.tambahProduk(
    ProdukDigital('D001', 'E-Book Flutter', 100000, 5, 15, 'pdf'),
  );
  toko.tambahProduk(
    ProdukFisik('F001', 'Keyboard', 750000, 3, 800, '45x15x4 cm'),
  );

  final keranjang = Keranjang();

  try {
    print("1. Mencarin produk 'Flutter'...");
    final produk = await toko.cariProduk('Flutter');
    print("   Ditemukan: ${produk!.deskripsi()}\n");

    print("2. Menambah ke keranjang ... ");
    keranjang.tambah(produk);
    print("    Item di keranjang: ${keranjang.items.length}\n");

    print("3. Melakukan checkout...");
    await toko.prosesCheckout(keranjang);
    print(" ");

    print("4. Simulasi diskon 10% untuk E-Book: ");
    print("    Harga normal: ${produk.harga.toStringAsFixed(0)}");
    print(
      "    Harga diskon: ${produk.hitungHargaDiskon(10).toStringAsFixed(0)}\n",
    );

    print("5. Menguji error: mencari produk yang tidak ada...");
    await toko.cariProduk("Smartphone");
  } on ProdukTidakAda catch (e) {
    print("gagal: $e");
  } on StokHabisException catch (e) {
    print("gagal: $e");
  } catch (e) {
    print("Terjadi kesalahan tidak terduga!: $e");
  }

  print("\n=== PROGRAM SELESAI ===\n");
}
