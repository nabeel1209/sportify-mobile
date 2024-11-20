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

# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

- Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
    Membuat model untuk pengambilan atau pengiriman data JSON penting untuk memastikan bahwa data yang diterima atau dikirim sesuai dengan struktur yang diharapkan. Model membantu dalam validasi dan deserialisasi data JSON menjadi objek yang dapat digunakan dalam aplikasi. Jika kita tidak membuat model terlebih dahulu, kemungkinan besar akan terjadi error karena data yang diterima mungkin tidak sesuai dengan yang diharapkan, sehingga menyebabkan kesalahan saat mengakses atribut atau metode dari data tersebut.
- Jelaskan fungsi dari library `http` yang sudah kamu implementasikan pada tugas ini
    Library `http` digunakan untuk melakukan permintaan HTTP ke server. Dalam tugas ini, library `http` digunakan untuk mengirim permintaan GET dan POST ke server Django, mengambil data JSON, dan mengirim data JSON. Library ini menyediakan cara yang mudah untuk berkomunikasi dengan server dan menangani respons HTTP.
- Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    `CookieRequest` adalah kelas yang digunakan untuk mengelola permintaan HTTP yang memerlukan autentikasi berbasis *cookie*. Kelas ini menyimpan *cookie* yang diterima dari server dan mengirimkannya kembali pada permintaan berikutnya untuk menjaga sesi pengguna. Instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter agar semua permintaan HTTP yang memerlukan autentikasi dapat menggunakan *cookie* yang sama, sehingga sesi pengguna tetap konsisten di seluruh aplikasi.
- Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    Mekanisme pengiriman data dimulai dari input pengguna di aplikasi Flutter, misalnya melalui form. Data yang diinput kemudian dikirim ke server menggunakan permintaan HTTP (POST). Server menerima data, memprosesnya, dan mengirimkan respons kembali ke aplikasi Flutter. Aplikasi Flutter kemudian menerima respons tersebut, menguraikan data JSON yang diterima, dan menampilkan data tersebut di UI.

- Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    1. Login: Pengguna memasukkan username dan password di aplikasi Flutter. Data ini dikirim ke server Django menggunakan permintaan POST. Django memverifikasi kredensial dan, jika valid, mengirimkan cookie sesi kembali ke Flutter. Flutter menyimpan cookie ini untuk permintaan berikutnya.
    2. Register: Pengguna memasukkan informasi pendaftaran di aplikasi Flutter. Data ini dikirim ke server Django menggunakan permintaan POST. Django membuat akun baru dan mengirimkan respons kembali ke Flutter. Jika pendaftaran berhasil, pengguna diarahkan ke halaman login.
    3. Logout: Pengguna mengklik tombol logout di aplikasi Flutter. Flutter mengirim permintaan ke server Django untuk menghapus sesi. Django menghapus sesi dan mengirimkan respons kembali ke Flutter. Flutter kemudian menghapus cookie sesi dan mengarahkan pengguna ke halaman login.

- Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    - Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
    - Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
        1. Menambahkan package `provider` serta package `pbp_django_auth` pada project flutter.
        2. Membuat file `register.dart` pada project flutter pada folder `screens` yang berisi kode dibawah ini
        ```dart
        import 'dart:convert';
        import 'package:flutter/material.dart';
        import 'package:sportify_mobile/screens/login.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        class RegisterPage extends StatefulWidget {
        const RegisterPage({super.key});

        @override
        State<RegisterPage> createState() => _RegisterPageState();
        }

        class _RegisterPageState extends State<RegisterPage> {
        final _usernameController = TextEditingController();
        final _passwordController = TextEditingController();
        final _confirmPasswordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            appBar: AppBar(
                centerTitle: true,
                title: const Text(
                'Register',
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
            body: Center(
                child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                    color: Color(0x17FFFFFF),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                        const Text(
                            'Register',
                            style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                        ),
                        const SizedBox(height: 30.0),
                        TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color:Colors.white
                            )
                            ),
                            style: TextStyle(
                            color: Colors.white),
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color:Colors.white
                            )
                            ),
                            style: TextStyle(
                            color: Colors.white
                            ),
                            obscureText: true,
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color:Colors.white
                            )
                            ),
                            style: TextStyle(
                            color: Colors.white
                            ),
                            obscureText: true,
                            validator: (value) {
                            if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                            }
                            return null;
                            },
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                            String username = _usernameController.text;
                            String password1 = _passwordController.text;
                            String password2 = _confirmPasswordController.text;

                            // Cek kredensial
                            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                            // Untuk menyambungkan Android emulator dengan Django pada localhost,
                            // gunakan URL http://10.0.2.2/
                            final response = await request.postJson(
                                "http://localhost:8000/auth/register/",
                                jsonEncode({
                                    "username": username,
                                    "password1": password1,
                                    "password2": password2,
                                }));
                            if (context.mounted) {
                                if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                    content: Text('Successfully registered!'),
                                    ),
                                );
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage()),
                                );
                                } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                    content: Text('Failed to register!'),
                                    ),
                                );
                                }
                            }
                            },
                            style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text('Register'),
                        ),
                        ],
                    ),
                    ),
                ),
                ),
            ),
            );
        }
        }
        ```
        3. Menambahkan library `django-cors-headers` pada project Django.
        4. Membuat app baru yang bernama `authentication` yang nantinya akan berisikan views untuk `login`, `register`, serta `logout`.
        5. Menambahkan `INSTALLED_APPS` pada `settings.py` yang ada pada folder `sportify` dengan `authentication` dan `corsheaders`.
        6. Menambahkan `corsheaders.middleware.CorsMiddleware` ke dalam `MIDDLEWARE` pada `settings.py` yang ada pada folder `sportify`.
        7. Menambahkan path pada `urls.py` yang ada pada folder `sportify` dengan 
        ```python
        path('auth/', include('authentication.urls')),
        ```
        8. Menambahkan beberapa variabel pada `settings.py` yang ada pada folder `sportify`.
        ```python
        CORS_ALLOW_ALL_ORIGINS = True
        CORS_ALLOW_CREDENTIALS = True
        CSRF_COOKIE_SECURE = True
        SESSION_COOKIE_SECURE = True
        CSRF_COOKIE_SAMESITE = 'None'
        SESSION_COOKIE_SAMESITE = 'None'
        ```
        8. Membuat views `register` pada `views.py` yang ada pada folder `authentication` yang berisikan 
        ```python
        @csrf_exempt
        def register(request):
            if request.method == 'POST':
                data = json.loads(request.body)
                username = data['username']
                password1 = data['password1']
                password2 = data['password2']

                # Check if the passwords match
                if password1 != password2:
                    return JsonResponse({
                        "status": False,
                        "message": "Passwords do not match."
                    }, status=400)
                
                # Check if the username is already taken
                if User.objects.filter(username=username).exists():
                    return JsonResponse({
                        "status": False,
                        "message": "Username already exists."
                    }, status=400)
                
                # Create the new user
                user = User.objects.create_user(username=username, password=password1)
                user.save()
                
                return JsonResponse({
                    "username": user.username,
                    "status": 'success',
                    "message": "User created successfully!"
                }, status=200)
            
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Invalid request method."
                }, status=400)
                    
        ```
        10. Menambahkan path pada file `urls.py` yang ada pada folder `authentication`
        ```python
        urlpatterns = [
            ...,
            path('register/', register, name='register'),
            ...,
        ]        
        ```
    - Membuat halaman login pada proyek tugas Flutter.
        1. Membuat file `login.dart` pada folder `screens` yang berisikan
        ```dart
        import 'package:sportify_mobile/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        import 'package:sportify_mobile/screens/register.dart';

        void main() {
        runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xFF3C844B), 
                secondary: const Color.fromARGB(255, 18,18,18)
                ),
                useMaterial3: true,
            ),
            home: const LoginPage(),
            );
        }
        }

        class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        State<LoginPage> createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();

            return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            appBar: AppBar(
                centerTitle: true,
                title: const Text(
                'Login',
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
            body: Center(
                child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                    color: Color(0x17FFFFFF),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        const Text(
                            'Login',
                            style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                            ),
                        ),
                        const SizedBox(height: 30.0),
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color:Colors.white
                            )
                            ),
                            style: TextStyle(
                            color: Colors.white
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            labelStyle: TextStyle(
                                color: Colors.white
                            ),
                            hintStyle: TextStyle(
                                color:Colors.white
                            )
                            
                            ),
                            style: TextStyle(
                            color: Colors.white
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            // Cek kredensial
                            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                            // Untuk menyambungkan Android emulator dengan Django pada localhost,
                            // gunakan URL http://10.0.2.2/
                            final response = await request
                                .login("http://localhost:8000/auth/login/", {
                                'username': username,
                                'password': password,
                            });

                            if (request.loggedIn) {
                                String message = response['message'];
                                String uname = response['username'];
                                if (context.mounted) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                );
                                ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("$message Selamat datang, $uname.")),
                                    );
                                }
                            } else {
                                if (context.mounted) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                    title: const Text('Login Gagal'),
                                    content: Text(response['message']),
                                    actions: [
                                        TextButton(
                                        child: const Text('OK', style: TextStyle( color: Colors.white),),
                                        onPressed: () {
                                            Navigator.pop(context);
                                        },
                                        ),
                                    ],
                                    backgroundColor: Theme.of(context).colorScheme.primary,
                                    ),
                                );
                                }
                            }
                            },
                            style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text('Login'),
                        ),
                        const SizedBox(height: 36.0),
                        GestureDetector(
                            onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                            );
                            },
                            child: Text(
                            'Don\'t have an account? Register',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16.0,
                            ),
                            ),
                        ),
                        ],
                    ),
                    ),
                ),
                ),
            ),
            );
        }
        }
        ```
        2. Mengubah home page pada project flutter menjadi `LoginPage` sehingga saat *user* masuk ke aplikasi akan langsung masuk ke dalam `LoginPage` bukan `HomePage`.
        ```dart
        home: const LoginPage(),
        ```
    - Membuat model kustom sesuai dengan proyek aplikasi Django.
        1. Menggunakan data JSON yang sebelumnya ada pada project Django lalu menginputnya pada Quicktype untuk membuat model pada dart.
        2. Membuat file `product_entry.dart` pada folder `models` yang berisikan (copy dari Quicktype)
        ```dart
        // To parse this JSON data, do
        //
        //     final productEntry = productEntryFromJson(jsonString);

        import 'dart:convert';

        List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

        String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

        class ProductEntry {
            String model;
            String pk;
            Fields fields;

            ProductEntry({
                required this.model,
                required this.pk,
                required this.fields,
            });

            factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
                model: json["model"],
                pk: json["pk"],
                fields: Fields.fromJson(json["fields"]),
            );

            Map<String, dynamic> toJson() => {
                "model": model,
                "pk": pk,
                "fields": fields.toJson(),
            };
        }

        class Fields {
            int user;
            String name;
            int price;
            String description;
            int stock;

            Fields({
                required this.user,
                required this.name,
                required this.price,
                required this.description,
                required this.stock,
            });

            factory Fields.fromJson(Map<String, dynamic> json) => Fields(
                user: json["user"],
                name: json["name"],
                price: json["price"],
                description: json["description"],
                stock: json["stock"],
            );

            Map<String, dynamic> toJson() => {
                "user": user,
                "name": name,
                "price": price,
                "description": description,
                "stock": stock,
            };
        }
        ```
    - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy. Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
        Membuat file `list_productentry.dart` pada folder `screens` yang berisikan.
        ```dart
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        import 'package:sportify_mobile/models/product_entry.dart';
        import 'package:sportify_mobile/widgets/left_drawer.dart';

        class ProductEntryPage extends StatefulWidget {
        const ProductEntryPage({super.key});

        @override
        State<ProductEntryPage> createState() => _ProductEntryPageState();
        }

        class _ProductEntryPageState extends State<ProductEntryPage> {
        Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
            final response = await request.get('http://localhost:8000/json/');
            
            // Melakukan decode response menjadi bentuk json
            var data = response;
            
            // Melakukan konversi data json menjadi object ProductEntry
            List<ProductEntry> listProduct = [];
            for (var d in data) {
                if (d != null) {
                    listProduct.add(ProductEntry.fromJson(d));
                }
            }
            return listProduct;
        }

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Product Entry List'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(request),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            'Belum ada data product pada sportify',
                            style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                        margin:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                ),
                            ),
                            //!! ganti sesuai
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.price}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.description}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.stock}")
                            ],
                        ),
                        ),
                    );
                    }
                }
                },
            ),
            );
        }
        }
        ```
    
    - Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item. Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item. Tampilkan seluruh atribut pada model item kamu pada halaman ini. Tambahkan tombol untuk kembali ke halaman daftar item.
        1. Menambahkan file `product_detail.dart` pada folder `screens` yang berisikan
        ```dart
        import 'package:flutter/material.dart';
        import 'package:sportify_mobile/models/product_entry.dart';

        class ProductDetailPage extends StatefulWidget {
        final ProductEntry product;
        const ProductDetailPage({super.key, required this.product});

        @override
        State<ProductDetailPage> createState() => _ProductDetailPageState();
        }

        class _ProductDetailPageState extends State<ProductDetailPage> {
        @override
        Widget build(BuildContext context) {
            return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            appBar: AppBar(
                title: Text(
                widget.product.fields.name,
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
            body: Center(
                child: Column(
                children: [
                    Text(widget.product.fields.name, style: TextStyle(color: Colors.white)),
                    Text(widget.product.fields.price.toString(), style: TextStyle(color: Colors.white),),
                    Text(widget.product.fields.description, style: TextStyle(color: Colors.white),),
                    Text(widget.product.fields.stock.toString(), style: TextStyle(color: Colors.white),),
                ],
                ),
            )
            );
        }
        }
        ``` 
        2. Mengganti isi dari file `list_productentry.dart` menjadi 
        ```dart
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';
        import 'package:sportify_mobile/models/product_entry.dart';
        import 'package:sportify_mobile/screens/product_detail.dart';
        import 'package:sportify_mobile/widgets/left_drawer.dart';

        class ProductEntryPage extends StatefulWidget {
        const ProductEntryPage({super.key});

        @override
        State<ProductEntryPage> createState() => _ProductEntryPageState();
        }

        class _ProductEntryPageState extends State<ProductEntryPage> {
        Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
            // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
            final response = await request.get('http://localhost:8000/json/');
            
            // Melakukan decode response menjadi bentuk json
            var data = response;
            
            // Melakukan konversi data json menjadi object ProductEntry
            List<ProductEntry> listProduct = [];
            for (var d in data) {
            if (d != null) {
                listProduct.add(ProductEntry.fromJson(d));
            }
            }
            return listProduct;
        }

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                title: const Text('Product Entry List'),
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(request),
                builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            'Belum ada data product pada sportify',
                            style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                    } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => new GestureDetector(
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: snapshot.data![index])
                            )
                            );
                        },
                        child: 
                            Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                "${snapshot.data![index].fields.name}",
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                ),
                                ),
                                //!! ganti sesuai
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.price}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.description}"),
                                const SizedBox(height: 10),
                                Text("${snapshot.data![index].fields.stock}")
                            ],
                            ),
                        ),
                        )
                    );
                    }
                }
                },
            ),
            );
        }
        }
        ```
    
    - Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
        Sudah terimplementasi pada `/json` yang ada pada Django server saat dijalankan. Karena telah melakukan `.filter(user=request.user)` pada `views.py`
    