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

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements
- Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
    Di Flutter, `const` digunakan untuk mendeklarasikan objek atau widget sebagai compile-time constant. Artinya, objek tersebut dihitung atau dibuat saat kompilasi dan tidak perlu diinisialisasi ulang setiap kali aplikasi dijalankan. Hal ini sangat berguna terutama untuk widget yang tidak berubah, karena memungkinkan Flutter untuk mengoptimalkan performa aplikasi. Variabel `const` harus diinisialisasi dengan nilai yang sudah diketahui saat *compile time*. Dengan kata lain, nilainya harus benar-benar konstan dan tidak dapat bergantung pada perhitungan atau nilai yang hanya tersedia di runtime.
    - **Keuntungan Menggunakan `const` di Flutter**
        - **Penghematan Memori:** Objek yang dideklarasikan sebagai const hanya dibuat sekali dalam memori. Jika objek yang sama digunakan berkali-kali, Flutter akan merujuk pada objek yang sama daripada membuat duplikat, sehingga menghemat memori.
        - **Optimisasi oleh Flutter**: Flutter menggunakan optimisasi pada widget const. Jika sebuah widget ditandai sebagai const, Flutter tidak akan merender ulang widget tersebut kecuali benar-benar diperlukan. Hal ini mempercepat proses rendering UI.
    - **Kapan Sebaiknya Menggunakan `const`**
        - **Widget Stateless atau yang Tidak Berubah**: Jika widget tidak akan berubah setelah dibuat, gunakan `const` untuk mendeklarasikannya. Misalnya, pada widget seperti `Text`, `Icon`, atau `Padding` yang menggunakan nilai tetap.
        - **Nilai Konstan**: Gunakan `const` untuk mendeklarasikan nilai konstan yang tidak berubah selama runtime, seperti warna, ukuran, atau string yang tetap.
        - **Dalam Constructor Widget**: Saat membuat widget yang dapat menerima nilai konstan, seperti `Container` yang memiliki nilai `color`, `width`, dan `height` yang tetap.
    - **Kapan Sebaiknya Tidak Menggunakan `const`**
        - **Nilai atau Objek Dapat Berubah**: Jika Anda memiliki widget atau variabel yang bergantung pada input pengguna atau nilai lain yang berubah selama runtime, maka tidak disarankan untuk menggunakan `const`.
        - **Nilai Tidak Diketahui saat Compile-Time**: Jika nilai baru diketahui saat aplikasi berjalan (runtime), misalnya dari API atau input pengguna, Anda tidak bisa menggunakan `const`. `const` hanya bekerja dengan nilai yang diketahui saat kompilasi.
- Jelaskan dan bandingkan penggunaan *Column* dan *Row* pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
    -  `Column` digunakan untuk menempatkan widget secara vertikal (atas ke bawah)
        Contoh Implementasi :
        ```dart
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('Hello,'),
                Text('Welcome to Flutter!'),
                Icon(Icons.thumb_up, color: Colors.blue),
            ],
        )
        ``` 
    -  `Row` digunakan untuk menempatkan widget secara horizontal (kiri ke kanan)
        Contoh Implementasi :
        ```dart
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Icon(Icons.home, color: Colors.red),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.person, color: Colors.green),
            ],
        )
        ``` 
- Sebutkan apa saja elemen input yang kamu gunakan pada halaman *form* yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
    Saya menggunakan `TextFormField` sebagai input pada halaman *form* yang saya buat. Berikut adalah beberapa elemen input pada flutter yang saya ketahui.
    - `TextField` dan `TextFormField`: Untuk input teks atau angka sederhana (seperti nama, alamat, atau nomor telepon).
    - `Checkbox` atau `Switch`: Untuk memilih antara dua opsi (ya/tidak (`Checkbox`), aktif/nonaktif (`Switch`)).
    - `Radio`: Untuk memilih satu opsi dari beberapa pilihan.
    - `DropdownButton`: Untuk memilih satu dari beberapa opsi dalam bentuk dropdown.
    - `Slider` dan `RangeSlider`: Untuk input nilai yang berkisar (misalnya, volume atau tingkat kecerahan).
    - `DatePicker` dan `TimePicker`: Untuk input tanggal dan waktu.

- Bagaimana cara kamu mengatur tema (*theme*) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
    Mengatur tema dalam Flutter adalah cara yang efektif untuk menjaga konsistensi tampilan di seluruh aplikasi. Dengan menggunakan `ThemeData`, kita bisa mengatur warna, font, ukuran teks, gaya tombol, dan elemen UI lainnya secara konsisten.
    Cara mengaturnya adalah dengan menambahkan value pada atribut theme pada `MaterialApp` yang ada pada `main.dart`.
    ```dart
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3C844B), 
          secondary: const Color.fromARGB(255, 18,18,18)
        ),
        useMaterial3: true,
    )
    ```
- Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
    Menggunakan class `Navigator` dengan `static` `function` yaitu,
    - `push()` : Menambahkan layar baru ke tumpukan navigasi, sehingga pengguna diarahkan ke halaman baru.
    - `pushReplacement()` : Mengganti halaman saat ini dengan halaman baru, menghapus halaman saat ini dari tumpukan.
    - `pushNamed()` : Mengganti halaman saat ini dengan halaman baru, menghapus halaman saat ini dari tumpukan.
    - `pop()` : Menghapus (mengeluarkan) halaman paling atas dari tumpukan, sehingga kembali ke halaman sebelumnya.
    - `pushAndRemoveUntil()` : Mendorong halaman baru ke tumpukan dan menghapus semua halaman di tumpukan hingga kondisi tertentu terpenuhi.
    Dalam tugas ini saya menggunakan beberapa navigasi yaitu,
    ```dart
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => ProductEntryFormPage(),
        )
    );
    ```
    ```dart
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductEntryFormPage(),
        )
    );
    ```