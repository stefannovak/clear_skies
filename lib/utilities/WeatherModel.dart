import 'package:clear_skies/location/Location.dart';
import 'networking.dart';

const String openWeatherMapURL =
    "https://api.openweathermap.org/data/2.5/onecall";

class WeatherModel {
//  Future<dynamic> getCityWeather(String cityName) async {
//    var url =
//        "$openWeatherMapURL?q=$cityName&appid=197fcb4116897e4e04a7e7713ab6977f&units=metric";
//    NetworkHelper networkHelper = NetworkHelper(url);
//
//    var weatherData = await networkHelper.getData();
//    return weatherData;
//  }

  Future<dynamic> getLocationWeather(String units) async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely&appid=197fcb4116897e4e04a7e7713ab6977f&units=$units");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  ///Takes the int value returned by the unixToHour method
  ///and returns a string to be used in the hourly containers.
  String hourToNiceTime(int number) {
    if (number == 0) {
      return "12am";
    } else if (number == 1) {
      return "1am";
    } else if (number == 2) {
      return "2am";
    } else if (number == 3) {
      return "3am";
    } else if (number == 4) {
      return "4am";
    } else if (number == 5) {
      return "5am";
    } else if (number == 6) {
      return "6am";
    } else if (number == 7) {
      return "7am";
    } else if (number == 8) {
      return "8am";
    } else if (number == 9) {
      return "9am";
    } else if (number == 10) {
      return "10am";
    } else if (number == 11) {
      return "11am";
    } else if (number == 12) {
      return "12pm";
    } else if (number == 13) {
      return "1pm";
    } else if (number == 14) {
      return "2pm";
    } else if (number == 15) {
      return "3pm";
    } else if (number == 16) {
      return "4pm";
    } else if (number == 17) {
      return "5pm";
    } else if (number == 18) {
      return "6pm";
    } else if (number == 19) {
      return "7pm";
    } else if (number == 20) {
      return "8pm";
    } else if (number == 21) {
      return "9pm";
    } else if (number == 22) {
      return "10pm";
    } else if (number == 23) {
      return "11pm";
    }
  }

  ///Takes the day value and turns it
  ///into a shortened weekday
  String dayToString(int value) {
    if (value == 1) {
      return "Mon";
    } else if (value == 2) {
      return "Tue";
    } else if (value == 3) {
      return "Wed";
    } else if (value == 4) {
      return "Thu";
    } else if (value == 5) {
      return "Fri";
    } else if (value == 6) {
      return "Sat";
    } else if (value == 7) {
      return "Sun";
    }
  }

  ///Takes the wind direction bearing and
  ///translates it into a direction
  String degToDir(int deg) {
    if (deg >= 348 && deg < 11) {
      return "N";
    } else if (deg >= 11 && deg < 34) {
      return "NNE";
    } else if (deg >= 34 && deg < 56) {
      return "NE";
    } else if (deg >= 56 && deg < 79) {
      return "ENE";
    } else if (deg >= 79 && deg < 101) {
      return "E";
    } else if (deg >= 101 && deg < 124) {
      return "ESE";
    } else if (deg >= 124 && deg < 146) {
      return "SE";
    } else if (deg >= 146 && deg < 169) {
      return "SSE";
    } else if (deg >= 169 && deg < 191) {
      return "S";
    } else if (deg >= 191 && deg < 214) {
      return "SSW";
    } else if (deg >= 214 && deg < 236) {
      return "SW";
    } else if (deg >= 236 && deg < 259) {
      return "WSW";
    } else if (deg >= 259 && deg < 281) {
      return "W";
    } else if (deg >= 281 && deg < 304) {
      return "WNW";
    } else if (deg >= 304 && deg < 326) {
      return "NW";
    } else if (deg >= 326 && deg < 348) {
      return "NNW";
    }
  }

  String minuteHandler(int minute) {
    if (minute == 0) {
      return "00";
    } else if (minute == 1) {
      return "01";
    } else if (minute == 2) {
      return "02";
    } else if (minute == 3) {
      return "03";
    } else if (minute == 4) {
      return "04";
    } else if (minute == 5) {
      return "05";
    } else if (minute == 6) {
      return "06";
    } else if (minute == 7) {
      return "07";
    } else if (minute == 8) {
      return "08";
    } else if (minute == 9) {
      return "09";
    } else {
      return minute.toString();
    }
  }
}
