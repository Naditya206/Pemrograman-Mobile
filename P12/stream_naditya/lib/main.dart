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
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });
  }

  // ✅ Langkah 15: Edit method addRandomNumber()
  void addRandomNumber() {
    // final number = Random().nextInt(10);
    // int myNum = Random().nextInt(10);
    int myNum = Random().nextInt(10); // ✅ Tetap gunakan angka acak
    numberStream.addNumberToSink(myNum); // ✅ Kirim ke stream
    numberStream.addError();             // ✅ Tambahkan error ke stream
  }

  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // ✅ Langkah 14: Tambah onError
    numberStreamController.stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    }, onError: (error) {
      setState(() {
        lastNumber = -1; // ✅ Tampilkan -1 saat error
      });
    });
  }

  @override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }

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
