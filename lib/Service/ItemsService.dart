import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/ItemsModel.dart';

Future<Fruits> fetchFruits() async {
  final response = await http.get(Uri.parse('https://demo.azinova.me/machine-test/api/get_items'));

  if (response.statusCode == 200) {
    return Fruits.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}