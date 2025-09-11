void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) break;                 // stop loop kalau index = 21
    else if (index > 1 && index < 7) continue; // skip kalau index di antara 2-6
    print(index);
  }
}
