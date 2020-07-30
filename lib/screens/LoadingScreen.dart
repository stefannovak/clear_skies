import 'dart:io';

import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/screens/HomeScreen.dart';
import 'package:clear_skies/utilities/WeatherModel.dart';
import 'package:clear_skies/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String unit;
  LoadingScreen(this.unit);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();
//  String defaultUnit = "metric";

  @override
  void initState() {
    super.initState();
    getLocalWeather();
  }

  void getLocalWeather() async {
    print(widget.unit + "LKFJGHHKJDLFH");
    if (widget.unit == "metric" || widget.unit == null) {
      var weatherData = await WeatherModel().getLocationWeather("metric");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen(weatherData, "F", true);
        }),
      );
    } else if (widget.unit == "imperial") {
      var weatherData = await WeatherModel().getLocationWeather("imperial");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen(weatherData, "C", false);
        }),
      );
    }

//    var weatherData = await WeatherModel().getLocationWeather(widget.unit);

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) {
//        return HomeScreen(weatherData);
//      }),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4C5775),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fetching local weather data...",
              style: kGeneralTextStyle,
            ),
            SizedBox(
              height: 30.0,
            ),
            SpinKitPouringHourglass(
              color: Colors.white,
              size: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
