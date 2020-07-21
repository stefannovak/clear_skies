import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/screens/HomeScreen.dart';
import 'package:clear_skies/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
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

  void getLocalWeather() async {
    var locationData = await location.getCurrentLocation();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return HomeScreen(locationData);
      }),
    );
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
