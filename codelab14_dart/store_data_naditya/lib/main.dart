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
      title: 'RestFull Api Naditya',
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
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestFull API Naditya'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(),
                isNew: true,
              ),
            ),
          );
        },
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Pizza>>(
          future: callPizzas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            if (!snapshot.hasData) {
              return const Text("Data kosong");
            }

            final pizzas = snapshot.data!;

            return ListView.builder(
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(pizzas[index].id.toString()),
                  direction: DismissDirection.endToStart,

                  // Ketika diswipe / dismissed
                  onDismissed: (direction) async {
                    HttpHelper helper = HttpHelper();

                    // simpan id sebelum dihapus
                    final deletedId = pizzas[index].id;

                    // hapus dari list UI
                    setState(() {
                      pizzas.removeAt(index);
                    });

                    // hapus di Wiremock
                    if (deletedId != null) {
                      await helper.deletePizza(deletedId);
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pizza deleted")),
                    );
                  },

                  // Background swipe merah
                  background: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.only(right: 16),
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  child: ListTile(
                    title: Text(pizzas[index].pizzaName),
                    subtitle: Text(
                        "${pizzas[index].description} - € ${pizzas[index].price}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PizzaDetailScreen(
                            pizza: pizzas[index],
                            isNew: false,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
