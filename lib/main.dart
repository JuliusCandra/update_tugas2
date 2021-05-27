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

  String _jk = "";

  void _pilihJk(value) {
    setState(() {
      _jk = value;
    });
  }

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPekerjaan = new TextEditingController();
  TextEditingController controllerPengalaman = new TextEditingController();

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
                    new Text("Nama: " + controllerNama.text),
                    new Text("Pekerjaan Terdahulu: Rp " + controllerPekerjaan.text),
                    new Text("Pengalaman: " + controllerPengalaman.text),
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
                      TextFormField(
                        controller: controllerNama,
                        decoration: InputDecoration(labelText: "Nama lengkap"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Nama harus diisi";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: controllerPekerjaan,
                        decoration: InputDecoration(labelText: "Pekerjaan Anda Dahulu"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Pekerjaan harus diisi";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: controllerPengalaman,
                        decoration: InputDecoration(labelText: "Pengalaman Anda"),
                        validator: (String value) {
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
