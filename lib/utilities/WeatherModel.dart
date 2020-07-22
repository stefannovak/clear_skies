import 'package:clear_skies/location/Location.dart';
import 'networking.dart';

const String openWeatherMapURL =
    "https://api.openweathermap.org/data/2.5/onecall";

class WeatherModel {
//  Future<dynamic> getCityWeather(String cityName) async {
//    var url =
//        "$openWeatherMapURL?q=$cityName&appid=ee3cc93e43ef00b96a6bb4e56902d020&units=metric";
//    NetworkHelper networkHelper = NetworkHelper(url);
//
//    var weatherData = await networkHelper.getData();
//    return weatherData;
//  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely&appid=197fcb4116897e4e04a7e7713ab6977f&units=metric");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
