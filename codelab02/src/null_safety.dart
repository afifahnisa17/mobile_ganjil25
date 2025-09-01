void main() {
  String nama = "Afifah";   // tidak bisa null
  // String nama2 = null;   // ❌ error, tidak bisa null

  String? hobi;             // boleh null
  print(hobi);              // output: null

  hobi = "Membaca";
  print(hobi);              // output: Membaca
}