import 'package:weather_api/services/location.dart';
import 'package:weather_api/services/networking.dart';
import 'package:weather_api/util/env.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=${Env.apiKey}&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=${Env.apiKey}&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/thunder.json';
    } else if (condition < 400) {
      return 'assets/drizzle.json';
    } else if (condition < 600) {
      return 'assets/rain.json';
    } else if (condition < 700) {
      return 'assets/snowy.json';
    } else if (condition < 800) {
      return 'assets/wind.json';
    } else if (condition == 800) {
      return 'assets/sunny.json';
    } else if (condition <= 804) {
      return 'assets/cloudy.json';
    } else {
      return '🤷‍';
    }
  }

  /* String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  } */
}
