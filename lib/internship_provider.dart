import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InternshipProvider extends ChangeNotifier {
  List<dynamic> internships = [];
  bool isLoading = true;

  InternshipProvider() {
    fetchInternships();
  }

  Future<void> fetchInternships() async {
    final url = Uri.parse('https://internshala.com/flutter_hiring/search');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      internships = json.decode(response.body);
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load internships');
    }
  }
}
