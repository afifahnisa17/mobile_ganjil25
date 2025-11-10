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
### **1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**

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

### **2. Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.**
  ```dart
  Future<Response> getData() async {
    const autority = 'www.googleapis.com';
    const path = '/books/v1/volumes/e-ZDDwAAQBAJ';
    Uri url = Uri.https(autority, path);
    return http.get(url);
  }
  ```

### **Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2".**

  <img src="/assets/gambar1.png">

### **3. Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!**

Dalam kode tersebut, fungsi substring(0, 450) digunakan untuk mengambil sebagian teks dari hasil respons API, yaitu 450 karakter pertama dari data yang diterima melalui value.body. Tujuannya agar teks yang ditampilkan di layar tidak terlalu panjang, karena respons dari API biasanya berbentuk JSON dengan ribuan karakter. Namun, pemanggilan substring seperti ini harus hati-hati, karena jika panjang string kurang dari 450 karakter, maka akan terjadi error RangeError (indeks di luar batas). Oleh karena itu, sebaiknya dilakukan pengecekan panjang string terlebih dahulu sebelum mengambil substring.

Sementara itu, bagian .catchError((_) { ... }) berfungsi untuk menangani kesalahan (error handling) yang mungkin terjadi selama proses asynchronous Future, seperti ketika koneksi internet terputus, URL salah, atau terjadi error lain pada bagian .then(). Jika terjadi kesalahan, blok catchError akan dijalankan dan variabel result diubah menjadi teks seperti 'An error occured', kemudian antarmuka pengguna diperbarui dengan setState() agar pesan tersebut muncul di layar. Dengan demikian, pengguna tetap mendapatkan umpan balik yang jelas ketika terjadi kegagalan. Secara keseluruhan, kombinasi substring dan catchError ini menunjukkan bagaimana Flutter menangani data dari API secara aman dan responsif terhadap kemungkinan error.

### **Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".**

![](./assets/praktikum1_codelab11.gif)

# PRAKTIKUM 2

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
              // setState(() {});
              // getData()
              // .then((value){
              //   result = value.body.toString().substring(0, 450);
              //   setState(() {});
              // }).catchError((_){
              //   result = 'An error occured';
              //   setState(() {
              //   });
              // });
              count();
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

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  Future count() async {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
}
```

# SOAL
### **4. Jelaskan maksud kode langkah 1 dan 2 tersebut!**

Kode tersebut berfungsi untuk menunjukkan cara kerja proses asynchronous di Dart menggunakan Future dan async/await. Tiga fungsi — returnOneAsync(), returnTwoAsync(), dan returnThreeAsync() — masing-masing menunggu selama tiga detik menggunakan Future.delayed() sebelum mengembalikan nilai 1, 2, dan 3. Fungsi count() kemudian memanggil ketiga fungsi tersebut secara berurutan dengan await, menjumlahkan hasilnya menjadi total 6, lalu menampilkannya di antarmuka pengguna dengan setState(). Tujuan utamanya adalah mensimulasikan proses yang memerlukan waktu, seperti pengambilan data dari API, dan menunjukkan bagaimana Flutter menunggu hasil secara bertahap sebelum memperbarui tampilan.

### **Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".**

![](./assets/praktikum2_codelab11.gif)

# PRAKTIKUM 3 - 1
### main.dart

```dart
import 'package:async/async.dart';

//tambahan di method class _FuturePageState
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}

//ganti isi pada onPressed
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
});
```

## SOAL
### **5. Jelaskan maksud kode langkah 2 tersebut!**

Kode ini digunakan untuk menunjukkan bagaimana kita bisa membuat dan mengendalikan Future secara manual.
Alih-alih menulis return 42 langsung di dalam fungsi async, Completer memungkinkan kita untuk:

- membuat Future kosong dulu,
- lalu menyelesaikannya di waktu yang kita tentukan (misalnya setelah delay, event lain, atau kondisi tertentu).

### **Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".**

![](./assets/praktikum3_codelab11.gif)

# PRAKTIKUM 3 - 2
### main.dart

```dart
// buat mthod calculate 2
Future calculate2() async {
    try {
      await new Future.delayed(const Duration(seconds : 5));
      completer.complete(42);
    } catch (_) {
      completer.completeError({});
    }
  }

//Ganti Kode On Pressed
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

# SOAL
### **6. Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!**

Kode ini memperlihatkan bagaimana Completer bisa digunakan untuk membuat dan menyelesaikan Future secara manual, baik dengan hasil sukses maupun error.
calculate2() mengontrol logika penundaan dan penyelesaian, sedangkan tombol GO! menunjukkan bagaimana Flutter menunggu hasil Future tersebut, memperbarui tampilan UI sesuai apakah proses berhasil atau gagal.

### **Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".**

![](./assets/praktikum3-2_codelab11.gif)

# PRAKTIKUM 4

### main.dart

```dart
//menambahkan kode ini
void returnFG(){
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }

// mengganti bagian on pressed
ElevatedButton(child: const Text('GO!'), onPressed: () {
  returnFG();
}),
```

# SOAL
### **7. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".**

![](./assets/praktikum4_codelab11.gif)