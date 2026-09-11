import 'package:flutter/material.dart';
import 'package:pertemuan5/widgets/flash_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FlashScreen(),
      )
    );
  }
}
