import 'package:clear_skies/location/Location.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Latitude: $latitude"),
            Text("Longitude: $longitude"),
          ],
        ),
      ),
    );
  }
}
