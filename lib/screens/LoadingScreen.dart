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

  @override
  void initState() {
    super.initState();
    getLocalWeather();
  }

  ///The first call is always in metric from main.dart. This adds the "F" character to the
  ///FAB in homeScreen, and true for "isCelsius". When the button is tapped to change the
  ///degrees, the opposite is passed.
  void getLocalWeather() async {
    if (widget.unit == "metric" || widget.unit == null) {
      var weatherData = await WeatherModel().getLocationWeather("metric");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen(weatherData, "F", true, "c");
        }),
      );
    } else if (widget.unit == "imperial") {
      var weatherData = await WeatherModel().getLocationWeather("imperial");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return HomeScreen(weatherData, "C", false, "f");
        }),
      );
    }
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
