import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Formulir Kelahiran",
        home: FormulirKelahiran(),
      )
  );
}

class FormulirKelahiran extends StatefulWidget {

  @override
  _FormulirKelahiranState createState() => _FormulirKelahiranState();
}

class _FormulirKelahiranState extends State<FormulirKelahiran> {

  String groupValue = "";

  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerTanggalLahir = new TextEditingController();
  TextEditingController controllerBulanLahir = new TextEditingController();
  TextEditingController controllerTahunlahir = new TextEditingController();

  bool nilaiBox = false;

  String zodiak = "Capricon";

  void pilihGender(value){
    setState(() {
      groupValue = value;
    });
  }

  void simpanData(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Pesan"),
        content: new Container(
          height: 200,
          child: new Column(
            children: [
              new Text("Tanggal lahir: " + controllerTanggalLahir.text),
              new Text("Bulan lahir: " + controllerBulanLahir.text),
              new Text("Tahun Lahir: " + controllerTahunlahir.text),
              new Text("Zodiak: " + zodiak),
              new Text("Gender: " + groupValue),
            ],
          ),
        ),
        actions: [
          RaisedButton(onPressed: (){
            Navigator.of(context).pop();
          },child: Text("Ok"),
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
                color: Colors.lightBlue,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.person,size: 50,color: Colors.white,),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Text("Selamat datang. Di Formulir Kelahiran",style: new TextStyle(
                      fontSize: 20,color: Colors.black87,
                    ),
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      maxLength: 2,
                      validator: (value){
                        if (value.isEmpty) {
                          return "Tanggal lahir harus diisi";
                        }
                        return null;
                      },
                      controller: controllerTanggalLahir,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.person,size: 40,),
                        hintText: "Masukkan Tanggal kelahiran anda",
                        labelText: "Tanggal lahir Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if (value.isEmpty){
                          return "Bulan lahir harus diisi ";
                        }
                        return null;
                      },
                      controller: controllerBulanLahir,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.person,size: 40,),
                        hintText: "Masukkan bulan kelahiran anda",
                        labelText: "bulan lahir Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      maxLength: 4,
                      validator: (value){
                        if (value.isEmpty){
                          return "Tahun Lahir harus diisi";
                        }else if (value.length < 4){
                          return "Karakter terlalu pendek";
                        }
                        return null;
                      },
                      controller: controllerTahunlahir,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)
                        ),
                        prefixIcon: Icon(Icons.person,size: 40,),
                        hintText: "Masukkan Tahun  kelahiran anda",
                        labelText: "Tahun lahir Anda",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelStyle: TextStyle(color: Colors.black87),
                      ),
                    ),

                    SizedBox(height: 20,),

                    CheckboxListTile(value: nilaiBox, onChanged: (value){
                        setState(() {
                          nilaiBox = value;
                        });
                      },
                      activeColor: Colors.blueAccent,
                      title: Text("Capricon"),
                      subtitle: Text("Pilih ini jika anda berzodiak capricon"),
                    ),

                    SizedBox(height: 20,),

                    Text("Pilih Gender",style: new TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold),),

                    RadioListTile(value: "laki-laki",
                        title: Text("Laki-Laki",style: new TextStyle(fontSize: 20,color: Colors.white),),
                        groupValue: groupValue, onChanged: (value){
                      pilihGender(value);
                    }),

                    RadioListTile(value: "Perempuan", groupValue: groupValue,
                        title: Text("Perempuan",style: new TextStyle(fontSize: 20,color: Colors.white),),
                        onChanged: (value){
                      pilihGender(value);
                    }),

                    SizedBox(height: 20,),

                    Card(
                      color: Colors.black87,
                      elevation: 5,
                      child: Container(
                        height: 50,
                        child: InkWell(
                          splashColor: Colors.white,
                          onTap: (){
                            final valid = _formKey.currentState.validate();
                            if (!valid){
                              return;
                            }
                            simpanData();
                          },
                          child:Center(
                          child: Text("Simpan",style: TextStyle(fontSize: 20,color: Colors.white),),
                        )
                        ),
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


