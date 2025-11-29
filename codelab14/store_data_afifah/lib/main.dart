import 'package:flutter/material.dart';
import 'httphelper.dart';
import 'model/pizza.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> pizzas = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    HttpHelper helper = HttpHelper();
    pizzas = await helper.getPizzaList();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.purple,
      title: const Text(
        'JSON - Afifah',
        style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        ),
      ),
      ),

      body: loading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: pizzas.length,
          itemBuilder: (context, position) {
          final pizza = pizzas[position];

          return Dismissible(
            key: Key(pizza.id.toString()),
            direction: DismissDirection.endToStart,

            confirmDismiss: (direction) async {
            // ➜ popup dulu, lalu return true/false
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
              title: const Text("Hapus Pizza?"),
              content:
                Text("Yakin ingin menghapus ${pizza.pizzaName}?"),
              actions: [
                TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Batal"),
                ),
                TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Hapus"),
                ),
              ],
              ),
            );
            },

            onDismissed: (direction) async {
            final deletedId = pizza.id;

            // hapus dari UI
            setState(() {
              pizzas.removeAt(position);
            });

            // delete ke server
            HttpHelper helper = HttpHelper();
            await helper.deletePizza(deletedId);
            },

            background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
            ),

            child: ListTile(
            title: Text(pizza.pizzaName),
            subtitle:
              Text("${pizza.description} - € ${pizza.price}"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                  PizzaDetailScreen(pizza: pizza, isNew: false),
              ),
              );
            },
            ),
          );
          },
        ),

      floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PizzaDetailScreen(
          pizza: Pizza(
            id: 0,
            pizzaName: "",
            description: "",
            price: 0,
            imageUrl: ""),
          isNew: true,
          ),
        ),
        );
      },
      ),
    );
  }
}
