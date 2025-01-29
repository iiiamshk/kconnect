import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _authToken;

  String? _email;
  String? tempToken;
  String? get email => _email;
  String? authToken;

  Future<void> login(String email, String password) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/login/');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      // Debugging: Log response
      print('Request: ${jsonEncode({'email': email, 'password': password})}');
      print('Response: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        tempToken = responseData['tempToken'];
        notifyListeners();
        // Notify user that OTP is sent
        print("OTP sent successfully.");
      } else {
        // Log the full response body for debugging
        print('Response body: ${response.body}');
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
      throw Exception('Failed to login. Please try again.');
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    final url = Uri.parse('http://10.0.2.2:8000/api/login/verify/');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        authToken = responseData['authToken'];

        notifyListeners();
        print("OTP verified successfully. AuthToken: $authToken");
        notifyListeners();
      } else {
        final error = json.decode(response.body)['data']['error'];
        throw Exception(error ?? 'OTP verification failed');
      }
    } catch (error) {
      rethrow; // Rethrow the error to be handled in the UI
    }
  }

  Future<void> logout() async {
    _authToken = null;
    _email = null;

    // Remove authToken from local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');

    notifyListeners();
  }

  Future<void> loadAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString('authToken');
    notifyListeners();
  }

  bool isLoggedIn() {
    return _authToken != null;
  }
}
