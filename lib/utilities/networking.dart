import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  ////Test location URLS
  String Shanghai =
      "https://api.openweathermap.org/data/2.5/onecall?lat=31.2304&lon=121.4737&exclude=minutely&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";
  String Auckland =
      "https://api.openweathermap.org/data/2.5/onecall?lat=36.8483&lon=174.7625&exclude=minutely&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";
  String LA =
      "https://api.openweathermap.org/data/2.5/onecall?lat=34.0522&lon=118.2437&exclude=minutely&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";
  String Kyoto =
      "https://api.openweathermap.org/data/2.5/onecall?lat=35.0116&lon=135.7681&exclude=minutely&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";
  String Bern =
      "https://api.openweathermap.org/data/2.5/onecall?lat=46.9480&lon=7.4474&exclude=minutely&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}
