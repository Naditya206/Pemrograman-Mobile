import 'package:flutter/material.dart';
import './model/pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  // Controllers
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  final TextEditingController txtCategory = TextEditingController();
  final TextEditingController txtRating = TextEditingController();

  bool isAvailable = true;
  String operationResult = '';

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    txtCategory.dispose();
    txtRating.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (operationResult.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 12),
                  color: Colors.green[200],
                  child: Text(
                    operationResult,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

              TextField(
                controller: txtId,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtPrice,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtCategory,
                decoration: const InputDecoration(hintText: 'Insert Category'),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  const Text('Available:'),
                  const SizedBox(width: 12),
                  Switch(
                    value: isAvailable,
                    onChanged: (v) {
                      setState(() {
                        isAvailable = v;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),

              TextField(
                controller: txtRating,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(hintText: 'Insert Rating (e.g. 4.5)'),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                child: const Text('Send Post'),
                onPressed: postPizza,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();

    // Build pizza object using safe parsing
    Pizza pizza = Pizza();

    pizza.id = int.tryParse(txtId.text);
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text) ?? 0.0;
    pizza.imageUrl = txtImageUrl.text;
    pizza.category = txtCategory.text;
    pizza.isAvailable = isAvailable;
    pizza.rating = double.tryParse(txtRating.text) ?? 0.0;

    try {
      String result = await helper.postPizza(pizza);
      setState(() {
        operationResult = result;
      });
    } catch (e) {
      setState(() {
        operationResult = 'Error posting pizza: $e';
      });
    }
  }
}
