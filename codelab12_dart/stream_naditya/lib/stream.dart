import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
  ];

  // Langkah 6: Menghasilkan warna secara periodik dengan yield*
  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % colors.length; // looping index agar tidak keluar dari range
        return colors[index]; // kirim warna sesuai urutan
      },
    );
  }
  
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();
  void addNumberToSink(int newNumber) {
  controller.sink.add(newNumber);
}
void close() {
  controller.close();
}
  void addError() {
    controller.sink.addError('error'); // ✅ Langkah 13
  }
}
