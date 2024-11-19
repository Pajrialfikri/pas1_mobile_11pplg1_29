import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_29/model/Auth_response.dart';

class AuthService {
  static const String baseUrl = 'https://mediadwi.com/api/latihan';

  Future<ApiResponse> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'username': username,
        'password': password,
      },
    );

    final jsonResponse = json.decode(response.body);
    return ApiResponse.fromJson(jsonResponse);
  }

  Future<ApiResponse> register(
      String username,
      String password,
      String fullName,
      String email,
      ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register-user'),
      body: {
        'username': username,
        'password': password,
        'full_name': fullName,
        'email': email,
      },
    );

    final jsonResponse = json.decode(response.body);
    return ApiResponse.fromJson(jsonResponse);
  }

  Future<bool> loginWithEmail(String email, String password) async {
    const String url = 'https://your-login-api.com/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
