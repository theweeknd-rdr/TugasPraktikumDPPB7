import 'package:flutter/material.dart';
import 'ui/login_page.dart';
// import 'ui/produk_form.dart'; // Hapus tanda // jika ingin melihat Form Produk

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HAPUS 'const' di depan MaterialApp agar tidak error dengan desain baru
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: LoginPage(), // Panggil halaman Login
    );
  }
}
