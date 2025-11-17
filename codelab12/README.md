# LANJUTAN STATE MANAGEMENT DENGAN STREAMS 🎏

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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Afifah',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

### stream.dart

```dart
import 'package:flutter/material.dart';

class ColorStream{
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.red
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
    });
  }
}
```

# SOAL
### 1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda. Gantilah warna tema aplikasi sesuai kesukaan Anda.

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Afifah',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const StreamHomePage(),
    );
  }
```

### 2. Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

```dart
    Colors.indigo,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.red
```

### 3. Jelaskan fungsi keyword yield* pada kode tersebut! Apa maksud isi perintah kode tersebut?
yield* digunakan untuk meneruskan semua data yang dihasilkan oleh Stream.periodic ke dalam stream getColors().
Fungsi ini mengirim satu warna setiap 1 detik. yield* hanya meneruskan warna-warna yang dibuat oleh Stream.periodic.
Index warna dibuat berulang (loop) dengan memakai operasi modulo.


### 4. Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![](./assets/praktikum1_codelab12.gif)

### 5. Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !
listen digunakan ketika kamu ingin mendengarkan Stream secara terus-menerus tanpa menghentikan alur program. Begitu ada data baru, callback-nya langsung dipanggil. Ini cocok kalau kamu ingin Stream berjalan di “background” dan UI tetap responsif, seperti contohmu yang langsung mengubah warna setiap kali Stream mengirim warna baru.

Sebaliknya, await for digunakan jika kamu ingin menunggu data Stream secara berurutan dalam alur async. Kode setelah await for tidak akan berjalan sampai seluruh Stream selesai. Ini seperti kamu “menonton” Stream dari awal sampai selesai, satu data per satu data, secara teratur. Jadi await for memblokir fungsi async tersebut sampai Stream selesai, sedangkan listen tidak memblokir dan membiarkan program berjalan sambil menerima event.

### 6. Jelaskan maksud kode langkah 8 dan 10 tersebut!
Langkah 8:
Pada langkah ini, widget sedang menyiapkan stream yang akan didengarkan.
1. numberStream = NumberStream();
Membuat objek stream khusus yang kamu rancang untuk mengirim angka.
2. numberStreamController = numberStream.controller;
Mengambil controller, yaitu alat untuk mengatur kapan data baru dikirim ke stream.
3. Stream stream = numberStreamController.stream;
Mengambil aliran datanya (stream-nya).
4. stream.listen((event) { ... })
Mulai mendengarkan stream.
Setiap ada angka baru yang dikirim (misalnya dari langkah 10), fungsi listen akan dipanggil.
5. setState(() { lastNumber = event; });
Angka yang diterima (event) disimpan ke variabel lastNumber, lalu UI diperbarui.

Langkah 10:
Pada langkah ini, fungsi membuat angka random dari 0 sampai 9. Angka tersebut kemudian dikirim ke stream melalui addNumberToSink(). Artinya, setiap kali fungsi ini dipanggil (misalnya saat menekan tombol), akan ada angka baru yang masuk ke stream.

### Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![](./assets/Praktikum2_codelab12.gif)

### Soal 7. Jelaskan maksud kode langkah 13 sampai 15 tersebut!

Pemanggilan addError() mengirimkan sebuah error event ke dalam stream menggunakan controller.sink.addError("error"). Artinya, aliran data tidak mengirim angka seperti biasa, tetapi mengirim sinyal bahwa terjadi kesalahan.

Bagian .onError((error) { ... }) adalah error handler pada sisi penerima stream. Ketika stream menerima error tadi, blok ini langsung dijalankan sebagai respon terhadap event error tersebut.

Dalam contoh ini, saat error muncul, nilai lastNumber diubah menjadi -1 lewat setState(), sehingga UI bisa menampilkan keadaan bahwa terjadi kesalahan.

### 8. Jelaskan maksud kode langkah 1-3 tersebut!

`StreamTransformer` digunakan untuk memproses aliran data **sebelum** data itu diterima oleh `listen()`. Pada contoh tersebut, setiap angka yang masuk akan di-*handle* oleh `handleData`, lalu diubah menjadi `value * 10` sebelum dikirim ke `sink`, sehingga listener selalu menerima nilai yang sudah dikali sepuluh. Jika terjadi error pada stream, `handleError` akan mengganti error itu dengan nilai `-1` agar aliran tetap dapat diproses tanpa crash. Ketika stream selesai, `handleDone` akan menutup sink. Setelah itu, barulah stream yang sudah ditransformasi tersebut didengarkan oleh `listen`, sehingga widget dapat memperbarui `lastNumber` sesuai hasil transformasi atau error yang sudah diubah menjadi `-1`.


### Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![](./assets/praktikum3_codelab12.gif)


### 9. Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!
Kode tersebut membuat *listener* pada `initState()` untuk memantau setiap data baru yang masuk ke stream, lalu memperbarui nilai `lastNumber` melalui `setState()` setiap kali ada event, menangani error dengan mengubah nilai menjadi `-1`, dan menampilkan pesan saat stream selesai lewat `onDone`. Pada fungsi `addRandomNumber()`, angka acak antara 0–9 dibuat dan hanya dikirim ke stream jika controllernya belum ditutup; jika stream sudah ditutup, nilai `lastNumber` langsung diubah menjadi `-1` sebagai tanda bahwa stream tidak bisa menerima data lagi. Dengan alur ini, widget bisa terus memperbarui tampilan berdasarkan data stream sambil tetap aman dari error karena stream yang sudah ditutup.

### Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
![](./assets/praktikum4_codelab12.gif)
