//Langkah 1
void main(){
  final list = List<String?>.filled(5, null, growable: false);
  list[1] = "Afifah Khoirunnisa";
  list[2] = "2341720250";
  
  // Print hasilnya
  print(list.length);  // Panjang list
  print(list[1]);      // Nama
  print(list[2]);      // NIM
  print(list);         // Semua isi list
}