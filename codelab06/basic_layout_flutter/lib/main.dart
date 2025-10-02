import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Layout'),
        ),
        body: const RecipeLayout(),
      ),
    );
  }
}

class RecipeLayout extends StatelessWidget {
  const RecipeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isPortrait) {
          // Mode portrait: kolom (gambar atas, teks bawah)
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  "https://tse3.mm.bing.net/th/id/OIP.T_mmBp59wUMxBBYOo8UxqwHaE8?pid=Api&P=0&h=180",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: buildTextContent(),
                ),
              ),
            ],
          );
        } else {
          // Mode landscape: row (teks kiri, gambar kanan)
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: buildTextContent(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.network(
                  "https://tse3.mm.bing.net/th/id/OIP.T_mmBp59wUMxBBYOo8UxqwHaE8?pid=Api&P=0&h=180",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  // Bagian teks biar rapi
  Widget buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Strawberry Pavlova",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.teal),
        ),
        const SizedBox(height: 8),
        const Text(
          "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. "
          "Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.",
          softWrap: true,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Row(
              children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, color: Colors.red, size: 18),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "170 Reviews",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            InfoColumn(icon: Icons.schedule, label: "PREP:", value: "25 min"),
            InfoColumn(icon: Icons.restaurant, label: "COOK:", value: "1 hr"),
            InfoColumn(icon: Icons.people, label: "FEEDS:", value: "4-6"),
          ],
        )
      ],
    );
  }
}

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoColumn(
      {super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
