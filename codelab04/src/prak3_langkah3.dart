//Langkah 3
// void main(){
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 1
//   };

//   var nobleGases = {
//     2: 'helium',
//     10: 'neon',
//     18: 2,
//   };

//   print(gifts);
//   print(nobleGases);

//   var mhs1 = Map<String, String>();
//   gifts['first'] = 'partridge';
//   gifts['second'] = 'turtledoves';
//   gifts['fifth'] = 'golden rings';

//   var mhs2 = Map<int, String>();
//   nobleGases[2] = 'helium';
//   nobleGases[10] = 'neon';
//   nobleGases[18] = 'argon';

//   print(mhs1);
//   print(mhs2);
// }

//Perbaikan Langkah 3
void main() {
  // Map dengan key bertipe String dan value String
  var gifts = <String, String>{
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
    'name': 'Afifah Khoirunnisa',
    'nim': '2241720010',
  };

  // Map dengan key bertipe int dan value String
  var nobleGases = <int, String>{
    2: 'helium',
    10: 'neon',
    18: 'argon',
    99: 'Afifah Khoirunnisa',
    100: '2241720010',
  };

  print("Isi gifts: $gifts");
  print("Isi nobleGases: $nobleGases");

  // Map kosong yang diisi manual
  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['name'] = 'Afifah Khoirunnisa';
  mhs1['nim'] = '2241720010';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[99] = 'Afifah Khoirunnisa';
  mhs2[100] = '2241720010';

  print("Isi mhs1: $mhs1");
  print("Isi mhs2: $mhs2");
}

