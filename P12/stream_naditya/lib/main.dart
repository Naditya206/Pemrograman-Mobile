import 'package:flutter/material.dart';
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
        primarySwatch: Colors.purple,
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
  late StreamController<int> _streamController;
  late StreamTransformer<int, int> transformer;
  String _text = '0';

  @override
  void initState() {
    super.initState();

    _streamController = StreamController<int>();

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10); // nilai dikalikan 10
      },
      handleError: (error, trace, sink) {
        sink.add(-1); // jika error kirim -1
      },
      handleDone: (sink) => sink.close(),
    );

    _streamController.stream.transform(transformer).listen((event) {
      setState(() {
        _text = '$event';
      });
    }).onError((error) {
      setState(() {
        _text = '-1';
      });
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void addRandomNumber() {
    int number = Random().nextInt(10);
    _streamController.sink.add(number);
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.blue, // Warna latar AppBar
      title: const Text(
        'Stream - Naditya',
        style: TextStyle(color: Colors.white), // ✅ Teks putih
      ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: addRandomNumber,
            child: const Text('New Random Number'),
          ),
        ],
      ),
    ),
  );
}
}
