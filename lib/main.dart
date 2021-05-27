// choose file
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Flutter",
    home: FormProduk(),
  ));
}

class FormProduk extends StatefulWidget {
  @override
  _FormProdukState createState() => _FormProdukState();
}

class _FormProdukState extends State<FormProduk> {
  String _mau = "";

  String _title = "Untuk keperluan sendiri";
  String _subTitle = "Ceklis ini jika untuk keperluan sendiri";

  void _pilihJk(value) {
    setState(() {
      _mau = value;
    });
  }

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
                    new Text("Nama barang: " + controllerNamaProduk.text),
                    new Text("Harga: Rp " + controllerHargaProduk.text),
                    new Text("Kategory Barang: " + controllerKategoryBarang.text),
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
        leading: Icon(Icons.home),
        title: Text("Candra Julius Sinaga"),
        centerTitle: true,
        actions: [
          Icon(Icons.home)
        ],
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: controllerNamaProduk,
                        maxLength: 10,
                        decoration: new InputDecoration(
                          hintText: "contoh: Asus",
                          labelText: "Nama Barang",
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          } else if (value.length < 2) {
                            return "Nama terlalu pendek";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        controller: controllerHargaProduk,
                        decoration: new InputDecoration(
                          labelText: "Harga Barang",
                          hintText: "Contohnya Rp 200000",
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Harga tidak boleh kosong';
                          } else if (value.length < 3) {
                            return "Harga terlalu pendek";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controllerKategoryBarang,
                        maxLength: 12,
                        keyboardType: TextInputType.name,
                        decoration: new InputDecoration(
                          hintText: "contoh: Elektronik",
                          labelText: "Nama Kategory",
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Kategory tidak boleh kosong';
                          } else if (value.length < 3) {
                            return "Kategory terlalu pendek";
                          }
                          return null;
                        },
                      ),
                    ),
                    CheckboxListTile(
                      title: Text(_title),
                      subtitle: Text(_subTitle),
                      value: nilaiCheckBox,
                      activeColor: Colors.deepPurpleAccent,
                      onChanged: (value) {
                        setState(() {
                          nilaiCheckBox = value;
                        });
                      },
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(top: 20),
                    ),
                    new RadioListTile(
                      value: "Ya",
                      title: new Text("Ya"),
                      groupValue: _mau,
                      onChanged: (value) {
                        _pilihJk(value);
                      },
                      activeColor: Colors.blue,
                      subtitle: new Text("pilih ini jika anda beli"),
                    ),
                    new RadioListTile(
                      value: "Tidak",
                      title: new Text("Tidak"),
                      groupValue: _mau,
                      onChanged: (value) {
                        _pilihJk(value);
                      },
                      activeColor: Colors.blue,
                      subtitle: new Text("Pilih ini jika anda tidak beli"),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    RaisedButton(
                      child: Text("Tampilkan",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      color: Colors.red,
                      onPressed: () {
                        _submitData();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
