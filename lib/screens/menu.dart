import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:sportify_mobile/widgets/left_drawer.dart';
import 'package:sportify_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", HugeIcon(
      icon: HugeIcons.strokeRoundedPackage,
      color: Colors.black,
      size: 24.0,
    )),
    ItemHomepage("Tambah Produk", HugeIcon(
      icon: HugeIcons.strokeRoundedAddCircle,
      color: Colors.black,
      size: 24.0,
    )),
    ItemHomepage("Logout", HugeIcon(
      icon: HugeIcons.strokeRoundedLogout03,
      color: Colors.black,
      size: 24.0,
    )),
  ];
  final List<Color> colors = [
    Color(0XFF8CD867),
    Color(0XFF2FBF71),
    Color(0XFF3C844B)
  ];
  final intList = [0, 1, 2];
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Sportify',
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
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Sportify',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: intList.map((x) => ItemCard(items[x], colors[x])).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

