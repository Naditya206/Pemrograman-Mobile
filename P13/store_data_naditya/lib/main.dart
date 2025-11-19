import 'dart:convert';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  Future<List<Pizza>> readJsonFile() async {
    final String myString =
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist_broken.json');
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
    // Cetak JSON hasil konversi ke konsol
    String json = convertToJSON(myPizzas);
    print(json);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('JSON Naditya'),
      ),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          final pizza = myPizzas[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: pizza.imageUrl.isNotEmpty
                ? Image.asset(
                    pizza.imageUrl,
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.local_pizza),
                  )
                : const Icon(Icons.local_pizza),
              title: Text(pizza.pizzaName),
              subtitle: Text(pizza.description.isNotEmpty ? pizza.description : 'No description'),
              trailing: Text(
                'Rp ${pizza.price.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}