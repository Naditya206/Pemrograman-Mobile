import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  
  late File myFile;
  String fileText = '';

  // Langkah 3: Tambahkan Variabel dan Controller
  final pwdController = TextEditingController();
  String myPass = '';

  // Langkah 4: Inisialisasi Secure Storage
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';

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
    
    myFile = File('$documentsPath/pizzas.txt');
    writeFile();
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Naditya, 244107023008');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
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

  // Langkah 5: Buat Method writeToSecureStorage()
  Future writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data berhasil disimpan!')),
    );
  }

  // Langkah 6: Buat Method readFromSecureStorage()
  Future<String> readFromSecureStorage() async {
    String secret = await storage.read(key: myKey) ?? '';
    return secret;
  }

  @override
  Widget build(BuildContext context) {
    String json = convertToJSON(myPizzas);
    print(json);

    // Langkah 7: Edit build() untuk UI dan Logic
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Path Provider'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TextField untuk input password
              TextField(
                controller: pwdController,
                decoration: const InputDecoration(
                  hintText: 'Super Secret String!',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Tombol Save Value
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    elevation: 2,
                  ),
                  child: const Text('Save Value'),
                  onPressed: () {
                    writeToSecureStorage();
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Langkah 8: Hubungkan Read ke Tombol
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    elevation: 2,
                  ),
                  child: const Text('Read Value'),
                  onPressed: () {
                    readFromSecureStorage().then((value) {
                      setState(() {
                        myPass = value;
                      });
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                myPass.isEmpty ? 'Super Secret String!' : myPass,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (myPass.isNotEmpty)
                Text(
                  '(Data berhasil dibaca)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}