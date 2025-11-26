import 'package:flutter/material.dart';
import 'stream.dart'; // ✅ Import file stream.dart

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
        primarySwatch: Colors.deepPurple,
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
  late Stream<int> numberStream;

  @override
  void initState() {
    numberStream = NumberStream().getNumbers(); // ✅ Langkah 6
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stream - Naditya',
          style: TextStyle(color: Colors.white), // ✅ Teks putih
        ),
        backgroundColor: Colors.blue, // ✅ Background biru
      ),
      body: StreamBuilder<int>(
        stream: numberStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            print("error");
          }
          if (snapshot.hasData) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                    fontSize: 96,
                    color: Color.fromARGB(255, 0, 0, 0), // ✅ Teks putih
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
