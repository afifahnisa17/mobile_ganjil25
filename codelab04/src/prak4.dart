// Langkah 1
// void main(){
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list1);
//   print(list2);
//   print(list2.length);
// }

// Perbaikan Langkah 1
void main(){
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  // Langkah 3
  print("");
  print("Langkah 3");
  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  // Spread Operator List Nim dan Nama
  print("");
  List? l1 = ["Afifah Khoirunnisa", "2341720250"];
  print(l1);

  // Langkah 4
  print("");
  print("Langkah 4");
  bool promoActive = true; 
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  promoActive = false;
  var nav3 = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav3);

  // Langkah 5
  print("");
  print("Langkah 5");
  var login = 'Manager'; // 'User' atau 'Manager'
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav2);

  login = 'User';
  var nav4 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav4);

  // Langkah 6
  print("");
  print("Langkah 6");
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}



