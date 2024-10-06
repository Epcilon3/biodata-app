import 'package:flutter/material.dart';
import 'home.dart'; // Pastikan nama file ini sesuai dengan nama file yang Anda simpan untuk kelas BiodataForm


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
      ),
      title: 'Home',
      home: Home(), // Menampilkan BiodataForm sebagai tampilan utama
    );
  }
}
