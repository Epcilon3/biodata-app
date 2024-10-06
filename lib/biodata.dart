

/// Sudah Benar
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';

class BiodataForm extends StatefulWidget {
  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _alamat = '';
  String _tplahir = '';
  String _kelamin = '';  // Tambahkan variabel untuk jenis kelamin
  String _agama = '';
  String? selectedAgama;
  DateTime tglahir = DateTime.now();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print('Jenis Kelamin: $_kelamin');  // Tampilkan jenis kelamin
      print('Tempat Lahir: $_tplahir');
      print('Tanggal Lahir: $tglahir');
      print('Agama: $_agama');
      print('Alamat: $_alamat');
      print('Agama: $selectedAgama');
    }
  }

  final _dateController = TextEditingController();
  final List<String> itemsAgama = [
    "Islam",
    "Katolik",
    "Kristen",
    "Hindu",
    "Khonghucu",
    "Budha",
    "Kepercayaan",
  ];

  final List<String> itemsKelamin = [
    "Laki-laki",
    "Perempuan",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Biodata'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              tbNama(),
              tbTempat(),
              tbTanggal(),
              tbKelamin(),  // Tambahkan dropdown jenis kelamin
              tbAgama(),
              tbAlamat(),
              tbEmail(),
              SizedBox(height: 20.0),
              tblSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  tbNama() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukan Nama Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  tbTempat() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tempat Lahir',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukan Tempat Lahir Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _tplahir = value!;
      },
    );
  }

  tbTanggal() {
    return TextFormField(
      readOnly: true,
      controller: _dateController,
      decoration: InputDecoration(
        labelText: 'Tanggal Lahir',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(DateTime.now().year - 150),
          lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        );

        if (pickedDate != null) {
          setState(() {
            _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
            tglahir = pickedDate;
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silakan pilih tanggal.';
        }
        return null;
      },
    );
  }

  tbAlamat() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Alamat',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Silakan masukkan alamat Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _alamat = value!;
      },
    );
  }

  tbEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value == null || !value.contains('@')) {
          return 'Silakan masukkan email yang valid.';
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  tbKelamin() {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: "Jenis Kelamin",
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: const Text(
        'Pilih Jenis Kelamin',
        style: TextStyle(fontSize: 14),
      ),
      items: itemsKelamin
        .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ))
        .toList(),
      validator: (value) {
        if (value == null) {
          return 'Silakan pilih jenis kelamin.';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _kelamin = value ?? '';  // Update _kelamin
        });
      },
      onSaved: (value) {
        _kelamin = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  tbAgama() {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: "Agama",
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: const Text(
        'Pilih Agama',
        style: TextStyle(fontSize: 14),
      ),
      items: itemsAgama
        .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
        ))
        .toList(),
      validator: (value) {
        if (value == null) {
          return 'Silakan pilih agama.';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          selectedAgama = value;  // Update selectedAgama
          _agama = value ?? '';  // Update _agama
        });
      },
      onSaved: (value) {
        selectedAgama = value.toString();
        _agama = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }


  tblSimpan() {
      return ElevatedButton(
      onPressed: _submitForm, 
      child: Text('Submit'),
      );
  }
}
  


// Kode Dibawah Ini salah dibagian Item List
// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:intl/intl.dart';

// class BiodataForm extends StatefulWidget {
//   @override

//     _BiodataFormState createState() => _BiodataFormState();
// }


// class _BiodataFormState extends State<BiodataForm> {
//   final GlobalKey<FormState> _formKey =
//     GlobalKey<FormState>();

//   String _name = '';
//   String _email = '';
//   String _alamat = '';
//   String _tplahir = '';
//   // String? _kelamin = '';
//   String _agama = '';
//   String? selectedValue;
//   DateTime tglahir = DateTime.now();

//   void _submitForm () {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       print('Name: $_name');
//       print('Email: $_email');
//       // print('Kelamin: $_kelamin');
//       print('Tempat Lahir: $_tplahir');
//       print('Tanggal Lahir: $tglahir');
//       print('Agama: $_agama');
//       print('Akanat: $_alamat');
//       print('Agama: $selectedValue');
//     }
//   }

//   final _dateController = TextEditingController();
//   // final _status = ["Laki-laki", "Perempuan"];
//   final List<String> items = [
//     "Islam",
//     "Katolik",
//     "Kristen",
//     "Hindu",
//     "Khonghucu",
//     "Budha",
//     "Kepercayaan",
//   ];

//   @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Form Biodata'),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               children: [
//                 tbNama(),
//                 tbTempat(),
//                 tbTanggal(),
//                 tbAgama(),
//                 // tbKelamin(),
//                 tbAlamat(),
//                 tbEmail(),
//                 SizedBox(height: 20.0),
//                 tblSimpan(),
//               ],
//             )
//           )
//         )
//       );
//     }
  
//   tbNama() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Nama',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         )
//       ),
//       validator: (value) {
//         if (value! .isEmpty) {
//           return 'Masukan Kota Kelahiran Anda.'; // Return an error
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _tplahir = value!;
//       },
//     );
//   }

//   tbTempat() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Tempat Lahir',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//     validator: (value) {
//       if (value!.isEmpty) {
//         return 'Masukan Kota Kelahiran Anda.';
//       }
//       return null;
//     },
//     onSaved: (value) {
//       _tplahir = value!;
//     },
//     );
//   }

//   tbTanggal() {
//     return TextFormField(
//       readOnly: true,
//       controller: _dateController,
//       decoration: InputDecoration(
//         labelText: 'Tanggal Lahir',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       onTap: () async {
//         DateTime? pickedDate = await showDatePicker(
//           context: context,
//           initialDate: DateTime.now(),
//           firstDate: DateTime(DateTime.now().year - 150),
//           lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
//         );

//         if (pickedDate != null) {
//           setState(() {
//             _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
//           });
//         }
//       },
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter date.';
//         }
//         return null;
//       },
//     );
//   }

//   tbAlamat() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Alamat',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'Silakan Masukan Alamat Anda.';
//         }
//         return null;
//       },
//       onSaved: (value) {
//         _alamat = value!;
//       }
//     );
//   }

//   tbEmail() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Email',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),

//       /// Kode Bawah Sedang Dicoba
//       validator: (value) {
//         if (value == null || !value.contains('@')) {
//           return 'Silakan Masukan Email yang Valid.';
//         }
//         return null;
//         },

//       // validator: (value) {
//       //   if (value!.contains('@')) {
//       //     return 'Silakan Masukan Email Anda.';
//       //   }
//       //   return null;
//       // },
//       onSaved: (value) {
//         _email = value!;
//       }
//     );
//   }
  
//   // tbKelamin() {
//   //   return DropdownButtonFormField<String>(
//   //     decoration: InputDecoration(
//   //       border: OutlineInputBorder(
//   //         borderRadius: BorderRadius.circular(15),
//   //       ),
//   //     ),
//   //     value: _kelamin, 
//   //     hint: Text('Jenis Kelamin'), 
//   //     onChanged: (String? newValue) {
//   //       setState(() {
//   //         _kelamin = newValue!;
//   //       });
//   //     },
//   //     validator: (String? value) {
//   //       if (value == null || value.isEmpty) {
//   //         return 'Silakan Pilih Jenis Kelamin Anda.';
//   //       }
//   //       return null;
//   //     },
//   //     items: _status.map<DropdownMenuItem<String>>((String value) {
//   //       return DropdownMenuItem<String>(
//   //         value: value,
//   //         child: Text(value),
//   //       );
//   //     }).toList(),
//   //   );
//   // }
  
//   tbAgama() {
//     return DropdownButtonFormField2<String>(
//       isExpanded: true,
//       decoration: InputDecoration(
//         labelText: "Agama",
//         contentPadding: const EdgeInsets.symmetric(vertical: 16),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       hint: const Text(
//         'Pilih Agama',
//         style: TextStyle(fontSize: 14),
//       ),
//       items: items
//       .map((item) => DropdownMenuItem<String>(
//           value: item,
//           child: Text(
//             item,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.blue,
//             ),
//           ),
//         ))
//       .toList(),

//       validator: (value) {
//         if (value == null) {
//           return 'Silahkan Pilih Agama.';
//         }
//         return null;
//       },
//       onChanged: (value) {
//         setState(() {
//         selectedValue = value; // Update selectedValue with the chosen item
//         _agama = value ?? ''; // Update _agama if not null
//       });

//       },
//       onSaved: (value) {
//         selectedValue = value.toString();
//         _agama = value.toString();
//       },
//       buttonStyleData: const ButtonStyleData (
//         padding: EdgeInsets.only(right: 8),
//       ),
//       iconStyleData: const IconStyleData( 
//         icon: Icon(
//           Icons.arrow_drop_down,
//           color: Colors.black45,
//         ),
//         iconSize: 24,
//       ),
//       dropdownStyleData: DropdownStyleData(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       menuItemStyleData: const MenuItemStyleData(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//       ),
//     );
//   }

//   tblSimpan() {
//     return ElevatedButton(
//       onPressed: _submitForm, 
//       child: Text('Submit'),
//     );
//   }


// }