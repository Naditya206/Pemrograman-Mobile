# Praktikum 1: Konversi Dart model ke JSON

### ✅ **Soal 1**

**Instruksi:**

- Tambahkan nama panggilan Anda pada `title` aplikasi sebagai identitas hasil pekerjaan.
- Ganti warna tema aplikasi sesuai dengan kesukaan Anda.
- Lakukan commit dengan pesan:

```bash
W13: Jawaban Soal 1
```

**Implementasi:**

- Title aplikasi diubah menjadi: `JSON Naditya`
- Warna tema aplikasi diubah menjadi: `Colors.blue`

```dart
MaterialApp(
  title: 'JSON Naditya',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: const MyHomePage(),
)
```

---

### ✅ **Soal 2**

**Instruksi:**

- Masukkan hasil capture layar ke dalam laporan praktikum.
- Lakukan commit dengan pesan:

```bash
W13: Jawaban Soal 2
```

**Dokumentasi:**

![alt text](img/img1.png)

---

Berikut format markdown yang bisa kamu gunakan untuk menyusun laporan praktikum **Soal 3**:

---

## ✅ **Soal 3**

**Instruksi:**

- Masukkan hasil capture layar ke laporan praktikum Anda.
- Lakukan commit hasil jawaban Soal 3 dengan pesan:

```bash
W13: Jawaban Soal 3
```

---

### 📸 **Dokumentasi Tampilan Aplikasi**

![alt text](img/img2.png)
> Contoh: Tampilan daftar pizza yang berhasil ditampilkan menggunakan `ListView.builder`, menampilkan `pizzaName` dan `description`.

---

## ✅ **Soal 4**

**Instruksi:**

- Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!
- Lalu lakukan commit dengan pesan "W13: Jawaban Soal 4".

---

### 📸 **Dokumentasi Tampilan Aplikasi**

![alt text](img/img5.png)

---

## ✅ **Soal 5**

**Instruksi:**

- Jelaskan maksud kode lebih safe dan maintainable!
- Capture hasil praktikum Anda dan lampirkan di README.
- Lalu lakukan commit dengan pesan "W13: Jawaban Soal 5".

---

### 📝 **Penjelasan: Kode Lebih Safe dan Maintainable**

#### 🔒 **Safe (Aman)**

Kode dikatakan **safe** ketika dapat menangani kondisi tidak terduga tanpa crash:

1. **Null Safety**
   ```dart
   pizzaName = json[keyPizzaName] != null 
       ? json[keyPizzaName].toString() 
       : 'No name'
   ```
   - Mengecek nilai `null` sebelum digunakan
   - Memberikan nilai default jika data tidak ada
   - Mencegah `NullPointerException`

2. **Type Safety**
   ```dart
   id = json[keyId] != null 
       ? int.tryParse(json[keyId].toString()) ?? 0 
       : null
   ```
   - Menggunakan `int.tryParse()` untuk parsing aman
   - Menangani kasus tipe data berbeda (string "1" atau number 1)

3. **Error Prevention**
   ```dart
   static const String keyPizzaName = 'pizzaName';
   json[keyPizzaName]  // ✅ Aman dari typo
   ```
   - Konstanta mencegah typo pada nama key
   - IDE memberikan error checking

#### 🛠️ **Maintainable (Mudah Dipelihara)**

Kode dikatakan **maintainable** ketika mudah dibaca, dimodifikasi, dan dikembangkan:

1. **Single Source of Truth**
   ```dart
   static const String keyPizzaName = 'pizzaName';
   ```
   - Jika nama field berubah, cukup ubah di **1 tempat**
   - Tidak perlu mencari dan mengganti di seluruh kode

2. **Readability & Consistency**
   - Kode lebih mudah dibaca dan dipahami
   - Pola yang konsisten untuk semua field
   - Developer baru mudah memahami struktur

3. **Testability**
   - Mudah membuat unit test
   - Mudah di-debug saat ada error

#### 📊 **Perbandingan**

| Aspek | Sebelum | Sesudah |
|-------|---------|---------|
| Typo Protection | ❌ Tidak ada | ✅ IDE error |
| Refactoring | ❌ Manual | ✅ 1 tempat |
| Null Handling | ⚠️ Bisa crash | ✅ Safe |
| Type Handling | ⚠️ Bisa crash | ✅ Parsing aman |

---

### 📸 **Dokumentasi Tampilan Aplikasi**

![alt text](img/img6.png)

---

