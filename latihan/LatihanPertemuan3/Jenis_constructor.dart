//1. ini class parent
class Produk {
  //ini properties
  String nama;
  double harga;
  String kategori;

  //2. constructor biasa (Sibos - kalo mau nyetak harus ada 3 data yang udah di tentukan)
  Produk(this.nama, this.harga, this.kategori);

  //3. Named constructor - untuk variasi pembuatan objek
  //ini asisten/kode pintas baru, artinya data yang di pake tuh bisa di tentukan, ga harus semua dari construct utama
  Produk.gratis(String nama) : this(nama, 0.0, 'Promo');

  //Named kedua - sedekah
  Produk.sedekah(String nama) : this(nama, 0.0, 'Amal');
  //ini aturan khusus buat kode ngasih sedekah
  //disini saya cuma butuh nama barang doang, ga peduli harga karna ini 'Amal'

  //Named elektronik
  Produk.elektronik(String nama, double harga)
    : this(nama, harga, 'elektronik');

  //4. Factory constructor - kontrol penuh atas instace yang dibuat
  factory Produk.dariJson(Map<String, dynamic> json) {
    return Produk(
      json['nama'] as String,
      (json['harga'] as num).toDouble(),
      json['kategori'] as String,
    );
  }

  //belio ini ditambahin buat jadi penerjemah ye..
  //supaya kalo print(objek) yang tampil langsung keformat
  //kalo tanpa blio, yg tampil tuh "instance of ..."
  @override
  String toString() => 'Produk $nama, $harga,$kategori';
}

//5. ini main

void main() {
  //objek/wadah
  //var pake construct biasa
  var p = Produk('Xiaolungbao', 25000, 'makanan');
  //var1 pake named construct dari elektronik
  var p1 = Produk.elektronik('Laptop', 12000000);
  //var2 pake named consttruct dari produkgratis
  var p2 = Produk.gratis('Brosur');
  //var3 pale named construct dari sedekah
  var p3 = Produk.sedekah('Smartphone');
  //var4 pakai factory constructor
  var p4 = Produk.dariJson({
    'nama': 'Tablet',
    'harga': 3000000,
    'kategori': 'Elektronik',
  });

  /*Nah kalo kita perintah langsung cth print(p); maka hasiny akan aneh 'instace of 'Produk'' 
  makannya kita perlu pakai toString, biar bertugas sebagai penerjemah. toString nya di panggil di class induk ya*/

  print(p);
  print(p1);
  print(p2);
  print(p3);
  print(p4);
}
