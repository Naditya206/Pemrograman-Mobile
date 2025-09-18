void main() {
  var mahasiswa2 = ('Naditya', a: 244107023008, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'Naditya'
  print(mahasiswa2.a);  // Prints 244107023008
  print(mahasiswa2.b);  // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
