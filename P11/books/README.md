
# 🧪 Laporan Praktikum Pemrograman Asynchronous di Flutter  
**Nama:** Naditya Prastia Andino  
**NIM:** 244107023008  
**No Absen:** 23  
**Kelas:** TI-3H  

---

## 📌 Soal Praktikum

### ✅ Soal 1  
Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

![alt text](img/image.png)

### ✅ Soal 2  
Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut.  
Lakukan capture hasil JSON dan tulis di README  
Commit dengan pesan: `"W11: Soal 2"`

![alt text](img/image.png)

### ✅ Soal 3  
Jelaskan maksud kode pada langkah `ElevatedButton` terkait penggunaan `substring` dan `catchError`.  
Lampirkan hasil berupa GIF di README.  
Commit dengan pesan: `"W11: Soal 3"`

* **`substring(0, 300)`** digunakan untuk **memotong hasil data JSON** agar tidak terlalu panjang saat ditampilkan di layar (hanya menampilkan 300 karakter pertama).
* **`catchError`** digunakan untuk **menangani error** jika proses pengambilan data dari API gagal (misalnya karena koneksi atau URL salah), supaya aplikasi tidak crash dan menampilkan pesan kesalahan yang jelas.

![alt text](img/gif1.gif)

---


## 📘 W11: Soal 4

### ✅ Penjelasan Langkah 1 dan 2

#### 🔹 Langkah 1: Membuat Tiga Fungsi Asynchronous
Pada langkah ini, dibuat tiga fungsi asynchronous:
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}
Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}
Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

**Tujuan:**  
Ketiga fungsi ini mensimulasikan proses asynchronous (misalnya pengambilan data dari server) dengan delay selama 3 detik, lalu mengembalikan nilai integer masing-masing.

---

#### 🔹 Langkah 2: Membuat Fungsi `count()`
Fungsi ini digunakan untuk memanggil ketiga fungsi asynchronous di atas secara berurutan dan menjumlahkan hasilnya.

```dart
Future<void> count() async {
  setState(() {
    loading = true;
    result = 'Menghitung total dari tiga async function...';
  });

  try {
    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();

    setState(() {
      result = 'Total hasil: $total';
      loading = false;
    });
  } catch (e) {
    setState(() {
      result = 'Terjadi error saat menghitung: $e';
      loading = false;
    });
  }
}
```

**Tujuan:**  
- Menjalankan ketiga fungsi secara berurutan menggunakan `await`
- Menjumlahkan hasilnya ke dalam variabel `total`
- Menampilkan hasil ke UI melalui `setState`

---

### 🎥 Hasil Praktikum (GIF)
Berikut adalah hasil praktikum saat tombol `GO!` ditekan dan fungsi `count()` dijalankan:

![alt text](img/gif2.gif)

---

## 🧠 W11: Soal 5

### ✅ Penjelasan Kode Langkah 2

Pada langkah ini, kita menambahkan sebuah variabel dan dua method ke dalam class `_FuturePageState` untuk mengelola proses asynchronous secara manual menggunakan `Completer`.

---

### 🔹 Kode yang Ditambahkan

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}

```

### 🎥 Hasil Praktikum (GIF)
Berikut adalah hasil praktikum saat tombol `GO!` ditekan:

![alt text](img/gif3.gif)

### ✅ Penjelasan Langkah 2

Pada langkah ini, kita menggunakan `Completer` untuk mengelola proses asynchronous secara manual.

#### 🔹 Kode yang Ditambahkan

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds: 5));
  completer.complete(42);
}
```

### 🎥 Hasil Praktikum (GIF)
Berikut adalah hasil praktikum saat tombol `GO!` ditekan:

![alt text](img/gif4.gif)

## 📘 W11: Soal 7

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".

### 🎥 Hasil Praktikum (GIF)
Berikut adalah hasil praktikum saat tombol `GO!` ditekan:

![alt text](img/gif5.gif)

Berikut penjelasan **Soal 8** dalam format **Markdown**, Naditya:

---

## 📘 W11: Soal 8

### ✅ Perbedaan Kode Langkah 1 dan Langkah 4

---

### 🔹 Langkah 1: Menggunakan `FutureGroup`

```dart
FutureGroup<int> futureGroup = FutureGroup<int>();
futureGroup.add(returnOneAsync());
futureGroup.add(returnTwoAsync());
futureGroup.add(returnThreeAsync());
futureGroup.close();

futureGroup.future.then((List<int> value) {
  // proses hasil
});
```

**Penjelasan:**
- `FutureGroup` digunakan untuk mengelola beberapa `Future` secara manual.
- Kita harus menambahkan setiap `Future` satu per satu menggunakan `.add()`.
- Setelah semua `Future` ditambahkan, kita harus memanggil `.close()` agar grup siap menunggu hasil.
- Cocok untuk kasus kompleks di mana `Future` ditambahkan secara dinamis atau bertahap.

---

### 🔹 Langkah 4: Menggunakan `Future.wait`

```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);

futures.then((List<int> value) {
  // proses hasil
});
```

**Penjelasan:**
- `Future.wait` langsung menerima list of `Future` dan menunggu semuanya selesai.
- Tidak perlu `.add()` atau `.close()`.
- Lebih ringkas dan efisien untuk kasus statis di mana semua `Future` sudah diketahui sejak awal.

---

### ⚖️ Perbandingan

| Aspek               | Langkah 1 (`FutureGroup`)                  | Langkah 4 (`Future.wait`)               |
|---------------------|--------------------------------------------|-----------------------------------------|
| Struktur            | Manual: `.add()` dan `.close()`            | Otomatis: langsung list `Future`        |
| Fleksibilitas       | Tinggi, bisa tambah `Future` bertahap      | Rendah, harus tahu semua `Future` awal  |
| Kompleksitas kode   | Lebih panjang dan eksplisit                | Lebih ringkas dan sederhana             |
| Cocok untuk         | Dinamis, event-driven                      | Statis, paralel sederhana               |

---

### 🎯 Kesimpulan

- Gunakan `FutureGroup` jika kamu perlu menambahkan `Future` secara bertahap atau berdasarkan kondisi runtime.
- Gunakan `Future.wait` jika semua `Future` sudah tersedia dan kamu ingin menjalankannya secara paralel dengan kode yang lebih ringkas.

## 📘 W11: Soal 9

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".

### 🎥 Hasil Praktikum (GIF)
Berikut adalah hasil praktikum saat tombol `GO!` ditekan:

![alt text](img/gif6.gif)