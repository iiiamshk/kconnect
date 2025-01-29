import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> safeApiCall(
    BuildContext context,
    Future<http.Response> Function() apiCall,
  ) async {
    try {
      final response = await apiCall();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response; // Successful response
      } else {
        // Handle API errors
        final error = json.decode(response.body)['message'] ??
            "Something went wrong. Please try again.";
        _showErrorSnackbar(context, error);
        throw Exception(error);
      }
    } catch (e) {
      _showErrorSnackbar(context, e.toString());
      throw Exception("An error occurred: ${e.toString()}");
    }
  }

  static void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
