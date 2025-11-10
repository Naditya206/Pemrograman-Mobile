import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

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
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  // ✅ Langkah 13: Versi baru menggunakan listen()
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  // ✅ Langkah 10: Tambah method addRandomNumber()
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream(); // ✅ Inisialisasi stream warna
    changeColor();               // ✅ Mulai stream warna

    numberStream = NumberStream(); // ✅ Inisialisasi stream angka
    numberStreamController = numberStream.controller;

    numberStreamController.stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
  }

  // ✅ Langkah 9: Edit dispose()
  @override
  void dispose() {
    numberStreamController.close(); // ✅ Hindari memory leak
    super.dispose();
  }

  // ✅ Langkah 11: Edit build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Naditya'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lastNumber.toString(),
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => addRandomNumber(),
                child: const Text("New Random Number"),
              ),
              const SizedBox(height: 20),
              const Text(
                'Warna sedang berubah...',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
