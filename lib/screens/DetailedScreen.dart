import 'package:clear_skies/utilities/WeatherModel.dart';
import 'package:clear_skies/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailedScreen extends StatefulWidget {
  DetailedScreen(this.weatherData);
  final weatherData;

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  WeatherModel weatherModel = WeatherModel();

  String unixSunrise;
  String unixSunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dew;
  double UVI;
  int clouds;
  int visibility;
  double windSp;
  String windDe;

  String nowCond;
  String main;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDetailUI(widget.weatherData);
  }

  String getBackground(String main) {
    if (main == "Mist" ||
        main == "Smoke" ||
        main == "Haze" ||
        main == "Dust" ||
        main == "Fog" ||
        main == "Sand" ||
        main == "Ash" ||
        main == "Squall" ||
        main == "Tornado" ||
        main == null) {
      print(main);
      return ("Clear");
    } else if (nowCond == "01n") {
      return ("Stars");
    } else {
      return main;
    }
  }

  void updateDetailUI(dynamic weatherData) async {
    setState(() {
      nowCond = weatherData["hourly"][0]["weather"][0]["icon"];
      main = weatherData["current"]["weather"][0]["main"];

      unixSunrise = unixToHour(weatherData["current"]["sunrise"]);
      unixSunset = unixToHour(weatherData["current"]["sunset"]);
      temp = weatherData["current"]["temp"].toDouble();
      feelsLike = weatherData["current"]["feels_like"].toDouble();
      pressure = weatherData["current"]["pressure"];
      humidity = weatherData["current"]["humidity"];
      dew = weatherData["current"]["dew_point"].toDouble();
      UVI = weatherData["current"]["uvi"].toDouble();
      clouds = weatherData["current"]["clouds"];
      visibility = weatherData["current"]["visibility"];
      windSp = weatherData["current"]["wind_speed"].toDouble();
      windDe = weatherModel.degToDir(weatherData["current"]["wind_deg"]);
    });
  }

  String unixToHour(int unix) {
    var time = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    var minute = weatherModel.minuteHandler(time.minute.toInt());
    var hour = time.hour;
    String hourTime = "$hour:$minute";
    return hourTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/${getBackground(main)}.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          size: 50.0,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
//                  color: Color(0xD0525C7C),
                      color: Color(0xAA525C7C),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.solidSun,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Sunrise:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $unixSunrise",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Sunset:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $unixSunset",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.thermometerHalf,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Temp:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $temp °c",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Feels like:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $feelsLike °c",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.solidGrinBeamSweat,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Pressure:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $pressure",
                                            style: kDetailTextStyle),
                                        TextSpan(
                                            text: " hPa", style: kUnitStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Humidity:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $humidity%",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.glasses,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Dew Point:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $dew °c",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "UV Index:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $UVI",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.cloud,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Clouds:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $clouds%",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Visibility:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $visibility",
                                            style: kDetailTextStyle),
                                        TextSpan(text: "m", style: kUnitStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.wind,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Speed:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $windSp",
                                            style: kDetailTextStyle),
                                        TextSpan(
                                            text: " M/s", style: kUnitStyle),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Direction:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " $windDe",
                                            style: kDetailTextStyle),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
