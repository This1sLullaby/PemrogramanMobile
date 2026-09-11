void main() {
  // ===== VARIABEL DENGAN TIPE DATA EKSPLISIT =====
  String nama = "Laili Nurul Fadila";
  int umur = 20;
  double tinggiBadan = 160.5;
  bool aktif = true;

  // ===== VARIABEL DENGAN TIPE INFERENSI (var) =====
  var tempatTinggal = "Subaim";
  var nilaiTugas = 60;

  // ===== VARIABEL DENGAN TIPE DYNAMIC =====
  dynamic status = "Mahasiswi";
  dynamic semester = 5;

  // ===== VARIABEL FINAL (tidak bisa diubah) =====
  final String kodeNegara = 'ID';

  // ===== KONSTANTA (nilai tetap) =====
  const double pi = 3.14;

  // ===== TAMPILKAN OUTPUT =====
  print('=== DATA PRIBADI ===');
  print('Nama          : $nama');
  print('Umur          : $umur tahun');
  print('Tinggi Badan  : $tinggiBadan cm');
  print('Status Aktif  : $aktif');
  print('Tempat Tinggal: $tempatTinggal');
  print('Nilai Tugas   : $nilaiTugas');
  print('Status        : $status');
  print('Semester      : $semester');
  print('Kode Negara   : $kodeNegara');
  print('Nilai PI      : $pi');
}
