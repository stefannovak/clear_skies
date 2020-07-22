import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/screens/CityScreen.dart';
import 'package:clear_skies/screens/DetailedScreen.dart';
import 'package:clear_skies/utilities/WeatherModel.dart';
import 'package:clear_skies/widget/OvalWeather.dart';
import 'package:clear_skies/widget/TopRightFAB.dart';
import 'package:clear_skies/widget/WeatherText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.locationData);
  final locationData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weatherModel = WeatherModel();

  /////////////////////////////////List Tile
  int selectedIndex = 0;
  final List<String> weatherInfo = ['Today', 'This Week', 'Detailed'];

  var localData;
  double latitude;
  double longitude;

  int temp;
  String condition;
  String localCity;

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

  ///////////////////////////////DAILY
  List<OvalWeather> dailyWeather = [];

  String oneDayCode;
  int oneDayTemp;
  String oneDayDay;

  String twoDayCode;
  int twoDayTemp;
  String twoDayDay;

  String threeDayCode;
  int threeDayTemp;
  String threeDayDay;

  String fourDayCode;
  int fourDayTemp;
  String fourDayDay;

  String fiveDayCode;
  int fiveDayTemp;
  String fiveDayDay;

  String sixDayCode;
  int sixDayTemp;
  String sixDayDay;

  String sevenDayCode;
  int sevenDayTemp;
  String sevenDayDay;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic weatherData) async {
    Location location = Location();
    await location.getCurrentLocation();

//    localCity = getCityFromCoordinates(location.latitude, location.longitude)
//        .toString();

    localCity =
        await getCityFromCoordinates(location.latitude, location.longitude);
    print(localCity);

    setState(() {
      ///////////////////////////////Weather Column
      double temperature = weatherData["current"]["temp"];
      temp = temperature.toInt();
      condition = weatherData["current"]["weather"][0]["description"];

      /////////////////////////////DAILY WEATHER INFO
      oneDayCode = weatherData["daily"][1]["weather"][0]["icon"];
      oneDayTemp = weatherData["daily"][1]["temp"]["day"].toInt();
      oneDayDay = "Mondayz";

      twoDayCode = weatherData["daily"][2]["weather"][0]["icon"];
      twoDayTemp = weatherData["daily"][2]["temp"]["day"].toInt();

      threeDayCode = weatherData["daily"][3]["weather"][0]["icon"];
      threeDayTemp = weatherData["daily"][3]["temp"]["day"].toInt();

      fourDayCode = weatherData["daily"][4]["weather"][0]["icon"];
      fourDayTemp = weatherData["daily"][4]["temp"]["day"].toInt();

      fiveDayCode = weatherData["daily"][5]["weather"][0]["icon"];
      fiveDayTemp = weatherData["daily"][5]["temp"]["day"].toInt();

      sixDayCode = weatherData["daily"][6]["weather"][0]["icon"];
      sixDayTemp = weatherData["daily"][6]["temp"]["day"].toInt();

      sevenDayCode = weatherData["daily"][7]["weather"][0]["icon"];
      sevenDayTemp = weatherData["daily"][7]["temp"]["day"].toInt();

      dailyWeather.add(OvalWeather(oneDayCode, oneDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(twoDayCode, twoDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(threeDayCode, threeDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(fourDayCode, fourDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(fiveDayCode, fiveDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(sixDayCode, sixDayTemp, oneDayDay));
      dailyWeather.add(OvalWeather(sevenDayCode, sevenDayTemp, oneDayDay));

      ////////////////////////////////////////Hourly Data
      nowHour = temp;
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

      oneTime = weatherData["hourly"][1]["dt"];
      twoTime = weatherData["hourly"][2]["dt"];
      threeTime = weatherData["hourly"][3]["dt"];
      fourTime = weatherData["hourly"][4]["dt"];
      fiveTime = weatherData["hourly"][5]["dt"];
      sixTime = weatherData["hourly"][6]["dt"];
      sevenTime = weatherData["hourly"][7]["dt"];
      eightTime = weatherData["hourly"][8]["dt"];
      nineTime = weatherData["hourly"][9]["dt"];
      tenTime = weatherData["hourly"][10]["dt"];
      elevenTime = weatherData["hourly"][11]["dt"];

      hourlyWeather.add(OvalWeather(nowCond, nowHour, "Now"));
      hourlyWeather.add(OvalWeather(oneCond, oneHour, "one"));
      hourlyWeather.add(OvalWeather(twoCond, twoHour, "two"));
      hourlyWeather.add(OvalWeather(threeCond, threeHour, "9pm")); //4
      hourlyWeather.add(OvalWeather(fourCond, fourHour, "Now"));
      hourlyWeather.add(OvalWeather(fiveCond, fiveHour, "Now"));
      hourlyWeather.add(OvalWeather(sixCond, sixHour, "Now"));
      hourlyWeather.add(OvalWeather(sevenCond, sevenHour, "Now")); //8
      hourlyWeather.add(OvalWeather(eightCond, eightHour, "Now"));
      hourlyWeather.add(OvalWeather(nineCond, nineHour, "Now"));
      hourlyWeather.add(OvalWeather(tenCond, tenHour, "Now"));
      hourlyWeather.add(OvalWeather(elevenCond, elevenHour, "Now")); //12
    });
  }

  Future<String> getCityFromCoordinates(double lat, double long) async {
    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address first = addresses.first;
    return first.subAdminArea;
  }

  String unixToHour(int unix) {
    var now = DateTime.fromMillisecondsSinceEpoch(unix);
    return now.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sun.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TopRightFAB(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CityScreen(),
                      ),
                    );
                  },
                ),
                WeatherText(condition, localCity, temp),
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
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      //This Week
                                      if (selectedIndex ==
                                              index && //WEEK FORECAST
                                          weatherInfo[selectedIndex] ==
                                              "This Week") {
                                        print("Test");
                                      }
                                      //Detail
                                      if (selectedIndex ==
                                              index && //GOING TO DETAIL SCREEN
                                          weatherInfo[selectedIndex] ==
                                              "Detailed") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailedScreen(),
                                          ),
                                        );
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
                              }),
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
                              children: [
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

//                                if(weatherInfo[selectedIndex] == "This Week") {}
//                                dailyWeather[0],
//                                dailyWeather[1],
//                                dailyWeather[2],
//                                dailyWeather[3],
//                                dailyWeather[4],
//                                dailyWeather[5],
//                                dailyWeather[6],
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
        ),
      ),
    );
  }
}
