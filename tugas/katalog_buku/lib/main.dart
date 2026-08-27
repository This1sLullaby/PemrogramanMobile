import 'package:flutter/material.dart';

void main() {
  runApp(const PerpustakaanApp());
}

// ================= DATA BUKU =================

final List<Map<String, dynamic>> buku = [
  {
    'judul': 'Belajar Dart',
    'pengarang': 'Andi',
    'tahun': 2023,
    'rating': 4.8,
    'tersedia': true,
    'genre': 'Pemrograman',
    'catatan': null,
  },
  {
    'judul': 'Belajar Flutter',
    'pengarang': 'Budi',
    'tahun': 2024,
    'rating': 4.5,
    'tersedia': true,
    'genre': 'Pemrograman',
    'catatan': 'Akan dikembalikan besok',
  },
  {
    'judul': 'Algoritma Dasar',
    'pengarang': 'Citra',
    'tahun': 2022,
    'rating': 4.2,
    'tersedia': false,
    'genre': 'Teknologi',
    'catatan': 'Sedang dipinjam',
  },
  {
    'judul': 'Basis Data',
    'pengarang': 'Deni',
    'tahun': 2021,
    'rating': 3.8,
    'tersedia': true,
    'genre': 'Database',
    'catatan': null,
  },
  {
    'judul': 'Dunia Internet',
    'pengarang': 'Eka',
    'tahun': 2023,
    'rating': 3.6,
    'tersedia': false,
    'genre': 'Internet',
    'catatan': 'Belum dikembalikan',
  },
  {
    'judul': 'Pemrograman Web',
    'pengarang': 'Fajar',
    'tahun': 2020,
    'rating': 3.2,
    'tersedia': true,
    'genre': 'Web',
    'catatan': null,
  },
];

// ================= FUNGSI =================

String kategoriRating(double rating) {
  if (rating >= 4.5) {
    return 'Sangat Baik';
  } else if (rating >= 3.5) {
    return 'Baik';
  } else {
    return 'Cukup';
  }
}

String statusBuku(bool tersedia) {
  switch (tersedia) {
    case true:
      return 'Tersedia';
    case false:
      return 'Dipinjam';
  }
}

// ================= APLIKASI =================

class PerpustakaanApp extends StatelessWidget {
  const PerpustakaanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perpustakaan Mini',
      home: const HalamanUtama(),
    );
  }
}

// ================= HALAMAN UTAMA =================

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String pencarian = '';

  @override
  Widget build(BuildContext context) {
    // SET: mengambil genre tanpa duplikat
    Set<String> genreUnik = buku.map((item) => item['genre'] as String).toSet();

    // WHERE: mencari buku berdasarkan judul
    List<Map<String, dynamic>> hasil = buku.where((item) {
      return item['judul'].toString().toLowerCase().contains(
        pencarian.toLowerCase(),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Perpustakaan Mini')),

      body: Column(
        children: [
          // ================= GENRE =================

          Wrap(
            spacing: 8,
            children: genreUnik.map((genre) {
              return Chip(label: Text(genre));
            }).toList(),
          ),

          // ================= PENCARIAN =================
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Cari judul buku',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  pencarian = value;
                });
              },
            ),
          ),

          // ================= DAFTAR BUKU =================
          Expanded(
            child: ListView.builder(
              itemCount: hasil.length,
              itemBuilder: (context, index) {
                final item = hasil[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(item['judul']),

                    subtitle: Text(
                      '${item['pengarang']} | '
                      '${item['tahun']} | '
                      'Rating: ${item['rating']}\n'
                      'Kategori: '
                      '${kategoriRating(item['rating'])}',
                    ),

                    // Ternary untuk warna badge
                    trailing: Container(
                      padding: const EdgeInsets.all(6),
                      color: item['tersedia'] ? Colors.green : Colors.red,
                      child: Text(
                        statusBuku(item['tersedia']),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HalamanDetail(buku: item),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ================= HALAMAN DETAIL =================

class HalamanDetail extends StatefulWidget {
  final Map<String, dynamic> buku;

  const HalamanDetail({super.key, required this.buku});

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  @override
  Widget build(BuildContext context) {
    // String? karena catatan boleh null
    final String? catatan = widget.buku['catatan'] as String?;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Buku')),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.buku['judul'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Text('Pengarang: ${widget.buku['pengarang']}'),
            Text('Tahun: ${widget.buku['tahun']}'),
            Text('Genre: ${widget.buku['genre']}'),
            Text('Rating: ${widget.buku['rating']}'),

            const SizedBox(height: 15),

            const Text(
              'Catatan Peminjam:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            // ?? mencegah masalah ketika nilai null
            Text(catatan ?? 'Tidak ada catatan peminjam'),
          ],
        ),
      ),
    );
  }
}
