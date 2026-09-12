/* Widget ini membuat kartu menu dengan gambar, nama, harga
menggunakan Stack untuk overlay gambar + info */

import 'package:flutter/material.dart';

//class MenuCard adalah Stateless widget karena datanya tidak berubah setelah dibuat (immutable)

//bagian ini bakalan error kalo method build() di override widget blm di buat
class MenuCard extends StatelessWidget {
  //properti yang dikutomisasi saat widget dipanggil

  final String imageURL; //URL gambar menu
  final String nama; //nama menu
  final String price; //harga menu
  //fungsi yang dipanggil saat kartu di tap (untuk button clik)
  final VoidCallback onTap;

  //construct dengan parameter wajib (required)
  const MenuCard({
    super.key,
    required this.imageURL,
    required this.nama,
    required this.price,
    required this.onTap,
  });
  //override
  @override
  Widget build(BuildContext context) {
    //method build di dalam class
    //container sebagai pembungkus dengan ukuran tetap
    return GestureDetector(
      //GestureDetector mendeteksi sentuhan (tap) pada widget, ini untuk button klik
      onTap: onTap, //memanggil funsi yang dikirim dari parent
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 12), //jarak antar kartu
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), //buat sudut membulat
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //bagian gambar dengan clipRREct agar sudut ikut membulat
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                imageURL,
                width: 150,
                height: 100,
                fit: BoxFit.cover, //gambar akan memenuhi area tanpa terdistrosi
              ),
            ),
            //padding untuk memberi jarak dalam
            Padding(
              padding: EdgeInsetsGeometry.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama menu (mmaksimal 1 baris, jika kepanjangan dipotong dengan ...)
                  Text(
                    nama, //pakai variable nama
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  //set harga di card
                  Text(
                    price,
                    style: TextStyle(fontSize: 12, color: Colors.teal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //panggil fungsi dari parent
}
