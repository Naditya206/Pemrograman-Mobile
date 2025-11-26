import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model/pizza.dart';

class HttpHelper {
  // ⚠️ Ganti authority sesuai WireMock instance-mu
  final String authority = 'le5yg.wiremockapi.cloud';
  final String getPath = 'pizzalist'; // no leading slash for Uri.https

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, getPath);
    final http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas = List<Pizza>.from(
        (jsonResponse as List).map((i) => Pizza.fromJson(i as Map<String, dynamic>),
      ));
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const String postPath = 'pizza'; // POST stub path (no leading slash)
    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);

    final http.Response r = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: post,
    );

    return r.body;
  }
}
