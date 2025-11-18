# PERSISTENSI DATA 📑

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afifah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter JSON Demo - Afifah'),
      ),
      body: Container(),
    );
  }
}
```

### **1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.**
```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afifah',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
```

### **Gantilah warna tema aplikasi sesuai kesukaan Anda.**

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afifah',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // background putih
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, // AppBar biru
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,         
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
```

# PRAKTIKUM 1 - 2

### main.dart

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afifah',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // background putih
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, // AppBar biru
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,         
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = ' ';

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  Future readJsonFile() async {
    String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    setState(() {
      pizzaString = myString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter JSON Demo - Afifah')),
      body: Text(pizzaString),
    );
  }
}

```

### pizzalist.json

```json
[ 
    { 
      "id": 1, 
      "pizzaName": "Margherita", 
      "description": "Pizza with tomato, fresh mozzarella and basil",
      "price": 8.75, 
      "imageUrl": "images/margherita.png" 
    }, 
    { 
      "id": 2, 
      "pizzaName": "Marinara", 
      "description": "Pizza with tomato, garlic and oregano",
      "price": 7.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 3, 
      "pizzaName": "Napoli", 
      "description": "Pizza with tomato, garlic and anchovies",
      "price": 9.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 4, 
      "pizzaName": "Carciofi", 
      "description": "Pizza with tomato, fresh mozzarella and artichokes",
      "price": 8.80, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 5, 
      "pizzaName": "Bufala", 
      "description": "Pizza with tomato, buffalo mozzarella and basil",
      "price": 12.50, 
      "imageUrl": "images/marinara.png"  
    }
]
```

### **2. Masukkan hasil capture layar ke laporan praktikum Anda.**
![](./assets/praktikum1.png)

# PRAKTIKUM 1-3
### main.dart
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import './model/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Afifah',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // background putih
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, 
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = ' ';

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter JSON Demo - Afifah')),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            // leading: Image.network(myPizzas[index].pizzaName),
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
            trailing: Text('\$${myPizzas[index].price}'),
          );
        },
      ),
    );
  }

  Future readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    return myPizzas;
  }

  List<Pizza> myPizzas = [];

  
}
```

### pizza.dart
```dart
class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double? price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      pizzaName = json['pizzaName'],
      description = json['description'],
      price = json['price'],
      imageUrl = json['imageUrl'];
}
```

### **3. Masukkan hasil capture layar ke laporan praktikum Anda.**
![](./assets/praktikum1-2.png)

# PRAKTIKUM 2
### **4. Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!**
![](./assets/praktikum2.png)

# PRAKTIKUM 3
### pizza.dart

```dart
const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImageUrl = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double? price;
  final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json)
    : id = int.tryParse(json[keyId].toString()) ?? 0,
      pizzaName = json[keyName] != null
          ? json[keyName].toString()
          : 'No Name',
      description = json[keyDescription] != null
          ? json[keyDescription].toString()
          : '',
      price = double.tryParse(json[keyPrice].toString()) ?? 0.0,
      imageUrl = json[keyImageUrl] ?? '';

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
    };
  }
}
```

### ** 5. Jelaskan maksud kode lebih safe dan maintainable!**

✔ Karena pakai konstanta → aman dari typo, mudah diubah
✔ Karena pakai OOP → struktur data rapi, reusable
✔ Karena parsing terpusat di satu class → mudah diperbaiki
✔ Karena ada default value & tryParse → aplikasi tidak mudah crash

### **Capture hasil praktikum Anda dan lampirkan di README.**
![](./assets/praktikum3.png)

# PRAKTIKUM 4
### main.dart
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Demo - Afifah',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // background putih
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String pizzaString = ' ';

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile().then((value) {
  //     setState(() {
  //       myPizzas = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences Demo - Afifah')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('You have opened the app $appCounter times.'),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              }, child: const Text('Reset Counter')),
          ],
        ),
      ),
    );
  }

  // Future readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(
  //     context,
  //   ).loadString('assets/pizzalist_broken.json');
  //   List pizzaMapList = jsonDecode(myString);

  //   List<Pizza> myPizzas = [];
  //   for (var pizza in pizzaMapList) {
  //     Pizza myPizza = Pizza.fromJson(pizza);
  //     myPizzas.add(myPizza);
  //   }

  //   String json = convertToJson(myPizzas);
  //   print(json);
  //   return myPizzas;
  // }

  // List<Pizza> myPizzas = [];

  // String convertToJson(List<Pizza> pizzas) {
  //   return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  // }

  int appCounter = 0;

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = (prefs.getInt('counter') ?? 0);
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }
}
```

### **6. Capture hasil praktikum Anda berupa GIF dan lampirkan di README.**
![](./assets/praktikum4_codelab13.gif)
