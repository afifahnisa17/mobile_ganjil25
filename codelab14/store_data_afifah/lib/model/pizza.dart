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

  // ⬇️ Tambahkan constructor ini — WAJIB agar tidak error
  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    this.price,
    required this.imageUrl,
  });

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
