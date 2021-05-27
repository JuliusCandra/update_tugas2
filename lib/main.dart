import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Formulir Kelahiran",
    home: Pengalaman(),
  ));
}

class Pengalaman extends StatefulWidget {
  @override
  _PengalamanState createState() => _PengalamanState();
}

class _PengalamanState extends State<Pengalaman> {
  String groupValue = "";

  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerPengalaman = new TextEditingController();

  bool nilaiBox = false;

  String zodiak = "Capricon";

  void pilihGender(value) {
    setState(() {
      groupValue = value;
    });
  }

  void simpanData() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Pesan"),
            content: new Container(
              height: 200,
              child: new Column(
                children: [
                  new Text("Email : " + controllerEmail.text),
                  new Text("Alamat: " + controllerAlamat.text),
                  new Text("Pengalaman: " + controllerPengalaman.text),
                  new Text("Keahlian: " + groupValue),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Ok"),
                color: Colors.red,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candra Julius Sinaga"),
        leading: Icon(Icons.home),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Selamat datang. Di Formulir Pekerjaaan",
                      style: new TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email Harus Diisi";
                        } else if (!value.contains("@")) {
                          return 'email tidak valid';
                        }
                        return null;
                      },
                      controller: controllerEmail,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                        labelText: "Email Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Alamat  harus diisi ";
                        }
                        return null;
                      },
                      controller: controllerAlamat,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                        labelText: "Alamat  Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Pengalaman harus diisi";
                        }
                        return null;
                      },
                      controller: controllerPengalaman,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
                        labelText: "Pengalaman  Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      value: nilaiBox,
                      onChanged: (value) {
                        setState(() {
                          nilaiBox = value;
                        });
                      },
                      activeColor: Colors.blueAccent,
                      title: Text("Pekerja Keras"),
                      subtitle: Text("Ceklis ini jika anda pekerja keras"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pilih Tingkat Keahlian",
                      style: new TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    RadioListTile(
                        value: "Master",
                        title: Text(
                          "Master",
                          style: new TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        groupValue: groupValue,
                        onChanged: (value) {
                          pilihGender(value);
                        }),
                    RadioListTile(
                        value: "Menengah",
                        groupValue: groupValue,
                        title: Text(
                          "Menengah",
                          style: new TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onChanged: (value) {
                          pilihGender(value);
                        }),
                    RadioListTile(
                        value: "Pemula",
                        groupValue: groupValue,
                        title: Text(
                          "Pemula",
                          style: new TextStyle(fontSize: 20, color: Colors.black),
                        ),
                        onChanged: (value) {
                          pilihGender(value);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      color: Colors.black87,
                      elevation: 5,
                      child: Container(
                        height: 50,
                        child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              final valid = _formKey.currentState!.validate();
                              if (!valid) {
                                return;
                              }
                              simpanData();
                            },
                            child: Center(
                              child: Text(
                                "Simpan",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
