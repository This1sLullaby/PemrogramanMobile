import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BREAKING NEWS',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

              Row(
                children: [
                  Text("Beranda"),
                  SizedBox(width: 12),
                  Text("Kategori"),
                  SizedBox(width: 12),
                  Text("Disarankan"),
                ],
              ),
            ],
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 10.0, thickness: 1.0),
            SizedBox(height: 10),
            Text(
              "Pemerintah umumkan kebijakan energi terbarukan baru untuk 2027",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: const Color.fromARGB(255, 255, 135, 175),
                  size: 20,
                ),
                Text("Penulis: Lalali"),
                SizedBox(width: 10),
                Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                Text("05-09-2026"),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 5.0, thickness: 1.0),
            SizedBox(height: 10),
            Text("1. Harga BBM bersubsidi resmi turun mulai pekan depan"),
          ],
        ),
      ),
    );
  }
}
