void main() {
  // Set dengan elemen awal
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  // Set kosong cara 1
  var names1 = <String>{}; 

  // Set kosong cara 2
  Set<String> names2 = {}; 

  // Menambahkan elemen ke names1 dengan add()
  names1.add("Naditya P.A");
  names1.add("1234567890"); // NIM contoh

  // Menambahkan elemen ke names2 dengan addAll()
  names2.addAll({"Naditya P.A", "1234567890"});

  // Cetak hasil
  print(names1);
  print(names2);
}
