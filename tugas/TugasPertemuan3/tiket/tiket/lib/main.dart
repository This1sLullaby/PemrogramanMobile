import 'dart:math';

import 'package:flutter/material.dart';

//1. exception

class TiketHabisException implements Exception {
  final String nama;
  TiketHabisException(this.nama);
  @override
  String toString() => 'Maaf, tiket "$nama" sudah habis!';
}

//abstract, Mixin, subclass

abstract class Tiket {
  final String nama;
  final double harga;
  final int stok;
  Tiket({required this.nama, required this.harga, required this.stok});
  String deskripsi();
}

mixin BisaDiskon on Tiket {
  double hitungHargaDiskon(double persen) => harga * (1 - persen / 100);
}

class TiketEkonomi extends Tiket with BisaDiskon {
  TiketEkonomi({required String nama, required double harga, required int stok})
    : super(nama: nama, harga: harga, stok: stok);
  @override
  String deskripsi() => 'Fasilitas: Kursi standar + ac';
}

class TiketVIP extends Tiket {
  final List<String> benefit;
  TiketVIP({
    required String nama,
    required double harga,
    required int stok,
    required this.benefit,
  }) : super(nama: nama, harga: harga, stok: stok);
  @override
  String deskripsi() => 'Fasilitas: ${benefit.join(", ")}';
}

//asyc service
Future<List<Tiket>> ambilDaftarTiket() async {
  await Future.delayed(const Duration(seconds: 4));
  if (Random().nextInt(5) == 0) throw Exception('Koneksi server terputus');
  return [
    TiketEkonomi(nama: 'Ekonomi Jakarta-Bandung', harga: 150000, stok: 2),
    TiketEkonomi(nama: 'Ekonomi Jakarta-Surabaya', harga: 350000, stok: 1),
    TiketVIP(
      nama: 'VIP Jakarta-Bali',
      harga: 2500000,
      stok: 5,
      benefit: ['Lounge', 'Meal'],
    ),
  ];
}

Future<String> pesanTiket(Tiket tiket) async {
  await Future.delayed(const Duration(seconds: 4));
  if (Random().nextInt(10) < 2) throw TiketHabisException(tiket.nama);
  return 'Tiket "${tiket.nama}" berhasil dipesan!';
}
//main

// 4. MAIN APP
void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
);

// 5. HOME PAGE: StatefulWidget untuk menjaga state Future & Stream
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future didefinisikan di sini agar tidak di-fetch ulang saat Stream rebuild
  final Future<List<Tiket>> _futureTiket = ambilDaftarTiket();

  // Stream countdown non-looping (60 detik ke 0)
  Stream<int> _countdown() async* {
    for (int i = 60; i >= 0; i--) {
      yield i;
      if (i > 0) await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemesanan Tiket'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<int>(
        stream: _countdown(),
        builder: (c, snapPromo) {
          int sisa = snapPromo.data ?? 60;
          bool isPromoAktif = sisa > 0;

          return Column(
            children: [
              // Banner Promo
              Container(
                color: isPromoAktif
                    ? Colors.orange.shade100
                    : Colors.grey.shade200,
                width: double.infinity,
                padding: const EdgeInsets.all(50),
                child: Text(
                  isPromoAktif
                      ? 'Promo berakhir dalam: $sisa detik'
                      : 'Promo telah berakhir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPromoAktif
                        ? Colors.orange.shade800
                        : Colors.grey.shade800,
                  ),
                ),
              ),
              // FutureBuilder Data Tiket
              Expanded(
                child: FutureBuilder<List<Tiket>>(
                  future: _futureTiket,
                  builder: (c, snapData) {
                    if (snapData.connectionState == ConnectionState.waiting)
                      return const Center(child: CircularProgressIndicator());
                    if (snapData.hasError)
                      return Center(q
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 48,
                            ),
                            const SizedBox(height: 8),
                            Text('Error: ${snapData.error}'),
                            ElevatedButton(
                              onPressed: () => Navigator.pushReplacement(
                                c,
                                MaterialPageRoute(
                                  builder: (_) => const HomePage(),
                                ),
                              ),
                              child: const Text('Coba Lagi'),
                            ),
                          ],
                        ),
                      );
                    final data = snapData.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (c, i) {
                        final t = data[i];
                        // Harga kembali normal jika promo tidak aktif
                        final hargaTampil = (isPromoAktif && t is TiketEkonomi)
                            ? t.hitungHargaDiskon(10)
                            : t.harga;
                        return Card(
                          margin: const EdgeInsets.all(8),
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: t is TiketVIP
                                  ? Colors.amber
                                  : Colors.indigo,
                              child: Icon(
                                t is TiketVIP
                                    ? Icons.star
                                    : Icons.airline_seat_recline_normal,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              t.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              t.deskripsi(),
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Rp ${hargaTampil.toStringAsFixed(0)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                                ),
                                if (isPromoAktif && t is TiketEkonomi)
                                  const Text(
                                    'Diskon 10%',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                    ),
                                  ),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (_) => BookingPage(tiket: t),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// 6. BOOKING PAGE: try/catch/finally
class BookingPage extends StatefulWidget {
  final Tiket tiket;
  const BookingPage({super.key, required this.tiket});
  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? msg;
  bool loading = false;

  Future<void> _proses() async {
    setState(() {
      loading = true;
      msg = null;
    });
    try {
      msg = await pesanTiket(widget.tiket);
    } on TiketHabisException catch (e) {
      msg = e.toString();
    } catch (e) {
      msg = 'Error tidak dikenal: $e';
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = widget.tiket;
    final isSuccess = msg != null && msg!.contains('berhasil');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              t.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(t.deskripsi()),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loading ? null : _proses,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Bayar Sekarang',
                      style: TextStyle(fontSize: 16),
                    ),
            ),
            const SizedBox(height: 16),
            if (msg != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSuccess ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isSuccess ? Icons.check_circle : Icons.error,
                      color: isSuccess ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        msg!,
                        style: TextStyle(
                          color: isSuccess
                              ? Colors.green.shade800
                              : Colors.red.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
