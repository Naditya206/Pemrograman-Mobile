import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model/pizza.dart';

class HttpHelper {
  final String authority = 'le5yg.wiremockapi.cloud';
  final String path = '/pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    Uri url = Uri.https(authority, path);
    http.Response result = await http.get(url);

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }

  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';
    Uri url = Uri.https(authority, postPath);
    String body = json.encode(pizza.toJson());

    http.Response r = await http.post(url, body: body);
    return r.body;
  }

  // 🔥 DITAMBAHKAN UNTUK EDIT/PUT
  Future<String> putPizza(Pizza pizza) async {
    const putPath = '/pizza';
    Uri url = Uri.https(authority, putPath);
    String body = json.encode(pizza.toJson());

    http.Response r = await http.put(url, body: body);
    return r.body;
  }
}
