void main() {
  // Map dengan key String, value String
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // Map dengan key int, value String
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };

  // Deklarasi Map kosong, kemudian isi data
  var mhs1 = Map<String, String>();
  mhs1['Nama'] = 'Naditya P.A';
  mhs1['NIM'] = '244107023008';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Naditya P.A';
  mhs2[2] = '244107023008';

  // Tambahkan data Nama dan NIM ke gifts dan nobleGases juga
  gifts['Nama'] = 'Naditya P.A';
  gifts['NIM'] = '244107023008';

  nobleGases[20] = 'Naditya P.A';
  nobleGases[21] = '244107023008';

  // Cetak semua
  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
