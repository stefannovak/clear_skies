import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  WeatherText(this.desc, this.city, this.temp);

  final String desc;
  final String city;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      //Weather info
      children: <Widget>[
        Text(
          desc,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35.0),
        ),
        Text(
          city,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 30.0),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          temp,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 55.0),
        ),
      ],
    );
  }
}
