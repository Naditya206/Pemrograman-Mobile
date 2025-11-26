import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  Future<Position> getPosition() async {
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3)); // simulasi delay 3 detik
    Position pos = await Geolocator.getCurrentPosition();
    return pos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location')),
      body: Center(
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // 🔄 loading
            } 
            // 🔹 Langkah 5: Tambah handling error
            else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text('Something terrible happened!'); // pesan error
              }
              return Text(snapshot.data.toString()); // tampilkan hasil posisi
            } 
            else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
