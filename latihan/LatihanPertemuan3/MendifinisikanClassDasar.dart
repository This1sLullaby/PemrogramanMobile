//Mendefinisikan Class dasar

//contoh kelas parent
class Mahasiswa {
  //variabel yang dipake/ditulis di class itu namanya properties
  String nama;
  String nim;
  int semester;
  double ipk;
  //properties akan error non-nullable jika belum di construct

  //constructor biasa
  Mahasiswa(this.nama, this.nim, this.semester, this.ipk);
  //setelah ada constructor baru properties gak error

  //method
  // tanda $ digunakan buat pemanggilan properties di dalam string
  void perkenalan() {
    print('Halo, Saya $nama (NIM: $nim), semester $semester, IPK: $ipk');
  }

  //Getter - property yang dihitung
  // => dalam Dart disebut fat arrow atau arrow syntax. kerjanya mirip return
  // ? merupakan operator ternary
  String get status => ipk >= 3.0 ? 'Cumlaude' : 'Reguler';
  //cara baca: Buatlah properti (getter) bernama status yang menghasilkan teks (String). Caranya: cek apakah ipk lebih dari atau sama dengan 3.0? Jika ya, kembalikan teks 'Cumlaude'. Jika tidak, kembalikan teks 'Reguler'

  //Setter - validasi saat mengubah nilai
  set nilaiIPK(double nilai) {
    if (nilai < 0 || nilai > 4.0) throw ArgumentError('IPK tidak valid!');
    ipk = nilai;
  }
  //cara baca:
  /*Buatlah sebuah Setter bernama nilaiIPK yang menerima masukan berupa angka desimal (double) bernama nilai.
  Sebelum disimpan, lakukan pengecekan: apakah nilai tersebut kurang dari 0 ATAU lebih dari 4.0?
  Jika ya, hentikan program dan munculkan error dengan pesan 'IPK tidak valid!'.
  Jika aman (lolos pengecekan), simpan angka tersebut ke dalam variabel ipk.*/

  //override toString untuk representasi teks
  @override
  String toString() => 'Mahasiswa($nama, $nim)';
  //Kalau data ini diprint, tolong tampilkan namanya dan NIM-nya
}

//ini main program
void main() {
  //var ini objek/wadah baru yang mau di cetak, penamaanya bebas
  var mhs = Mahasiswa('Budi', '2024001', 3, 3.75); //ini instatiation
  // var mhs ini bakalan muncul warning kalo belum di pake
  mhs.perkenalan(); // disini perintah fungsi buat nyuruh nampilin perkenalan pakai data mhs si budi
  print(mhs.status); //Cumlaude
  mhs.nilaiIPK = 3.90; //disini pake setter
}
