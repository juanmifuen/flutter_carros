import 'package:http/http.dart' as http;
import 'dart:convert';

class CarService {
  static Future<List> getCars() async {
    final response = await http.get(Uri.parse('https://67f7d1812466325443eadd17.mockapi.io/carros'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Fallo al cargar los carros');
    }
  }
}
