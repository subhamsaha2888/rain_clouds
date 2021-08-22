import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rain_clouds/models/weather_model.dart';

class OpenWeatherApi {
  static Future<WeatherModel> getCityWeather(
      {required double latitude, required double longitude}) async {
    const apiKey = 'dfae261500d06390730d6595903a44bf';
    final finalUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      print("Weather Data: ${response.body}");
      return WeatherModel.fromJson(jsonDecode(data));
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data');
    }
  }
}
