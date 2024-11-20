import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sportify_mobile/screens/menu.dart';
import 'package:sportify_mobile/widgets/left_drawer.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
	int _price = 0;
	String _description = "";
	int _stock = 0;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: const Text(
          'Form Tambah Produk Kamu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Color(0x17FFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
        ),
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color(0x17FFFFFF),
                    filled: true,
                    hintText: "Nama",
                    labelText: "Nama",                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelStyle:TextStyle(color: Colors.white, fontSize: 16.0),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    if(value.length > 255){
                      return "Nama produk tidak boleh lebih dari 255 karakter";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color(0x17FFFFFF),
                    filled: true,
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelStyle:TextStyle(color: Colors.white, fontSize: 16.0),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga produk tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga produk harus berupa angka!";
                    }
                    if (int.tryParse(value)! < 0) {
                      return "Harga produk harus berupa angka positif!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 4,
                  decoration: InputDecoration(
                    fillColor: Color(0x17FFFFFF),
                    filled: true,
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelStyle:TextStyle(color: Colors.white, fontSize: 16.0),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color(0x17FFFFFF),
                    filled: true,
                    hintText: "Stok",
                    labelText: "Stok",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelStyle:TextStyle(color: Colors.white, fontSize: 16.0),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Stok produk tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Stok produk harus berupa angka!";
                    }
                    if (int.tryParse(value)! < 0) {
                      return "Stok produk harus berupa angka positif!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/",
                          jsonEncode(<String, String>{
                              'name': _name,
                              'price': _price.toString(),
                              'description': _description,
                              'stock':_stock.toString()
                          // TODO: Sesuaikan field data sesuai dengan aplikasimu
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                              content: Text("Product baru berhasil disimpan!"),
                              ));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                          } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content:
                                      Text("Terdapat kesalahan, silakan coba lagi."),
                              ));
                          }
                        }
                      }
                  },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}