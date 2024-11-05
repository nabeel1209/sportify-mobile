# Tugas 7: Elemen Dasar Flutter

- Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
    - *Stateless Widget* merupakan *widget* yang tidak mempunyai *state* yang dapat berubah-ubah serta tidak otomatis ter-*refresh* jika sebuah *state*(variabel) berubah nilainya.
    - *Stateful Widget* merupakan *widget* yang mempunyai *state* yang dapat berubah-ubah serta secara otomatis ter-*refresh* jika sebuah *state*(variabel) berubah nilainya (contoh pada *web dev* : seperti pada React dengan `useEffect` serta `useState`).
- Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
    - **Scaffold**
        Scaffold adalah widget utama untuk membuat sebuah halaman pada flutter, scaffold ini memiliki beberapa parameter yang biasa kita gunakan seperti appBar untuk membuat AppBar, body untuk bagian tubuhnya, atau kita juga bisa menambahkan floating action bar, maupun mengganti warna background bodynya.
    - **Stateless**
        Stateless Widget adalah widget yang berfungsi untuk menampilkan hal-hal yang sifatnya statis mudahnya setelah data ditampilkan maka kita tidak akan merubahnya lagi.
    - **Stateful**
        Stateful Widget adalah widget yang digunakan untuk menampilkan data-data yang dinamis atau data yang kita telah tampilkan sewaktu-waktu dapat mengalami perubahan.
    - **Column**
        Widget ini akan mengarah secara vertikal atau dari atas kebawah, widget ini juga menggunakan property children artinya widget ini bisa diisi oleh banyak widget.
    - **Center**
        Center berfungsi agar posisi widget yang kita buat berada ditengah.
    - **Text**
        Text berfungsi untuk menampilkan sebuah teks biasa, atau bisa kita berikan style dengan menambahkan property style.
    - **Container**
        Container merupakan widget yang fungsinya untuk membungkus widget lain sehingga dapat diberikan nilai seperti margin, padding, warna background, atau dekorasi.
    - **Inkwell**
        Inkwell berguna untuk menambahkan action pada widget seperti action onTap.
- Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    Dalam Flutter, `setState()` adalah fungsi yang digunakan untuk memberitahukan framework bahwa ada perubahan pada suatu state atau kondisi dalam widget, yang mengakibatkan tampilan (UI) perlu diperbarui. Fungsi ini umumnya digunakan dalam `StatefulWidget`, di mana komponen UI-nya bisa berubah-ubah berdasarkan kondisi tertentu. Fungsi `setState()` dapat mempengaruhi semua variabel yang dideklarasikan dalam kelas `State` dari suatu `StatefulWidget`. Variabel-variabel ini biasanya dideklarasikan di dalam kelas `_MyWidgetState` atau kelas turunan lain dari `State`. Variabel-variabel tersebut sering kali merepresentasikan kondisi aplikasi yang bisa berubah dan memerlukan pembaruan pada tampilan (UI).
- Jelaskan perbedaan antara const dengan `final`.
    Nilai dari variabel `final` dapat ditentukan saat *runtime* (waktu eksekusi). Jadi, kita bisa menginisialisasi `final` dengan nilai yang diperoleh selama program berjalan. Variabel `const` harus diinisialisasi dengan nilai yang sudah diketahui saat *compile time* Dengan kata lain, nilainya harus benar-benar konstan dan tidak dapat bergantung pada perhitungan atau nilai yang hanya tersedia di runtime.
- Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
    - Membuat tiga tombol sederhana dengan ikon dan teks untuk:
        - Melihat daftar produk (Lihat Daftar Produk)
        - Menambah produk (Tambah Produk)
        - Logout (Logout)
        1. Mengubah isi dari `main.dart` dengan code berikut
            ```dart
            import 'package:flutter/material.dart';
            import 'package:sportify_mobile/menu.dart';

            void main() {
                runApp(const MyApp());
            }

            class MyApp extends StatelessWidget {
                const MyApp({super.key});

                // This widget is the root of your application.
                @override
                Widget build(BuildContext context) {
                    return MaterialApp(
                    title: 'Sportify',
                    theme: ThemeData(
                        // This is the theme of your application.
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                            primary: const Color(0xFF3C844B), 
                            secondary: const Color.fromARGB(255, 18,18,18)),
                        useMaterial3: true,
                    ),
                    home: MyHomePage(),
                    );
                }
            }
            ```
            Note : menggunakan *stateless widget* karena kita tidak perlu me-*refresh* pagenya setiap ada perubahan *state*.
        2. Membuat file `menu.dart` pada folder `lib` yang berisikan kode berikut
            ```dart
            import 'package:flutter/material.dart';
            import 'package:hugeicons/hugeicons.dart';
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
                    title: const Text(
                    'Sportify',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                    backgroundColor: Color(0x17FFFFFF),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                    ),
                ),
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
                    return Material(
                    // Menentukan warna latar belakang dari tema aplikasi.
                    color: color,
                    // Membuat sudut kartu melengkung.
                    borderRadius: BorderRadius.circular(12),
                    
                    child: InkWell(
                        // Aksi ketika kartu ditekan.
                        onTap: () {
                        // Menampilkan pesan SnackBar saat kartu ditekan.
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                            SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                            );
                        },
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
            ```
    - Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
        - Memunculkan Snackbar dengan tulisan:
            - "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
            - "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
            - "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.
        1. Menambahkan atribut `color` dengan tipe data `Color` untuk mendefinisikan warna yang berbeda pada setiap `ItemCard`.
        2. Membuat list yang berisikan object `Color` yang akan dimap ke dalam object `ItemCard` bersamaan dengan `ItemHomePage`
        3. Menambahkan kode dibawah ini pada ItemCard
            ```dart
            @override
            Widget build(BuildContext context) {
                return Material(
                color: color,
                // Membuat sudut kartu melengkung.
                borderRadius: BorderRadius.circular(12),
                
                child: InkWell(
                    // Aksi ketika kartu ditekan.
                    onTap: () {
                    // Menampilkan pesan SnackBar saat kartu ditekan.
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                        );
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
            ```
            Note: Menggunakan widget `InkWell` agar dapat menambahkan *action* pada saat button ditekan. Menambahkan 
            ```dart
            onTap: () {
                    // Menampilkan pesan SnackBar saat kartu ditekan.
                    ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                        );
                    },
            ```
            pada `InkWell` untuk mendefinisikan fungsi yang berguna untuk memunculkan `SnackBar` dengan pesan 'Kamu telah menekan tombol ${item.name}!' (item.name merupakan atribut yang dimiliki `ItemHomePage`) saat button ditekan. 