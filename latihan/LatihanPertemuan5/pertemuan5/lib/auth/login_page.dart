import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //ini dibuat setelah buat global key
    final _globalKey = GlobalKey<FormState>();
    return Scaffold(
      //scafold ini canvas (layar kosong)
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          //kalau mau tambah center auto itu klik kanan pakai refaktorisasi, lalu wrap with center
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, //ini agar posisi objek ditengah
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.check, color: Colors.white),
              ),

              SizedBox(height: 15), // ini untuk jarak antara kotak ke text

              Text(
                "Task Flow",
                style: TextStyle(fontSize: 30, color: Colors.indigoAccent),
              ),

              SizedBox(height: 20), // ini untuk jarak antara text ke text

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  //MainAxisAlignment ini untuk susun secara  vertikal
                  //crossAxisAlignment ini untuk susun secara horizontal
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back👋",
                    ), //aktifkan emoji pakai shortcut windows+.
                    Text("Login untuk melanjutkan ke akun anda"),
                  ],
                ),
              ),
              SizedBox(height: 40), // ini untuk jarak antara text ke text
              //form : ini untuk bagian inputan login
              Form(
                key: _globalKey,
                child: Column(
                  children: [
                    TextFormField(
                      // ini untuk bagian kotak input
                      validator: (value) {
                        //ini untuk agar bagian input harus terisi
                        if (value == null || value.isEmpty) {
                          return "Username tidak boleh kosong";
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ), //ini untuk ikon gambar orang
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), //ini untuk atur lekukan kotak input
                        ),
                      ),
                    ),

                    SizedBox(height: 30), // ini untuk jarak antara text ke text

                    TextFormField(
                      // ini untuk bagian kotak input
                      validator: (value) {
                        //ini untuk agar bagian input harus terisi
                        if (value == null || value.isEmpty) {
                          return "Username tidak boleh kosong";
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                        ), //ini untuk ikon gambar orang
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), //ini untuk atur lekukan kotak input
                        ),
                      ),
                    ),

                    SizedBox(height: 30), // ini untuk jarak antara text ke text

                    ElevatedButton(
                      //ini buat tombol login
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) ;
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 20), // ini untuk jarak antara text ke text

                    Row(
                      // agar sejajar 2 teks pakai row
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun"),
                        TextButton(onPressed: () {}, child: Text("Register")),
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 10,
                          ), // ini untuk buat garis berjarak dari kata atau
                          child: Text("Atau"),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/google.jpeg',
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              Text("Continue with google"),
                            ],
                          ),
                        ),

                        SizedBox(height: 20, width: 40),

                        OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/fb.jpeg',
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(width: 10),
                              Text("Continue with facebook"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}