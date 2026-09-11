abstract class Produk {
  final String id, nama;
  double harga;
  int Stok;

  Produk(this.id, this.nama, this.harga, this.Stok);

  String deskripsi();
  double hitungHargaDiskon(double persen);
}

mixin BisaDiskon on Produk {
  double get harga;

  bool validasiDiskon(double persen) => persen >= 0 && persen <= 100;

  double hitungHargaDiskon(double persen) {
    if (!validasiDiskon(persen)) throw ArgumentError('Diskon harus 0 - 100%');
    return harga - (harga * persen / 100);
  }
}

class ProdukDigital extends Produk with BisaDiskon {
  final double ukuranMB;
  final String formatFile;

  ProdukDigital(
    super.id,
    super.nama,
    super.harga,
    super.stok,
    this.ukuranMB,
    this.formatFile,
  );

  @override
  String deskripsi() =>
      '$nama [$formatFile | ${ukuranMB}MB] - Rp${harga.toStringAsFixed(0)}';
}

class ProdukFisik extends Produk with BisaDiskon {
  final int beratGram;
  final String dimensi;

  ProdukFisik(
    super.id,
    super.nama,
    super.harga,
    super.Stok,
    this.beratGram,
    this.dimensi,
  );

  @override
  String deskripsi() =>
      '$nama [$beratGram gr | $dimensi] - Rp${harga.toStringAsFixed(0)}';
}
