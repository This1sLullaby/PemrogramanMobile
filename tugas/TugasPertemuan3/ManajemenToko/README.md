# Sistem Manajemen Toko Online
Tugas Mandiri Pertemuan 3: OOP & Async Dart

## Deskripsi
Program ini mensimulasikan sistem toko online sederhana menggunakan bahasa pemrograman Dart. Program ini mengimplementasikan konsep Object-Oriented Programming (OOP), Asynchronous Programming, serta Error Handling yang komprehensif sesuai dengan spesifikasi tugas pada modul Pertemuan 3.

## Struktur & Penjelasan Kode

### 1. Object-Oriented Programming (OOP)
- Abstract Class (Produk): Berfungsi sebagai cetak biru yang memaksa subclass untuk mengimplementasikan method `deskripsi()`. Memiliki properti dasar: `id`, `nama`, `harga`, dan `stok`.
- Inheritance (extends): 
  - ProdukDigital: Mewarisi class Produk dan menambahkan properti spesifik `ukuranMB` dan `formatFile`.
  - ProdukFisik: Mewarisi class Produk dan menambahkan properti spesifik `beratGram` dan `dimensi`.
- Mixin (with BisaDiskon): Memisahkan logika perhitungan diskon agar bisa digunakan oleh berbagai class produk tanpa hierarki pewarisan yang rumit. Memiliki method `hitungHargaDiskon()` dan `validasiDiskon()`.
- Class Keranjang: Mengelola state daftar belanjaan (`List<Produk>`), termasuk validasi stok saat method `tambah()` dipanggil, method `hapus()`, dan kalkulasi `totalHarga()`.

### 2. Asynchronous Programming (Async/Await)
- Class TokoService: Mensimulasikan layer service atau backend dari aplikasi.
- Future & async/await: 
  - `cariProduk()`: Mensimulasikan proses pencarian data dari database dengan `Future.delayed()`.
  - `prosesCheckout()`: Mensimulasikan proses payment gateway yang membutuhkan waktu pemrosesan.

### 3. Error Handling
- Custom Exceptions: 
  - StokHabisException: Dilempar (throw) ketika pengguna mencoba membeli produk yang stoknya sudah 0.
  - ProdukTidakAda: Dilempar ketika proses pencarian produk tidak menemukan hasil yang sesuai di database.
- Try/Catch Block: Menerapkan penanganan error bertingkat (`on SpecificException` hingga `catch` umum) di fungsi `main()` untuk mencegah program berhenti secara paksa (crash-safe).

## Cara Menjalankan
1. Buka [DartPad](https://dartpad.dev/) atau editor Dart lokal seperti VS Code / Android Studio.
2. Salin seluruh kode dari file `main.dart`.
3. Jalankan program (Run) dan amati output yang muncul di konsol.

## Pemetaan Kriteria Penilaian
| Kriteria | Implementasi dalam Kode |
| :--- | :--- |
| OOP Structure (35%) | Penggunaan abstract class, extends, dan mixin dengan benar sesuai spesifikasi tugas. |
| Async/Await (25%) | Implementasi Future, async, await, dan Future.delayed pada class TokoService. |
| Error Handling (20%) | Pembuatan Custom Exception dan blok try/on/catch yang menyeluruh di fungsi main(). |
| Output Program (20%) | Output console terformat rapi, informatif, dan mudah dibaca oleh penilai. |

## Penulis
Nama: Laili Nurul Fadila
NIM: 07352411013
Kelas: 5IF3