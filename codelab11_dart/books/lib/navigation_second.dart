// Lokasi file: lib/navigation_second.dart

import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    // Variabel 'color' dari gambar Anda tidak diperlukan sebagai
    // state di level ini.
    // Kita bisa langsung mengirimkan warnanya saat 'pop'.

    return Scaffold(
      appBar: AppBar(
        // Menambahkan nama Anda sesuai Soal 15
        title: const Text('Navigation Second Screen (by Naditya)'),
      ),
      body: Center(
        child: Column(
          // Menggunakan 'spaceEvenly' seperti di gambar Anda
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                // Langsung kirim data warna kembali ke layar pertama
                Navigator.pop(context, Colors.red.shade700);
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                // Langsung kirim data warna kembali ke layar pertama
                Navigator.pop(context, Colors.green.shade700);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                // Langsung kirim data warna kembali ke layar pertama
                Navigator.pop(context, Colors.blue.shade700);
              },
            ),
          ],
        ),
      ),
    );
  }
}