import 'dart:convert';
import 'package:http/http.dart' as http;

class Registerapi {
  final String _baseUrl = "https://mediadwi.com/api/latihan/register-user";

  Future<Map<String, dynamic>> login(String username, String password, String full_name, String email) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": username,
        "password": password,
        "full_name": full_name,
        "email": email
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to register");
    }
  }
}