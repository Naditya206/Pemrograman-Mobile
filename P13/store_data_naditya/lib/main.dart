import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Naditya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = ""; // Variabel untuk menyimpan isi JSON

  @override
  void initState() {
    super.initState();
    readJsonFile(); // Panggil method saat widget diinisialisasi
  }

  Future<void> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString("assets/pizzalist.json");
    setState(() {
      pizzaString = myString;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      title: const Text('JSON Naditya'),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Text(pizzaString),
    ),
  );
}
}

