// functions_examples.dart
// =======================
// Contoh Functions di Dart (3 - 7)

//
// 3. Jenis-jenis Parameter
//

// a. Positional Parameter
void cetakNama(String nama, int umur) {
  print("Nama: $nama, Umur: $umur");
}

// b. Optional Positional Parameter
void cetakData(String nama, [int? umur]) {
  print("Nama: $nama, Umur: $umur");
}

// c. Named Parameter
void cetakBiodata({required String nama, int umur = 0}) {
  print("Nama: $nama, Umur: $umur");
}

//
// 4. Functions sebagai First-Class Objects
//
int kali(int a, int b) => a * b;

void jalankanFungsi(Function f) {
  print("Hasil fungsi: ${f(3, 4)}");
}

//
// 5. Anonymous Functions
//
void contohAnonymous() {
  var daftar = [1, 2, 3];

  // anonymous function di dalam forEach
  daftar.forEach((item) {
    print("Nilai: $item");
  });

  // bentuk lebih ringkas (arrow function)
  daftar.forEach((item) => print("Nilai cepat: $item"));
}

//
// 6. Lexical Scope dan Lexical Closures
//
void contohLexicalScope() {
  var luar = "Saya di luar fungsi";

  void dalam() {
    print(luar); // bisa akses karena lexical scope
  }

  dalam();
}

Function hitungKelipatan(int faktor) {
  return (int angka) => angka * faktor; // closure simpan variabel faktor
}

//
// 7. Return Multiple Values (Record - Dart 3)
//
(String, int) getMahasiswa() {
  return ("Naditya", 244107023008);
}

//
// MAIN PROGRAM
//
void main() {
  print("=== 3. Jenis-jenis Parameter ===");
  cetakNama("Naditya", 21);
  cetakData("Naditya");
  cetakData("Naditya", 21);
  cetakBiodata(nama: "Naditya", umur: 21);

  print("\n=== 4. Functions sebagai First-Class Objects ===");
  var fungsi = kali;
  print("kali(2, 5) = ${fungsi(2, 5)}");
  jalankanFungsi(kali);

  print("\n=== 5. Anonymous Functions ===");
  contohAnonymous();

  print("\n=== 6. Lexical Scope & Closures ===");
  contohLexicalScope();
  var kali2 = hitungKelipatan(2);
  var kali3 = hitungKelipatan(3);
  print("5 * 2 = ${kali2(5)}");
  print("5 * 3 = ${kali3(5)}");

  print("\n=== 7. Return Multiple Values (Record) ===");
  var (nama, nim) = getMahasiswa();
  print("Nama: $nama, NIM: $nim");
}
