import 'package:flutter/material.dart';

class OvalWeather extends StatelessWidget {
  final String miniIcon;
  final int temp;
  final String time;

  OvalWeather(this.miniIcon, this.temp, this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: Color(0xF0525C7C),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/a01d.png',
              width: 40.0,
              height: 40.0,
            ),
            Text(
              "$temp°",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              time,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
