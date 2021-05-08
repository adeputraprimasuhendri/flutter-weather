import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService{
  Future<WeatherModel> getWeather({String city_name}) async {
    try {
      var response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?q='+city_name+'&appid=b5bedb63d4f648d38784f1b284518479');
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}