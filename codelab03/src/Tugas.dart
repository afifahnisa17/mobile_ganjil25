void main() {
  String nama = "Afifah Khoirunnisa";
  String nim = "2341720250"; 

  for (int i = 0; i <= 201; i++) {
    bool prima = true;

    if (i < 2) {
      prima = false;
    } else {
      for (int j = 2; j <= i ~/ 2; j++) {
        if (i % j == 0) {
          prima = false;
          break; // berhenti langsung kalau sudah ketemu pembagi
        }
      }
    }

    if (prima) {
      print("Bilangan Prima: $i - Nama: $nama - NIM: $nim");
    }
  }
}
