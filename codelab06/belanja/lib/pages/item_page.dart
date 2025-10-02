import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"), // sama kayak di HomePage
      ),
      body: Center(
        child: Text(
          "${item.name} with ${item.price}",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
