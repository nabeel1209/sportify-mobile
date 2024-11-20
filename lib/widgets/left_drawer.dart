import 'package:flutter/material.dart';
import 'package:sportify_mobile/screens/list_productentry.dart';
import 'package:sportify_mobile/screens/menu.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sportify_mobile/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Sportify',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Ayo beli produk olahraga favoritmu di Sportify!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.white,),
            title: const Text('Halaman Utama', style: TextStyle(color: Colors.white)),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: HugeIcon(
              icon: HugeIcons.strokeRoundedAddCircle,
              color: Colors.white,
              size: 24.0,
            ),
            title: const Text('Tambah Produk',  style: TextStyle(color: Colors.white)),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductEntryFormPage(),
                )
              );
            },
          ),
          ListTile(
            leading: const HugeIcon(
              icon: HugeIcons.strokeRoundedPackage,
              color: Colors.white,
              size: 24.0,
            ),
            title: const Text('Daftar Produk', style: TextStyle(color: Colors.white)),
            onTap: () {
                // Route menu ke halaman mood
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}