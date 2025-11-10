import 'package:flutter/material.dart';
import 'stream.dart'; // Pastikan file ini tersedia

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Naditya', 
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // ✅ Langkah 8: Tambah variabel
  Color bgColor = Colors.blueGrey; // Warna awal background
  late ColorStream colorStream;    // Objek stream warna

  // ✅ Langkah 9: Tambah method changeColor()
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream(); // ✅ Inisialisasi objek stream
    changeColor();               // ✅ Mulai mendengarkan stream warna
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Stream - Naditya'), // ✅ Branding pribadi
    ),
    body: Container(
      decoration: BoxDecoration(
        color: bgColor, // ✅ Warna dari stream
      ),
      child: const Center(
        child: Text(
          'Warna sedang berubah...', // ✅ Teks informatif
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

}
