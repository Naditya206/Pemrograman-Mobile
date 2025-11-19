import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
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
  int appCounter = 0;
  String documentsPath = '';
  String tempPath = '';
  
  // Langkah 2: Tambahkan variabel File dan Text
  late File myFile;
  String fileText = '';

  @override
  void initState() {
    super.initState();
    getPaths();
    readAndWritePreference();
    
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  Future<void> getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    
    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });
    
    // Langkah 4: Inisialisasi File dan Panggil writeFile()
    myFile = File('$documentsPath/pizzas.txt');
    writeFile();
  }

  // Langkah 3: Buat Method writeFile()
  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Naditya, 244107023008');
      return true;
    } catch (e) {
      return false;
    }
  }

  // Langkah 5: Buat Method readFile()
  Future<bool> readFile() async {
    try {
      // Read the file
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      // On error, return false
      return false;
    }
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('appCounter') ?? 0;
    counter++;
    await prefs.setInt('appCounter', counter);
    
    setState(() {
      appCounter = counter;
    });
  }

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

    // Langkah 6: Edit build() dan Tambahkan Tombol Baca
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Path Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (documentsPath.isEmpty)
              const Center(child: CircularProgressIndicator())
            else ...[
              Text('Doc path: $documentsPath'),
              Text('Temp path: $tempPath'),
              ElevatedButton(
                child: const Text('Read File'),
                onPressed: () => readFile(),
              ),
              Text(fileText),
            ],
          ],
        ),
      ),
    );
  }
}