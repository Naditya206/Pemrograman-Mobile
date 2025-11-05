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

    void returnFG() {
    setState(() {
      loading = true;
      result = 'Menghitung dengan FutureGroup...';
    });

    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();

    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = 'Total hasil (FutureGroup): $total';
        loading = false;
      });
    }).catchError((error) {
      setState(() {
        result = 'Terjadi error saat menghitung: $error';
        loading = false;
      });
    });
  }

  String result = '';
  bool loading = false;

  // ✅ Completer dipindahkan ke level class
  late Completer<int> completer;

  // ✅ Fungsi getNumber menggunakan Completer
  Future<int> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  // ✅ Fungsi calculate menyelesaikan Completer setelah delay
Future<void> calculate() async {
  try {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42); // Menyelesaikan dengan nilai sukses
    // throw Exception(); // Jika ingin uji error, aktifkan baris ini
  } catch (_) {
    completer.completeError('Terjadi kesalahan saat menghitung'); // Menyelesaikan dengan error
  }
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

  // ✅ Fungsi untuk mengambil data dari Google Books API
  Future<String> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/6wppEQAAQBAJ';
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

            // // ✅ Tombol GO! memanggil getNumber()
            //               ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         loading = true;
            //         result = 'Memanggil getNumber()...';
            //       });

            //       getNumber().then((value) {
            //         setState(() {
            //           result = value.toString();
            //           loading = false;
            //         });
            //       }).catchError((e) {
            //         setState(() {
            //           result = 'An error occurred';
            //           loading = false;
            //         });
            //       });
            //     },
            //     child: const Text('GO!'),
            //   ),

                      ElevatedButton(
            onPressed: () {
              returnFG(); // ✅ Memanggil method FutureGroup
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
