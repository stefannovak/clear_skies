import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Clear.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF2F3148),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  icon: Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                  ),
                                  hintText: "Enter City Name"),
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                cityName = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: FlatButton(
                          color: Color(0xF0525C7C),
                          onPressed: () {
                            Navigator.pop(context, cityName);
                          },
                          child: Text(
                            "Get Weather",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
