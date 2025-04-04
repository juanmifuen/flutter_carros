import 'package:http/http.dart' as http;
import 'dart:convert';

class CarService {
  static Future<List> getCars(String token) async {
    final response = await http.get(
      Uri.parse('https://carros-electricos.wiremockapi.cloud/carros'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error: ${response.statusCode}, ${response.body}");
      return [];
    }
  }
}
