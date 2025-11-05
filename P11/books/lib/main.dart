import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  // ✅ Fungsi untuk mengambil data dari Google Books API
  Future<String> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/6wppEQAAQBAJ'; // ID buku contoh
    final url = Uri.https(authority, path);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Gagal memuat data (${response.statusCode})');
    }
  }

  // ✅ Method untuk menghitung total dari tiga async function
  Future<void> count() async {
    setState(() {
      loading = true;
      result = 'Menghitung total dari tiga async function...';
    });

    try {
      int total = 0;
      total = await returnOneAsync();
      total += await returnTwoAsync();
      total += await returnThreeAsync();

      setState(() {
        result = 'Total hasil: $total';
        loading = false;
      });
    } catch (e) {
      setState(() {
        result = 'Terjadi error saat menghitung: $e';
        loading = false;
      });
    }
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

            // ✅ Tombol GO! sekarang memanggil count()
            ElevatedButton(
              onPressed: () {
                count(); // Memanggil fungsi count()
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