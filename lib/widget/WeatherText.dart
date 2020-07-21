import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  const WeatherText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //Weather info
      children: <Widget>[
        Text(
          "Clear",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0),
        ),
        Text(
          "Greater London",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 30.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "21°",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55.0),
        ),
      ],
    );
  }
}
