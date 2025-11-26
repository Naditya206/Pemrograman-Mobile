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
  late StreamController<int> numberStreamController;
  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  late Stream<int> stream; // untuk broadcast stream
  int lastNumber = 0;
  String values = "";

  @override
  void initState() {
    super.initState();

    // ✅ Langkah 4: Set broadcast stream
    numberStreamController = StreamController<int>();
    stream = numberStreamController.stream.asBroadcastStream();

    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });

    // ✅ Perbaikan: tambahkan angka terus, bukan ganti
    subscription2 = stream.listen((event) {
      setState(() {
        values += "$event "; // menambah angka ke deretan teks
      });
    });

    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    subscription.onDone(() {
      print("onDone was called");
    });
  }

  void stopStream() {
    numberStreamController.close();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStreamController.sink.add(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Langkah 5: Tambahkan Text(values)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Stream - Naditya',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$lastNumber',
              style: const TextStyle(fontSize: 48),
            ),
            Text(
              values,
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: stopStream,
              child: const Text('Stop Stream'),
            ),
          ],
        ),
      ),
    );
  }
}
