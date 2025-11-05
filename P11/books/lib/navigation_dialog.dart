import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() =>
      _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  // --- PERUBAHAN 1: Warna awal diubah jadi Kuning ---
  Color color = Colors.yellow.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // Menambahkan nama Anda agar konsisten
        title: const Text('Navigation Dialog Screen (by Naditya)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          // 'onPressed' sekarang memanggil method di bawah
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  // == METHOD ASYNC UNTUK DIALOG ==
  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          
          // --- PERUBAHAN 2: Pilihan warna di 'actions' diganti ---
          actions: <Widget>[
            TextButton(
              child: const Text('Kuning'), // Ganti dari 'Red'
              onPressed: () {
                color = Colors.yellow.shade700; // Ganti dari 'Colors.red'
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Oranye'), // Ganti dari 'Green'
              onPressed: () {
                color = Colors.orange.shade700; // Ganti dari 'Colors.green'
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Ungu'), // Ganti dari 'Blue'
              onPressed: () {
                color = Colors.purple.shade700; // Ganti dari 'Colors.blue'
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );

    // setState() akan memperbarui UI dengan warna yang dipilih
    setState(() {});
  }
}