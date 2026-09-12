/* Halaman detail restaurtant sesuai spesifikasi yang diminta tugas
memiliki: Scaffold, AppBar, Image, Container, Row, Column, Stack, 
          Text, icon, iconbutton, FloatingActionButton, padding,
          SizedBox, Chip, Card */

import 'package:flutter/material.dart';
//import package agar bisa pakai font dari google
import 'package:google_fonts/google_fonts.dart';

//import widget kartu menu yang telah dibuat
import '../widget/menu_card.dart';

class RestaurantDetailPage extends StatelessWidget {
  //ini bakalan erro awal ditulis, karena belum buat method build()

  const RestaurantDetailPage({super.key});

  //fungsi untuk menampilkan dialog saat tombol share di klik(bonus)
  void _showShareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Link restoran berhasil disalin!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  //fungsi untuk menampilkan dialog reservasi (bonus)
  void _showReservationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reservasi Meja'),
        content: Text('Anda akan diarahkan ke halaman reservasi.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); //menampilkan snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Reservasi berhasil dibuat!')),
              );
            },
            child: Text('Konfirmasi'),
          ),
        ],
      ),
    );
  }

  //Fungsi saat kartu menu di tap (bonus)
  void _onMenuTap(BuildContext context, String menuName) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Anda memilih menu: $menuName')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //1. Appbar dengan judul dan tombol share
      appBar: AppBar(
        title: Text(
          'La Brasserie Bistro',
          style: GoogleFonts.pacifico(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0, //hilangkan bayangan appbar
        actions: [
          //Iconbutton share
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => _showShareDialog(context),
          ),
        ],
      ),

      //2.Konten utama / body
      body: SingleChildScrollView(
        //agar halaman bisa di scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Gambar restoran
            Image.network(
              'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800',
              width: double.infinity, //lebar penuh layar
              height: 220,
              fit: BoxFit.cover, //gambar memenuhi area
            ),

            //3. container info utama
            Padding(
              padding: EdgeInsetsGeometry.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama restoran
                  Text(
                    'La Brasserie Bistro',
                    style: GoogleFonts.pacifico(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.tealAccent,
                    ),
                  ),
                  const SizedBox(height: 8),

                  //rating + kategori (row)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 2),
                      SizedBox(width: 4),
                      Text(
                        '(1250 Ulasan)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 12),
                      //chip untuk kategori (widget tambahan)
                      Chip(
                        label: Text(
                          'Western Bistro',
                          style: GoogleFonts.palanquin(fontSize: 12),
                        ),
                        backgroundColor: Colors.teal.shade50,
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  //alamat
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Jln. Kemang Raya No.45, Jakarta Selatan',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  //4. row untuk statistik
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //statistik 1.jarak
                        _buildStatItem(Icons.location_on, '2.5 km', 'Jarak'),
                        //garis pemisah vertikal
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey.shade300,
                        ),
                        //statistik 2. Waktu buka
                        _buildStatItem(
                          Icons.access_time,
                          '10.00 - 22.00',
                          'Waktu buka',
                        ),
                        //garis pemisah vertikal
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.grey.shade300,
                        ),
                        //statistik 3. harga rata rata
                        _buildStatItem(
                          Icons.attach_money,
                          'Rp.100.000',
                          'Harga Rata-rata',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  //5. Deskripsi restoran
                  const Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'La Brasserie Bistro menghadirkan pengalaman bersantap '
                    'dengan cita rasa khas Eropa dalam suasana yang hangat dan '
                    'elegan. Menggunakan bahan-bahan segar pilihan dan racikan '
                    'chef berpengalaman untuk setiap hidangan istimewa. '
                    'Cocok untuk makan malam romantis atau pertemuan bisnis.',
                    style: TextStyle(color: Colors.grey.shade700, height: 1.5),
                    maxLines: 4, //menentukan maksimal baris
                    overflow: TextOverflow
                        .ellipsis, //potong dengan ... saat kebanyakan
                  ),
                  const SizedBox(height: 24),

                  //6. section menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu Populer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //Tombol 'Lihat semua'
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('menampilkan semua menu...'),
                            ),
                          );
                        },
                        child: Text('Lihat semua'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  //daftar menu (horizontal scroll)
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal, //scroll horizontal
                      children: [
                        //menu 1
                        MenuCard(
                          imageURL: 'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=400',
                          nama: 'Grilled Sirloin Steak',
                          price: 'Rp. 145.000',
                          onTap: () => _onMenuTap(
                            context,
                            'Grilled Sirloin Steak',
                          ), //menampilkan menu 1
                        ),
                        //menu 2
                        MenuCard(
                          imageURL: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400',
                          nama: 'Truffle Carbonara',
                          price: 'Rp 98.000',
                          onTap: () => _onMenuTap(
                            context,
                            'Truffle Carbonara',
                          ), //menampilkan menu2
                        ),
                        MenuCard(
                          imageURL: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
                          nama: 'Grilled Salmon',
                          price: 'Rp 128.000',
                          onTap: () => _onMenuTap(
                            context,
                            'Grilled Salmon',
                          ), //menampilkan menu3
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      //7. floating action button untuk reservasi
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showReservationDialog(context),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        icon: Icon(Icons.restaurant_menu),
        label: Text('Reservasi Sekarang'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  //helper method: membuat sistem statistik
  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 24),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
