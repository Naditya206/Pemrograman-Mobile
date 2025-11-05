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

  // ✅ Event tombol ditekan
  void onPressedGetData() {
    setState(() {
      loading = true;
      result = 'Mengambil data dari Google Books API...';
    });

    getData().then((data) {
      // Ambil sebagian string agar tidak terlalu panjang
      String preview = data.length > 300 ? data.substring(0, 300) + '...' : data;
      setState(() {
        result = preview;
        loading = false;
      });
    }).catchError((error) {
      setState(() {
        result = 'Terjadi error: $error';
        loading = false;
      });
    });
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
            ElevatedButton(
              onPressed: onPressedGetData,
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
