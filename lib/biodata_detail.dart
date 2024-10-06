import 'package:flutter/material.dart';



class BiodataDetail extends StatefulWidget {
  final String? name;
  final String? email;
  final String? alamat;
  final String? tplahir;
  final String? kelamin;  // Tambahkan variabel untuk jenis kelamin
  final String? agama;
  final String? tglahir;
  
  const BiodataDetail({Key? key, this.name, this.email, this.alamat, this.tplahir, this.tglahir,this.kelamin, this.agama})
  : super(key : key);  
  @override  State<StatefulWidget> createState() => ItemDetailState(); 
}
class ItemDetailState extends State<BiodataDetail> {
@override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Detail Biodata'),
      centerTitle: true,
      backgroundColor: Colors.indigoAccent,
    ),
    body: Column(
      children: [
        Text("Nama  = " + widget.name.toString()),
        Text("Tempat Lahir  = " + widget.tplahir.toString()),
        Text("Tanggal Lahir  = " + widget.tglahir.toString()),
        Text("Kelamin  = " + widget.kelamin.toString()),
        Text("Agama  = " + widget.agama.toString()),
        Text("Alamat  = " + widget.alamat.toString()),
        Text("Email  = " + widget.email.toString()),
      ],
    ) 
  );
 }
}

// class ItemDetailState extends State<BiodataDetail>{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 205, 178, 253),
//       appBar: AppBar(
//         title: const Text('Detail Produk'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Text("Kode Produk: " + widget.kodeProduk.toString()),
//           Text("Nama Produk: ${widget.namaProduk}"),
//           Text("Harga: ${widget.harga}")
//         ],
//       ),
//     );
//   }
  
// }