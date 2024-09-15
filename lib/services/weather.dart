
import 'location.dart';
import 'network.dart';

const apiKEY="7895640c2d6eab69b7747365d437a53a";
const openWeatherApiMap="https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {

  //CityWeather
  Future<dynamic> getCityWeather(String cityName) async{

    String url="$openWeatherApiMap?q=$cityName&appid=$apiKEY&units=metric";
    NetworkHelper networkHelper=NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    //TODO Calling Mathod from Location Class By Object
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherApiMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKEY&units=metric');

    //String url = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$apiKEY&units=metric";
    //TODO Network Helper Class
   // NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}