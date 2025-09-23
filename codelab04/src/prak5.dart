
void main(){
  //Langkah 1
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  // Langkah 3 - Record untuk fungsi tukar
  var recordInt = (5, 10);
  print("Record sebelum tukar: $recordInt");
  print("Record setelah tukar: ${tukar(recordInt)}");

  // Langkah 4
  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ('Budi', 12345);
  print(mahasiswa);

  // Langkah 5
  var mahasiswa2 = ('Afifah Khoirunnisa', a: 2, b: true, '2341720250');

  print(mahasiswa2.$1); // Prints 'Afifah Khoirunnisa'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints '2341720250'
}

// Langkah 3
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

