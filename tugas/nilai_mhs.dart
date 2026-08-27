double hitungRatarata(List<int> nilai) {
  if (nilai.isEmpty) return 0.0;
  return nilai.reduce((a, b) => a + b) / nilai.length;
}

String tentukanGrade(double rataRata) {
  if (rataRata >= 85) return 'A';
  if (rataRata >= 75) return 'B';
  if (rataRata >= 65) return 'C';
  if (rataRata >= 55) return 'D';
  return 'E';
}

bool cekKelulusan(double rataRata, int absensi) {
  return rataRata >= 60 && absensi <= 3;
}

void main() {
  Map<String, Map<String, dynamic>> mahasiswa = {
    'Budi santoso': {
      'nilai': [85, 90, 78, 92, 88],
      'absensi': 1,
    },
    'Siti rahayu': {
      'nilai': [55, 60, 58, 52, 45],
      'absensi': 1,
    },
    'Andi': {
      'nilai': [70, 75, 80, 75, 75],
      'absensi': 1,
    },
    'Dewi': {
      'nilai': [80, 75, 70, 75, 75],
      'absensi': 1,
    },
    'Santoso': {
      'nilai': [75, 75, 75, 75, 76],
      'absensi': 1,
    },
  };

  List<double> rataKelas = [];

  print("==== LAPORAN NILAI MAHASISWA ====");

  mahasiswa.forEach((nama, data) {
    final nilai = data['nilai'] as List<int>? ?? [];
    final absensi = data['absensi'] as int? ?? 0;

    final rata = hitungRatarata(nilai);
    final grade = tentukanGrade(rata);
    final lulus = cekKelulusan(rata, absensi);

    rataKelas.add(rata);

    print("\nNama : $nama");
    print("Nilai : $nilai");
    print("Rata rata : ${rata.toStringAsFixed(1)}");
    print("grade : $grade");
    print("Status : ${lulus ? 'Lulus' : 'Tidak lulus'}");
  });

  final semuaNilai = mahasiswa.values
      .map((data) => data['nilai'] as List<int>? ?? [])
      .expand((nilai) => nilai)
      .toList();

  final nilaiTertinggi = semuaNilai.reduce((a, b) => a > b ? a : b);
  final nilaiTerendah = semuaNilai.reduce((a, b) => a < b ? a : b);

  final rataRataKelas = rataKelas.reduce((a, b) => a + a) / rataKelas.length;

  print("/n==== STATISTIK KELAS ====");
  print("Nilai tertinggi : $nilaiTertinggi");
  print("Nilai Terendah : $nilaiTerendah");
  print("Rata rata kelas : ${rataRataKelas.toStringAsFixed(1)}");
}
