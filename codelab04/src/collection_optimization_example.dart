// Contoh Optimasi Collection dari Praktikum Sebelumnya
void main() {
  print("=== OPTIMASI MENGGUNAKAN COLLECTION FOR ===\n");
  
  // 1. Optimasi dari List (Praktikum 1)
  print("1. Optimasi List Processing:");
  var originalList = [1, 2, 3, 4, 5];
  
  // Cara lama (manual loop)
  var doubledOld = <int>[];
  for (var num in originalList) {
    doubledOld.add(num * 2);
  }
  print("Cara lama: $doubledOld");
  
  // Cara baru (collection for)
  var doubledNew = [for (var num in originalList) num * 2];
  print("Cara baru: $doubledNew");
  
  print("");
  
  // 2. Optimasi dari Set (Praktikum 2)
  print("2. Optimasi Set Processing:");
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  
  // Cara lama
  var upperHalogensOld = <String>{};
  for (var element in halogens) {
    upperHalogensOld.add(element.toUpperCase());
  }
  print("Cara lama: $upperHalogensOld");
  
  // Cara baru
  var upperHalogensNew = {for (var element in halogens) element.toUpperCase()};
  print("Cara baru: $upperHalogensNew");
  
  print("");
  
  // 3. Optimasi dari Map (Praktikum 3)
  print("3. Optimasi Map Processing:");
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'third': 'french hens'
  };
  
  // Cara lama
  var giftLengthsOld = <String, int>{};
  for (var entry in gifts.entries) {
    giftLengthsOld[entry.key] = entry.value.length;
  }
  print("Cara lama: $giftLengthsOld");
  
  // Cara baru
  var giftLengthsNew = {
    for (var entry in gifts.entries) entry.key: entry.value.length
  };
  print("Cara baru: $giftLengthsNew");
  
  print("");
  
  // 4. Conditional Collection (dari Praktikum 4)
  print("4. Conditional Collection:");
  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Filter dan transform dalam satu expression
  var evenSquares = [
    for (var num in numbers) 
      if (num % 2 == 0) num * num
  ];
  print("Even squares: $evenSquares");
  
  // Nested collection for
  var matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  var flattenedDoubled = [
    for (var row in matrix)
      for (var num in row) num * 2
  ];
  print("Flattened and doubled: $flattenedDoubled");
  
  print("");
  
  // 5. Spread Operator dengan Collection For
  print("5. Kombinasi Spread Operator dan Collection For:");
  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];
  
  var combined = [
    0,
    ...list1,
    for (var num in list2) num * 10,
    100
  ];
  print("Combined list: $combined");
}