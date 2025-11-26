import 'package:flutter/material.dart';

// 1. TITIK AWAL APLIKASI
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Flutter Naditya',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema utama
      ),
      // Memulai aplikasi dengan NavigationFirst sebagai layar utama
      home: const NavigationFirst(),
    );
  }
}

// ------------------------------------------------------------------
// 2. LAYAR PERTAMA (YANG SUDAH KITA EDIT)
// ------------------------------------------------------------------
class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // Warna favorit Anda sudah diatur di sini
  Color color = Colors.yellow.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color, // Gunakan warna state
      appBar: AppBar(
        // Identitas Anda sudah ditambahkan
        title: const Text('Navigation First Screen (by Naditya)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            // Memanggil method navigasi di bawah
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  // Method untuk navigasi dan mengambil data (warna) kembali
  Future<void> _navigateAndGetColor(BuildContext context) async {
    // Navigasi ke NavigationSecond dan 'await' (tunggu) hasilnya
    var newColor = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()),
    );

    // Setelah kembali, perbarui state 'color' dengan 'newColor'
    // Jika 'newColor' null (misal, pengguna menekan tombol 'back' di AppBar),
    // maka atur ke 'Colors.blue' sesuai kode yang Anda berikan.
    setState(() {
      color = newColor ?? Colors.blue;
    });
  }
}

// ------------------------------------------------------------------
// 3. LAYAR KEDUA (BAGIAN YANG HILANG)
// ------------------------------------------------------------------
class NavigationSecond extends StatelessWidget {
  // Ini adalah layar baru untuk memilih warna
  const NavigationSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menambahkan identitas Anda di sini juga agar konsisten
        title: const Text('Choose a Color (by Naditya)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol ini akan 'pop' (kembali) dan mengirim data 'Colors.red'
            ElevatedButton(
              child: const Text('Ganti jadi Merah'),
              onPressed: () {
                // Mengirimkan data 'Colors.red' KEMBALI ke NavigationFirst
                Navigator.pop(context, Colors.red.shade700);
              },
            ),
            const SizedBox(height: 20),

            // Tombol ini akan 'pop' (kembali) dan mengirim data 'Colors.green'
            ElevatedButton(
              child: const Text('Ganti jadi Hijau'),
              onPressed: () {
                // Mengirimkan data 'Colors.green' KEMBALI ke NavigationFirst
                Navigator.pop(context, Colors.green.shade700);
              },
            ),
          ],
        ),
      ),
    );
  }
}