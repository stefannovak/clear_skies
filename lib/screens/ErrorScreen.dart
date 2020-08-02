import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Color(0xFF4C5775),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sorry!\n",
                style: kGeneralTextStyle,
              ),
              Text(
                "It seems there was a problem connecting to openweathermap.org.\n\nPlease try again later. ",
                style: kGeneralTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
