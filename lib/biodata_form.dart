import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:biodata_app/biodata_detail.dart';

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
  String _kelamin = '';  
  String _agama = '';
  String? selectedAgama;
  DateTime tglahir = DateTime.now();

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BiodataDetail(
            name: _name,
            email: _email,
            alamat: _alamat,
            tplahir: _tplahir,
            kelamin: _kelamin,
            agama: _agama,
            tglahir: DateFormat('yyyy-MM-dd').format(tglahir),
          ),
        ),
      );
    }
  }

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
              SizedBox(height: 16.0),
              tbTempat(),
              SizedBox(height: 16.0),
              tbTanggal(),
              SizedBox(height: 16.0),
              tbKelamin(),
              SizedBox(height: 16.0),
              tbAgama(),
              SizedBox(height: 16.0),
              tbAlamat(),
              SizedBox(height: 16.0),
              tbEmail(),
              SizedBox(height: 20.0),
              tblSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget tbNama() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan Nama Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget tbTempat() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tempat Lahir',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan Tempat Lahir Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _tplahir = value!;
      },
    );
  }

  Widget tbTanggal() {
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

  Widget tbAlamat() {
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

  Widget tbEmail() {
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

  Widget tbKelamin() {
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
          _kelamin = value ?? '';  
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

  Widget tbAgama() {
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
          selectedAgama = value;  
          _agama = value ?? '';  
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

  Widget tblSimpan() {
    return ElevatedButton(
      onPressed: _submitForm, 
      child: Text('Simpan'),
    );
  }
}
