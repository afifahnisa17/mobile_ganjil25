# PEMROGRAMAN ASYNCHRONOUS 🍕

<table>
  <tr>
    <td><b>Nama</b></td>
    <td>:</td>
    <td>Afifah Khoirunnisa</td>
  </tr>
  <tr>
    <td><b>Kelas</b></td>
    <td>:</td>
    <td>TI-3G</td>
  </tr>
  <tr>
    <td><b>NIM</b></td>
    <td>:</td>
    <td>2341720250</td>
  </tr>
  <tr>
    <td><b>No. Abs</b></td>
    <td>:</td>
    <td>02</td>
  </tr>
</table>  

---
# PRAKTIKUM 1
### main.dart
```dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Afifah')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(child: const Text('GO!'), onPressed: () {
              setState(() {});
              getData()
              .then((value){
                result = value.body.toString().substring(0, 450);
                setState(() {});
              }).catchError((_){
                result = 'An error occured';
                setState(() {
                });
              });
            }),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<Response> getData() async {
    const autority = 'www.googleapis.com';
    const path = '/books/v1/volumes/e-ZDDwAAQBAJ';
    Uri url = Uri.https(autority, path);
    return http.get(url);
  }
}
```

# SOAL
**1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**

```dart
lass _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Afifah')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(child: const Text('GO!'), onPressed: () {
              setState(() {});
              getData()
              .then((value){
                result = value.body.toString().substring(0, 450);
                setState(() {});
              }).catchError((_){
                result = 'An error occured';
                setState(() {
                });
              });
            }),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  ```

  **2. Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.**
  ```dart
  Future<Response> getData() async {
    const autority = 'www.googleapis.com';
    const path = '/books/v1/volumes/e-ZDDwAAQBAJ';
    Uri url = Uri.https(autority, path);
    return http.get(url);
  }
  ```

  **Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2".**
    <img src="/assets/gambar1.png">

**3. Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!**

Dalam kode tersebut, fungsi substring(0, 450) digunakan untuk mengambil sebagian teks dari hasil respons API, yaitu 450 karakter pertama dari data yang diterima melalui value.body. Tujuannya agar teks yang ditampilkan di layar tidak terlalu panjang, karena respons dari API biasanya berbentuk JSON dengan ribuan karakter. Namun, pemanggilan substring seperti ini harus hati-hati, karena jika panjang string kurang dari 450 karakter, maka akan terjadi error RangeError (indeks di luar batas). Oleh karena itu, sebaiknya dilakukan pengecekan panjang string terlebih dahulu sebelum mengambil substring.

Sementara itu, bagian .catchError((_) { ... }) berfungsi untuk menangani kesalahan (error handling) yang mungkin terjadi selama proses asynchronous Future, seperti ketika koneksi internet terputus, URL salah, atau terjadi error lain pada bagian .then(). Jika terjadi kesalahan, blok catchError akan dijalankan dan variabel result diubah menjadi teks seperti 'An error occured', kemudian antarmuka pengguna diperbarui dengan setState() agar pesan tersebut muncul di layar. Dengan demikian, pengguna tetap mendapatkan umpan balik yang jelas ketika terjadi kegagalan. Secara keseluruhan, kombinasi substring dan catchError ini menunjukkan bagaimana Flutter menangani data dari API secara aman dan responsif terhadap kemungkinan error.

**Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".**

![](./assets/praktikum1_codelab11.gif)
