import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '9c7f0c8baed3819fd8f065c3ca648555';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int condition, int temperature) {
    if (condition < 300) {
      return 'Thunderstorm ⚡';
    } else if (condition < 400) {
      return 'Carry an ☔';
    } else if (condition < 600) {
      return 'Carry an ☔';
    } else if (condition < 700) {
      return 'Its snowing 🌨';
    } else if (condition < 800) {
      return 'Be careful';
    } else if (condition == 800 && temperature > 20) {
      return 'It\'s 🍦 time';
    } else if (condition == 800 && temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else if (condition <= 804) {
      return 'You might need an ☂';
    } else {
      return '🤷‍';
    }
  }
}
