import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Tugas 2",
    home: FormPendaftaran(),
  ));
}

class FormPendaftaran extends StatefulWidget {
  @override
  _FormPendaftaranState createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  String _jk = "";

  String _title = "Belajar Dasar Flutter";
  String _subTitle = "Dart, widget, http";

  void _pilihJk(value) {
    setState(() {
      _jk = value;
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool nilaiCheckBox = false;

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerPhone = new TextEditingController();

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
                    new Text("Nama Lengkap: " + controllerNama.text),
                    new Text("Password: " + controllerPassword.text),
                    new Text("Nomor Telepon: " + controllerPhone.text),
                    new Text("Jenis Kelamin: " + _jk),
                    new Text("Title: " + _title + "\n" + "SubTitle: " + _subTitle),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                    color: Colors.red,
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.home), title: Text("Candra Julius Sinaga"), centerTitle: true),
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
                        controller: controllerNama,
                        maxLength: 10,
                        decoration: new InputDecoration(
                          hintText: "contoh: Candra Julius Sinaga",
                          labelText: "Nama Lengkap",
                          icon: Icon(Icons.people),
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLength: 8,
                        controller: controllerPassword,
                        obscureText: true,
                        decoration: new InputDecoration(
                          labelText: "Password",
                          icon: Icon(Icons.security),
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controllerPhone,
                        maxLength: 12,
                        keyboardType: TextInputType.phone,
                        decoration: new InputDecoration(
                          hintText: "contoh: 12345679010",
                          labelText: "Nomor Telepon",
                          icon: Icon(Icons.phone),
                          border: OutlineInputBorder(borderRadius: new BorderRadius.circular(5.0)),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nama telepon tidak boleh kosong';
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
                    new Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    RaisedButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
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
