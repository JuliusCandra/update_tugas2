import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormulirKeahlian(),
  ));
}

class FormulirKeahlian extends StatefulWidget {
  @override
  _FormulirKeahlianState createState() => _FormulirKeahlianState();
}

class _FormulirKeahlianState extends State<FormulirKeahlian> {
  final _formKey = GlobalKey<FormState>();
  bool nilaiCheckBox = false;

  TextEditingController controllerNamaProduk = new TextEditingController();
  TextEditingController controllerHargaProduk = new TextEditingController();
  TextEditingController controllerKategoryBarang = new TextEditingController();

  void _submitData() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Konfirmasi"),
              content: new Container(
                height: 200,
                child: new Column(
                  children: [
                    new Text("Nama: " + controllerNamaProduk.text),
                    new Text("Pekerjaan Terdahulu: Rp " + controllerHargaProduk.text),
                    new Text("Pengalaman: " + controllerKategoryBarang.text),
                    new Text("Pilihan Anda: " + _mau),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                    color: Colors.red,
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Formulir Keahlian"),
          backgroundColor: Colors.blue,
          leading: Icon(Icons.person),
        ),
        body: ListView(
          children: [
            Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(labelText: "Nama lengkap"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Nama harus diisi";
                          }
                          return null;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Pekerjaan Anda Dahulu"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Pekerjaan harus diisi";
                          }
                          return null;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Pengalaman Anda"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Pengalaman Harus Diisi";
                          }
                          return null;
                        },
                      ),
                      CheckboxListTile(
                        title: Text("Pekerja Keras"),
                        subtitle: Text("Pilih ini jika anda pekerja keras"),
                        value: nilaiCheckBox,
                        activeColor: Colors.deepOrange,
                        onChanged: (value) {
                          setState(() {
                            nilaiCheckBox = value;
                          });
                        },
                      ),
                      new RadioListTile(
                        value: "Laki-Laki",
                        title: new Text("laki-laki"),
                        groupValue: _jk,
                        onChanged: (value) {
                          _pilihJk(value);
                        },
                        activeColor: Colors.blue,
                        subtitle: new Text("pilih ini jika anda laki-laki"),
                      ),
                      new RadioListTile(
                        value: "Perempuan",
                        title: new Text("Perempuan"),
                        groupValue: _jk,
                        onChanged: (value) {
                          _pilihJk(value);
                        },
                        activeColor: Colors.blue,
                        subtitle: new Text("Pilih ini jika anda perempuan"),
                      ),
                      RaisedButton(
                        color: Colors.red,
                        child: Text(
                          "Masuk",
                          style: new TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          _submitData();
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
