//Soal Langkah 3
// void main(){
//     If (Index == 21) break;
//     Else If (index > 1 || index < 7) continue;
//     print(index);
// }

//Perbaikan Langkah 3
void main(){
  for (int index = 10; index < 27; index++) {
    if (index == 21) break;
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}
