import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<Pizza> myPizzas = [];
  
  // Langkah 4: Tambahkan variabel appCounter
  int appCounter = 0;

  @override
  void initState() {
    super.initState();
    // Langkah 10: Panggil readAndWritePreference() di initState
    readAndWritePreference();
    
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  // Langkah 5: Buat Method readAndWritePreference()
  Future<void> readAndWritePreference() async {
    // Langkah 6: Dapatkan instance SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    // Langkah 7: Baca, Cek Null, dan Increment Counter
    int counter = prefs.getInt('appCounter') ?? 0;
    counter++;
    
    // Langkah 8: Simpan nilai baru
    await prefs.setInt('appCounter', counter);
    
    // Langkah 9: Perbarui State
    setState(() {
      appCounter = counter;
    });
  }

  // Langkah 13: Buat Method deletePreference()
  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    setState(() {
      appCounter = 0;
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    final String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    final List<dynamic> pizzaMapList = jsonDecode(myString);

    final List<Pizza> pizzas = List<Pizza>.from(
      pizzaMapList.map((pizzaMap) => Pizza.fromJson(pizzaMap)),
    );

    return pizzas;
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }

  @override
  Widget build(BuildContext context) {
    String json = convertToJSON(myPizzas);
    print(json);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Shared Preferences Naditya'),
      ),
      // Langkah 11: Perbarui Tampilan (body)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened the app $appCounter times.',
              style: const TextStyle(fontSize: 18),
            ),
            // Langkah 14: Panggil deletePreference()
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}