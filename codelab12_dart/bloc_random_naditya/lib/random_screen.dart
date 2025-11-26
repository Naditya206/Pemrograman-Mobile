import 'package:flutter/material.dart';
import 'random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  _RandomScreenState createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final _bloc = RandomNumberBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Number - Naditya',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue, // warna appbar biru
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // background seluruh layar biru
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0), // teks warna putih
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue, // tombol refresh putih
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(
          Icons.refresh,
          color: Color.fromARGB(255, 255, 255, 255), // ikon biru agar kontras
        ),
      ),
    );
  }
}
