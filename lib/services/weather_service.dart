import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_new/models/weather_models.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'bf2d347eca9e42e8864173506221912';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
