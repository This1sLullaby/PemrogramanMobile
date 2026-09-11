//1. ini class parent
class Tugas {
  String judul;
  String matakuliah;
  DateTime deadline; //datetime bakalan ambil format tanggal dan waktu dari perangkat host
  bool selesai; //pakai bool buat cek selesai atau belum

  /*Tugas ini pake 4 data : judul,matakuliah,deadline,selesai=true||false
  cara mengisinya harusmenyebutkan nama dan tidak boleh asla urutan (required)
  tiga data pertama wajib di isi, kalo data keempat (selesai) opsional tapi kalo ga diisi dianggap false*/
  Tugas({
    required this.judul,
    required this.matakuliah,
    required this.deadline,
    this.selesai = false,
  });

  //Getter untuk cek apakah sudah telat
  //bool get isTelat bakal return (=>) date-time sekarang dari komputer host
  //isAfter ngecek apakah waktu lebih akhir dari (deadline)
  // && itu untuk kondisi kedua yaitu !selesai
  bool get isTelat => DateTime.now().isAfter(deadline) && !selesai;

  //ini method
  void tandaiSelesai() {}
}
