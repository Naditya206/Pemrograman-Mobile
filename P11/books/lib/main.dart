import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books - Naditya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool loading = false;

  // ✅ Method returnFG menggunakan Future.wait
  void returnFG() {
    setState(() {
      loading = true;
      result = 'Menghitung dengan Future.wait...';
    });

    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> value) {
      int total = value.fold(0, (sum, element) => sum + element);
      setState(() {
        result = 'Total hasil (Future.wait): $total';
        loading = false;
      });
    }).catchError((error) {
      setState(() {
        result = 'Terjadi error saat menghitung: $error';
        loading = false;
      });
    });
  }

  // ✅ Tiga method asynchronous
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future - Naditya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // ✅ Tombol GO! memanggil returnFG dengan Future.wait
            ElevatedButton(
              onPressed: () {
                returnFG();
              },
              child: const Text('GO!'),
            ),

            const Spacer(),
            if (loading) const CircularProgressIndicator(),
            if (!loading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(result),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
