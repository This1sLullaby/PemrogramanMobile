import 'dart:io';

void main() {
  print('=== KALKULATOR SEDERHANA ===');

  //  Input angka pertama
  print('Masukkan angka 1:');
  double a = double.parse(stdin.readLineSync()!);

  // Input operasi
  print('Masukkan operasi (+, -, *, /):');
  String op = stdin.readLineSync()!;

  //Input angka kedua
  print('Masukkan angka 2:');
  double b = double.parse(stdin.readLineSync()!);

  //Panggil fungsi dan tampilkan hasil
  double hasil = hitung(a, b, op);
  print('Hasil: $a $op $b = $hasil');
}

//Fungsi untuk menghitung
double hitung(double a, double b, String op) {
  if (op == '+') return a + b;
  if (op == '-') return a - b;
  if (op == '*') return a * b;
  if (op == '/') return a / b;
  return 0; // Jika operasi salah
}
