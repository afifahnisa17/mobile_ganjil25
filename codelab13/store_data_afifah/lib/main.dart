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
