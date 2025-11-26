import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'model/pizza.dart';
import 'httphelper.dart';
import 'pizza_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestFull Api Naditya',     // 🔥 sesuai instruksi W14
      theme: ThemeData(
        primarySwatch: Colors.blue,      // 🔥 warna kesukaan
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
  Future<List<Pizza>> callPizzas() async {
    try {
      HttpHelper helper = HttpHelper();
      List<Pizza> pizzas = await helper.getPizzaList();
      return pizzas;
    } catch (e) {
      rethrow;
    }
  }

  List<Pizza> myPizzas = [];
  int appCounter = 0;

  String documentsPath = '';
  String tempPath = '';
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

  // ================================
  //          FILE HANDLING
  // ================================
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

  // ================================
  //       SHARED PREFERENCES
  // ================================
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

  // ================================
  //           JSON READER
  // ================================
  Future<List<Pizza>> readJsonFile() async {
    final String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');

    final List<dynamic> pizzaMapList = jsonDecode(myString);

    return List<Pizza>.from(
      pizzaMapList.map((pizzaMap) => Pizza.fromJson(pizzaMap)),
    );
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }

  // ================================
  //             UI
  // ================================
  @override
  Widget build(BuildContext context) {
    String json = convertToJSON(myPizzas);
    debugPrint(json);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('RestFull Api Naditya'),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PizzaDetailScreen(),
            ),
          );
        },
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Daftar Pizza dari API",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              FutureBuilder<List<Pizza>>(
                future: callPizzas(),
                builder: (BuildContext context, AsyncSnapshot<List<Pizza>> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Tidak ada data pizza');
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final pizza = snapshot.data![index];
                      final name = pizza.pizzaName ?? 'No name';
                      final desc = pizza.description ?? '-';
                      final price = pizza.price ?? 0.0;

                      return ListTile(
                        title: Text(name),
                        subtitle: Text("$desc - € ${price.toString()}"),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
