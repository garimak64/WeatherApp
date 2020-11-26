import 'package:flutterweather/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherRepo{
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=07915f51dbc7101a9694014a8e05674c");

    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body, city);
  }

  WeatherModel parsedJson(final response, final String city){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather, city);
  }
}