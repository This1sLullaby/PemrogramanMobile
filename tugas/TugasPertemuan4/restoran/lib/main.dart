//entry point aplikasi
//hanya berisi konfig awal pemanggilan halaman utama

import 'package:flutter/material.dart';

import 'pages/restaurant_detail_page.dart'; //import halaman detail restoran

void main() {
  //menjalankan aplikasi
  runApp(MyApp());
}

//Widget root aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false, // hilangkan baner debug
      theme: ThemeData(
        primarySwatch: Colors.teal, //Tema warna utama
        useMaterial3: true,
      ),
      home: RestaurantDetailPage(),
    );
  }
}
