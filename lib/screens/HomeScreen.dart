import 'dart:io';

import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/screens/CityScreen.dart';
import 'package:clear_skies/screens/DetailedScreen.dart';
import 'package:clear_skies/screens/LoadingScreen.dart';
import 'package:clear_skies/utilities/WeatherModel.dart';
import 'package:clear_skies/widget/OvalWeather.dart';
import 'package:clear_skies/widget/TopRightFAB.dart';
import 'package:clear_skies/widget/WeatherText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.locationData, this.buttonText, this.isCelsiusBool);
  final locationData;

  final buttonText;
  final bool isCelsiusBool;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weatherModel = WeatherModel();
  String defaultUnit = "metric";
  int count = 0;

  /////////////////////////////////List Tile
  int selectedIndex = 0;
  final List<String> weatherInfo = ['Today', 'This Week', 'Detailed'];

  var localData;
  double latitude;
  double longitude;

  int temp;
  String condition;
  String localCity;
  String main;

  //////////////////////////////////HOURLY
  List<OvalWeather> hourlyWeather = [];

  int nowHour;
  int oneHour;
  int twoHour;
  int threeHour;
  int fourHour;
  int fiveHour;
  int sixHour;
  int sevenHour;
  int eightHour;
  int nineHour;
  int tenHour;
  int elevenHour;

  String nowCond;
  String oneCond;
  String twoCond;
  String threeCond;
  String fourCond;
  String fiveCond;
  String sixCond;
  String sevenCond;
  String eightCond;
  String nineCond;
  String tenCond;
  String elevenCond;

  int oneTime;
  int twoTime;
  int threeTime;
  int fourTime;
  int fiveTime;
  int sixTime;
  int sevenTime;
  int eightTime;
  int nineTime;
  int tenTime;
  int elevenTime;

  String oneTimeNumber;
  String twoTimeNumber;
  String threeTimeNumber;
  String fourTimeNumber;
  String fiveTimeNumber;
  String sixTimeNumber;
  String sevenTimeNumber;
  String eightTimeNumber;
  String nineTimeNumber;
  String tenTimeNumber;
  String elevenTimeNumber;

  ///////////////////////////////DAILY
  List<OvalWeather> dailyWeather = [];

  String oneDayCode;
  int oneDayTemp;
  int oneDayDay;
  String oneDayString;

  String twoDayCode;
  int twoDayTemp;
  int twoDayDay;
  String twoDayString;

  String threeDayCode;
  int threeDayTemp;
  int threeDayDay;
  String threeDayString;

  String fourDayCode;
  int fourDayTemp;
  int fourDayDay;
  String fourDayString;

  String fiveDayCode;
  int fiveDayTemp;
  int fiveDayDay;
  String fiveDayString;

  String sixDayCode;
  int sixDayTemp;
  int sixDayDay;
  String sixDayString;

  String sevenDayCode;
  int sevenDayTemp;
  int sevenDayDay;
  String sevenDayString;

  String buttonIndicator;
  bool isCelsius;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String buttonText = widget.buttonText;
    bool isCelsiusBool = widget.isCelsiusBool;
    buttonIndicator = buttonText;
    isCelsius = isCelsiusBool;
    updateUI(widget.locationData);
  }

  void toDetailScreen() async {
    var weatherData = await WeatherModel().getLocationWeather(defaultUnit);

    print(defaultUnit + "AYYYYYYYYY");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailedScreen(weatherData);
      }),
    );
  }

  //Think i can just say if its "50d" weather code, just return clear
  String getBackground(String main) {
    if (main == "Mist" ||
        main == "Smoke" ||
        main == "Haze" ||
        main == "Dust" ||
        main == "Fog" ||
        main == "Sand" ||
        main == "Ash" ||
        main == "Squall" ||
        main == "Tornado") {
      return ("Clear");
    } else if (nowCond == "01n") {
      return ("Stars");
    } else {
      return main;
    }
  }

  void updateUI(dynamic weatherData) async {
    Location location = Location();
    await location.getCurrentLocation();

    localCity =
        await getCityFromCoordinates(location.latitude, location.longitude);
    localCity.toLowerCase();

//    unixToDay(1595505600);

    setState(
      () {
        ///////////////////////////////Weather Column
//        double temperature = weatherData["current"]["temp"].toDouble();
        temp = weatherData["current"]["temp"].toInt();
        condition = weatherData["current"]["weather"][0]["description"];
        main = weatherData["current"]["weather"][0]["main"];

        /////////////////////////////DAILY WEATHER INFO
        oneDayCode = weatherData["daily"][1]["weather"][0]["icon"];
        oneDayTemp = weatherData["daily"][1]["temp"]["day"].toInt();
        oneDayDay = unixToDay(weatherData["daily"][1]["dt"]);
        oneDayString = weatherModel.dayToString(oneDayDay);

        twoDayCode = weatherData["daily"][2]["weather"][0]["icon"];
        twoDayTemp = weatherData["daily"][2]["temp"]["day"].toInt();
        twoDayDay = unixToDay(weatherData["daily"][2]["dt"]);
        twoDayString = weatherModel.dayToString(twoDayDay);

        threeDayCode = weatherData["daily"][3]["weather"][0]["icon"];
        threeDayTemp = weatherData["daily"][3]["temp"]["day"].toInt();
        threeDayDay = unixToDay(weatherData["daily"][3]["dt"]);
        threeDayString = weatherModel.dayToString(threeDayDay);

        fourDayCode = weatherData["daily"][4]["weather"][0]["icon"];
        fourDayTemp = weatherData["daily"][4]["temp"]["day"].toInt();
        fourDayDay = unixToDay(weatherData["daily"][4]["dt"]);
        fourDayString = weatherModel.dayToString(fourDayDay);

        fiveDayCode = weatherData["daily"][5]["weather"][0]["icon"];
        fiveDayTemp = weatherData["daily"][5]["temp"]["day"].toInt();
        fiveDayDay = unixToDay(weatherData["daily"][5]["dt"]);
        fiveDayString = weatherModel.dayToString(fiveDayDay);

        sixDayCode = weatherData["daily"][6]["weather"][0]["icon"];
        sixDayTemp = weatherData["daily"][6]["temp"]["day"].toInt();
        sixDayDay = unixToDay(weatherData["daily"][6]["dt"]);
        sixDayString = weatherModel.dayToString(sixDayDay);

        sevenDayCode = weatherData["daily"][7]["weather"][0]["icon"];
        sevenDayTemp = weatherData["daily"][7]["temp"]["day"].toInt();
        sevenDayDay = unixToDay(weatherData["daily"][7]["dt"]);
        sevenDayString = weatherModel.dayToString(sevenDayDay);

        populateDaily();

        ////////////////////////////////////////Hourly Data
        nowHour = weatherData["hourly"][0]["temp"].toInt();
        oneHour = weatherData["hourly"][1]["temp"].toInt();
        twoHour = weatherData["hourly"][2]["temp"].toInt();
        threeHour = weatherData["hourly"][3]["temp"].toInt();
        fourHour = weatherData["hourly"][4]["temp"].toInt();
        fiveHour = weatherData["hourly"][5]["temp"].toInt();
        sixHour = weatherData["hourly"][6]["temp"].toInt();
        sevenHour = weatherData["hourly"][7]["temp"].toInt();
        eightHour = weatherData["hourly"][8]["temp"].toInt();
        nineHour = weatherData["hourly"][9]["temp"].toInt();
        tenHour = weatherData["hourly"][10]["temp"].toInt();
        elevenHour = weatherData["hourly"][11]["temp"].toInt();

        nowCond = weatherData["hourly"][0]["weather"][0]["icon"];
        oneCond = weatherData["hourly"][1]["weather"][0]["icon"];
        twoCond = weatherData["hourly"][2]["weather"][0]["icon"];
        threeCond = weatherData["hourly"][3]["weather"][0]["icon"];
        fourCond = weatherData["hourly"][4]["weather"][0]["icon"];
        fiveCond = weatherData["hourly"][5]["weather"][0]["icon"];
        sixCond = weatherData["hourly"][6]["weather"][0]["icon"];
        sevenCond = weatherData["hourly"][7]["weather"][0]["icon"];
        eightCond = weatherData["hourly"][8]["weather"][0]["icon"];
        nineCond = weatherData["hourly"][9]["weather"][0]["icon"];
        tenCond = weatherData["hourly"][10]["weather"][0]["icon"];
        elevenCond = weatherData["hourly"][11]["weather"][0]["icon"];

        oneTime = unixToHour(weatherData["hourly"][1]["dt"]);
        twoTime = unixToHour(weatherData["hourly"][2]["dt"]);
        threeTime = unixToHour(weatherData["hourly"][3]["dt"]);
        fourTime = unixToHour(weatherData["hourly"][4]["dt"]);
        fiveTime = unixToHour(weatherData["hourly"][5]["dt"]);
        sixTime = unixToHour(weatherData["hourly"][6]["dt"]);
        sevenTime = unixToHour(weatherData["hourly"][7]["dt"]);
        eightTime = unixToHour(weatherData["hourly"][8]["dt"]);
        nineTime = unixToHour(weatherData["hourly"][9]["dt"]);
        tenTime = unixToHour(weatherData["hourly"][10]["dt"]);
        elevenTime = unixToHour(weatherData["hourly"][11]["dt"]);

        oneTimeNumber = weatherModel.hourToNiceTime(oneTime);
        twoTimeNumber = weatherModel.hourToNiceTime(twoTime);
        threeTimeNumber = weatherModel.hourToNiceTime(threeTime);
        fourTimeNumber = weatherModel.hourToNiceTime(fourTime);
        fiveTimeNumber = weatherModel.hourToNiceTime(fiveTime);
        sixTimeNumber = weatherModel.hourToNiceTime(sixTime);
        sevenTimeNumber = weatherModel.hourToNiceTime(sevenTime);
        eightTimeNumber = weatherModel.hourToNiceTime(eightTime);
        nineTimeNumber = weatherModel.hourToNiceTime(nineTime);
        tenTimeNumber = weatherModel.hourToNiceTime(tenTime);
        elevenTimeNumber = weatherModel.hourToNiceTime(elevenTime);

        populateHourly();
      },
    );
  }

  void populateDaily() {
    dailyWeather.add(OvalWeather(oneDayCode, oneDayTemp, oneDayString));
    dailyWeather.add(OvalWeather(twoDayCode, twoDayTemp, twoDayString));
    dailyWeather.add(OvalWeather(threeDayCode, threeDayTemp, threeDayString));
    dailyWeather.add(OvalWeather(fourDayCode, fourDayTemp, fourDayString));
    dailyWeather.add(OvalWeather(fiveDayCode, fiveDayTemp, fiveDayString));
    dailyWeather.add(OvalWeather(sixDayCode, sixDayTemp, sixDayString));
    dailyWeather.add(OvalWeather(sevenDayCode, sevenDayTemp, sevenDayString));
  }

  void populateHourly() {
    hourlyWeather.add((OvalWeather(nowCond, nowHour, "Now")));
    hourlyWeather.add(OvalWeather(oneCond, oneHour, oneTimeNumber));
    hourlyWeather.add(OvalWeather(twoCond, twoHour, twoTimeNumber));
    hourlyWeather.add(OvalWeather(threeCond, threeHour, threeTimeNumber));
    hourlyWeather.add(OvalWeather(fourCond, fourHour, fourTimeNumber));
    hourlyWeather.add(OvalWeather(fiveCond, fiveHour, fiveTimeNumber));
    hourlyWeather.add(OvalWeather(sixCond, sixHour, sixTimeNumber));
    hourlyWeather.add(OvalWeather(sevenCond, sevenHour, sevenTimeNumber));
    hourlyWeather.add(OvalWeather(eightCond, eightHour, eightTimeNumber));
    hourlyWeather.add(OvalWeather(nineCond, nineHour, nineTimeNumber));
    hourlyWeather.add(OvalWeather(tenCond, tenHour, tenTimeNumber));
    hourlyWeather.add(OvalWeather(elevenCond, elevenHour, elevenTimeNumber));
  }

  Future<String> getCityFromCoordinates(double lat, double long) async {
    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address first = addresses.first;
    return first.subAdminArea.toLowerCase();
  }

  int unixToHour(int unix) {
    var time = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    var dateString = time.hour;
    return dateString;
  }

  int unixToDay(int unix) {
    var time = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
    var dateString = time.weekday;
    return dateString;
  }

  List<Widget> selectedWeather() {
    print("test");
    if (selectedIndex == 0) {
      return [
        hourlyWeather[0],
        hourlyWeather[1],
        hourlyWeather[2],
        hourlyWeather[3],
        hourlyWeather[4],
        hourlyWeather[5],
        hourlyWeather[6],
        hourlyWeather[7],
        hourlyWeather[8],
        hourlyWeather[9],
        hourlyWeather[10],
        hourlyWeather[11],
      ];
    } else if (selectedIndex == 1) {
      return [
        dailyWeather[0],
        dailyWeather[1],
        dailyWeather[2],
        dailyWeather[3],
        dailyWeather[4],
        dailyWeather[5],
        dailyWeather[6],
      ];
    } else {
      print("RIP");
    }
  }

  String getButtonText() {
    if (buttonIndicator == "F") {
      return "F";
    } else if (buttonIndicator == "C") {
      return "C";
    }
  }

  void sleepSec() {
    sleep(const Duration(seconds: 2));
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
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TopRightFAB(
                  text: buttonIndicator,
                  onTap: () {
                    setState(() {
                      if (isCelsius == true) {
                        buttonIndicator = "C";
                        isCelsius = false;

                        ///
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen("imperial"),
                          ),
                        );
                      } else if (isCelsius == false) {
                        buttonIndicator = "F";
                        isCelsius = true;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoadingScreen("metric"),
                          ),
                        );
                      }
                    });

//                    setState(() async {
//                      if (isCelcius == true) {
//                        buttonIndicator = "C";
//                        isCelcius = false;
//                        var weatherData =
//                            await WeatherModel().getLocationWeather("imperial");
//                        updateUI(weatherData);
//                      } else if (isCelcius == false) {
//                        buttonIndicator = "F";
//                        isCelcius = true;
//                        var weatherData =
//                            await WeatherModel().getLocationWeather("metric");
//                        updateUI(weatherData);
//                      }
//                    });
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => LoadingScreen("imperial"),
//                      ),
//                    );
                  },
                ),
                Container(child: WeatherText(condition, localCity, temp)),
                Container(
                  //More weather info
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: Color(0xD0525C7C),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: weatherInfo.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onDoubleTap: () {
                                  //Somehow this conveniently stops the problem
                                  //of multiple clicks on the button
                                  if (selectedIndex ==
                                          index && //GOING TO DETAIL SCREEN
                                      weatherInfo[selectedIndex] ==
                                          "Detailed") {
                                    toDetailScreen();
                                  }
                                },
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;

                                    //Detail
                                    if (selectedIndex ==
                                            index && //GOING TO DETAIL SCREEN
                                        weatherInfo[selectedIndex] ==
                                            "Detailed") {
                                      toDetailScreen();
                                      //Sets the Today text to be underlined
                                      selectedIndex = 0;
                                    } //End of Detail IF statement
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    weatherInfo[index],
                                    style: TextStyle(
                                        color: index == selectedIndex
                                            ? Colors.white
                                            : Colors.grey,
                                        decoration: index == selectedIndex
                                            ? TextDecoration.underline
                                            : null),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 30),
                        decoration: BoxDecoration(
                          color: Color(0xFF2F3148),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                          ),
                        ),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: selectedWeather(),
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
        ),
      ),
    );
  }
}
