//Langkah 3
// void main(){
//   var names1 = <String>{};
//   Set<String> names2 = {}; // This works, too.
//   var names3 = {}; // Creates a map, not a set.

//   print(names1);
//   print(names2);
//   print(names3);
// }

//Perbaikan Langkah 3
void main(){
  var names1 = <String>{};
  Set<String> names2 = {}; 
  names1.add("Afifah Khoirunnisa");
  names1.add("2341720250");

  names2.addAll({"Afifah Khoirunnisa", "2341720250"});

 // Cetak hasil
  print("Isi names1     : $names1");
  print("Isi names2     : $names2");

}


