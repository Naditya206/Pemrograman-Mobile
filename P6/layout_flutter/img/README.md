Tentu, ini adalah laporan dalam format Markdown yang merinci setiap langkah beserta kode yang sesuai, berdasarkan gambar yang Anda berikan. Laporan ini akan memandu Anda dalam membuat tata letak (layout) di Flutter.

-----

### **Laporan Praktikum: Membangun Layout di Flutter**

Laporan ini mendokumentasikan proses pembuatan antarmuka pengguna (UI) di Flutter sesuai dengan diagram tata letak yang diberikan.

-----

### **Langkah 1: Membuat Proyek Flutter Baru**

Langkah pertama adalah menginisialisasi proyek Flutter baru. Proyek ini akan menjadi dasar bagi aplikasi yang akan kita kembangkan.

**Tindakan:**
Membuat proyek Flutter baru dengan nama `layout_flutter`.

**Kode (Terminal):**

```bash
flutter create layout_flutter
```

Setelah perintah ini dijalankan, sebuah direktori baru bernama `layout_flutter` akan dibuat, berisi semua file standar untuk aplikasi Flutter.

-----

### **Langkah 2: Modifikasi File `lib/main.dart`**

Selanjutnya, kita akan memodifikasi file utama `main.dart`. File ini adalah titik masuk untuk aplikasi Flutter. Kita akan mengubah judul dan menghapus teks default untuk mempersiapkan penambahan layout kustom kita.

**Tindakan:**

1.  Buka file `lib/main.dart` pada proyek `layout_flutter`.
2.  Ganti kode yang ada dengan kode di bawah ini. Sesuaikan `Nama dan NIM Anda` pada `title` di dalam `MaterialApp`.

**Kode (`lib/main.dart`):**

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Naditya Prastia Andino dan 244107023008', // Ganti dengan nama dan NIM Anda
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

-----

### **Langkah 3: Identifikasi Diagram Layout**

Sebelum menulis kode untuk UI, langkah krusial adalah menganalisis dan memecah desain menjadi komponen-komponen dasar Flutter seperti `Row`, `Column`, `Container`, dan lainnya.

**Analisis Desain:**

  * **Struktur Utama:** Layout disusun secara vertikal, yang mengindikasikan penggunaan `Column` sebagai widget utama.
  * **Bagian Judul (Title Section):**
      * Merupakan sebuah `Row` yang berisi tiga anak (children).
      * Anak pertama adalah sebuah `Column` untuk dua baris teks (nama tempat dan lokasi). `Column` ini dibungkus dengan `Expanded` agar mengisi ruang yang tersedia.
      * Anak kedua adalah `Icon` bintang.
      * Anak ketiga adalah sebuah `Text` untuk menampilkan angka.
  * **Bagian Tombol (Button Section):**
      * Merupakan sebuah `Row` yang berisi tiga `Column`.
      * Setiap `Column` berisi sebuah `Icon` dan `Text` di bawahnya.
  * **Bagian Teks Deskripsi:** Sebuah `Container` dengan padding yang berisi widget `Text`.

-----

### **Langkah 4: Implementasi `titleSection`**

Pada langkah ini, kita akan membuat variabel untuk menyimpan widget `titleSection` sesuai dengan analisis pada Langkah 3.

**Tindakan:**

1.  Buat variabel `Widget` baru bernama `titleSection` di dalam metode `build` pada class `MyApp`.
2.  Ganti `body` dari `Scaffold` yang semula berisi `Text('Hello World')` menjadi `titleSection`.

**Kode (`lib/main.dart`):**

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // /* soal 1 */ Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang
    // yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke
    // CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.
    //
    // /* soal 2 */ Letakkan baris pertama teks di dalam Container sehingga memungkinkan
    // Anda untuk menambahkan padding -8. Teks `Batu, Malang, Indonesia` di dalam
    // Column. set warna menjadi abu-abu.
    //
    // /* soal 3 */ Dua item terakhir di baris judul adalah ikon bintang, set dengan warna
    // merah, dan teks `41`. Seluruh baris ada di dalam Container dan beri padding di
    // sepanjang setiap tepinya sebesar 32 piksel.
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1 */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground', // Teks asli dari diagram
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia', // Teks yang dimodifikasi sesuai instruksi
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /* soal 3 */
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Naditya Prastia Andino dan 2441070230008',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Ganti body dengan variabel titleSection
        body: Column(
          children: [
            titleSection,
          ],
        ),
      ),
    );
  }
}
```

Tentu, ini adalah kelanjutan laporan praktikum dalam format Markdown, lengkap dengan kode untuk setiap langkah implementasi *button row*.

-----

### **Praktikum 2: Implementasi Button Row**

Bagian ini melanjutkan pembuatan layout dengan menambahkan baris tombol interaktif di bawah bagian judul.

-----

### **Langkah 1: Membuat Method `_buildButtonColumn`**

Untuk efisiensi dan agar kode tidak berulang, kita akan membuat sebuah *method* pribadi (private) yang berfungsi untuk membangun satu kolom tombol. Method ini akan menerima parameter warna, ikon, dan label, lalu mengembalikan widget `Column` yang sudah terstruktur.

**Tindakan:**
Salin method `_buildButtonColumn` ini dan letakkan di dalam `class MyApp`, di atas method `build`.

**Kode (`lib/main.dart`):**

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Letakkan method ini di sini
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Kode build Anda yang sudah ada sebelumnya ada di sini...
  }
}
```

-----

### **Langkah 2: Membuat Widget `buttonSection`**

Sekarang kita akan menggunakan method `_buildButtonColumn` yang baru saja dibuat untuk membangun baris yang berisi tiga tombol (`CALL`, `ROUTE`, `SHARE`).

**Tindakan:**

1.  Ambil warna tema utama untuk digunakan pada tombol.
2.  Buat variabel `Widget` baru bernama `buttonSection`.
3.  Letakkan kode ini di dalam method `build`, tepat di bawah deklarasi variabel `titleSection` yang sudah Anda buat sebelumnya.

**Kode (`lib/main.dart` - di dalam method `build`):**

```dart
  @override
  Widget build(BuildContext context) {
    // Bagian 1: Title Section
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia', // Teks yang dimodifikasi
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // Bagian 2: Button Section
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Bagian 3: Text Section
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Naditya Prastia Andino dan 2441070230008', // Ganti dengan nama dan NIM Anda
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Menggunakan ListView agar bisa di-scroll
        body: ListView(
          children: [
            // Tambahkan semua bagian ke dalam ListView
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
```

-----

### **Langkah 3: Menambahkan `buttonSection` ke Body**

Langkah terakhir adalah menampilkan `buttonSection` yang sudah kita buat ke layar. Kita akan menambahkannya ke dalam `Column` utama di dalam `body` dari `Scaffold`.

**Tindakan:**
Tambahkan variabel `buttonSection` ke dalam `children` dari `Column` yang ada di dalam `body`, tepat di bawah `titleSection`.

**Kode Lengkap Akhir (`lib/main.dart`):**

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Bagian 1: Title Section
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Batu, Malang, Indonesia', // Teks yang dimodifikasi
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    // Bagian 2: Button Section
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Bagian 3: Text Section
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Naditya Prastia Andino dan 2441070230008', // Ganti dengan nama dan NIM Anda
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Menggunakan ListView agar bisa di-scroll
        body: ListView(
          children: [
            // Tambahkan semua bagian ke dalam ListView
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  // Method helper untuk membuat kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
```
-----

### **Laporan Praktikum 3: Implementasi Text Section**

Laporan ini menjelaskan langkah-langkah untuk menambahkan bagian teks deskriptif ke dalam tata letak (layout) aplikasi Flutter, melanjutkan dari praktikum sebelumnya.

-----

#### **Langkah 1: Membuat Widget `textSection`**

Langkah pertama adalah membuat sebuah variabel `Widget` baru yang akan menampung seluruh bagian teks. Widget ini menggunakan `Container` untuk memberikan `padding` di sekelilingnya dan `Text` untuk menampilkan konten paragraf.

**Tindakan:**
Mendefinisikan variabel `textSection` di dalam metode `build()`, tepat di bawah deklarasi `buttonSection`. Properti `softWrap: true` digunakan agar teks secara otomatis pindah ke baris baru jika tidak muat dalam satu baris.

**Kode:**

```dart
    // Bagian 3: Text Section
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Danau Oeschinen terletak di kaki Blüemlisalp di Pegunungan Alpen Bernese. '
        'Terletak 1.578 meter di atas permukaan laut, ini adalah salah satu '
        'Danau Alpine yang lebih besar. Naik gondola dari Kandersteg, diikuti dengan '
        'setengah jam berjalan kaki melalui padang rumput dan hutan pinus, akan membawa Anda ke '
        'danau, yang menghangat hingga 20 derajat Celcius di musim panas. \n\n'
        'Nama: Naditya Prastia Andino\n'
        'NIM: 2441070230008\n\n'
        'Selamat mengerjakan 😉',
        softWrap: true,
      ),
    );
```

-----

#### **Langkah 2: Menambahkan `textSection` ke Body**

Setelah widget `textSection` dibuat, langkah selanjutnya adalah menampilkannya di layar. Ini dilakukan dengan menambahkan variabel tersebut ke dalam daftar `children` dari widget `Column` (atau `ListView`) yang ada di dalam `body` `Scaffold`.

**Tindakan:**
Menambahkan variabel `textSection` ke dalam `children` list, tepat di bawah `buttonSection`.

**Kode:**

```dart
body: Column(
  children: [
    titleSection,
    buttonSection,
    textSection, // Variabel ditambahkan di sini
  ],
),
```

-----