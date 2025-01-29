import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000/api";

  static Future<bool> sendOtp(
      String email, String username, String phoneNumber) async {
    final url = Uri.parse("$baseUrl/login/");
    final response = await http.post(url, body: {
      "email": email,
      "username": username,
      "phone_number": phoneNumber,
    });

    if (response.statusCode == 200) {
      return true; // OTP sent successfully
    } else {
      throw Exception(
          json.decode(response.body)['error'] ?? "Failed to send OTP");
    }
  }

  static Future<Map<String, dynamic>> verifyOtp(
      String email, String otp) async {
    final url = Uri.parse("$baseUrl/verify-otp/");
    final response = await http.post(url, body: {"email": email, "otp": otp});

    if (response.statusCode == 200) {
      return json.decode(response.body); // Return user info or tokens
    } else {
      throw Exception(
          json.decode(response.body)['error'] ?? "Failed to verify OTP");
    }
  }
}
