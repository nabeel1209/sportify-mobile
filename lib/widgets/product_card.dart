import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sportify_mobile/screens/list_productentry.dart';
import 'package:sportify_mobile/screens/login.dart';
import 'package:sportify_mobile/screens/productentry_form.dart';
import 'package:hugeicons/hugeicons.dart';

class ItemHomepage {
     final String name;
     final HugeIcon icon;

     ItemHomepage(this.name, this.icon);
}

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  final Color color; 
  
  const ItemCard(this.item, this.color, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
          );
          if (item.name == "Tambah Produk") {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryFormPage(),
              )
            );
          }
          else if (item.name == "Lihat Daftar Produk") {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => const ProductEntryPage()
                ),
            );
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://localhost:8000/auth/logout/");
            String message = response["message"];
            if (context.mounted) {
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(message),
                    ),
                );
              }
            }
          }
        },
        borderRadius: BorderRadius.circular(12),
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.icon,
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}