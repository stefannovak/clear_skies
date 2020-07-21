import 'package:clear_skies/location/Location.dart';
import 'package:clear_skies/widget/OvalWeather.dart';
import 'package:clear_skies/widget/TopRightFAB.dart';
import 'package:clear_skies/widget/WeatherText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.locationData);
  final locationData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var localData;
  double latitude;
  double longitude;

  int selectedIndex = 0;
  final List<String> weatherInfo = ['Today', 'This Week', 'Detailed'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic weatherData) async {
    Location location = Location();
    await location.getCurrentLocation();

    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/star.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TopRightFAB(),
                WeatherText(),
                Container(
                  //More weather info
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: Color(0xF0525C7C),
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
                              children: <Widget>[
                                OvalWeather("Clear", 20, "Now"),
                                OvalWeather("Clear", 19, "7pm"),
                                OvalWeather("Clear", 18, "8pm"),
                                OvalWeather("Clear", 18, "9pm"), //4
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"), //8
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"),
                                OvalWeather("Sunny", 20, "Now"), //12
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
