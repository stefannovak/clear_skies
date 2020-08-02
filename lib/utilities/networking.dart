import 'dart:convert';
import 'package:clear_skies/screens/ErrorScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error: ${response.statusCode}");
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => ErrorScreen()),
//      );
    }
  }
}
