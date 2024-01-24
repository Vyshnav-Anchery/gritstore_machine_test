import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/weather_model.dart';

class WeatherServices {
  final String APIKEY = "e17b7946bad84e9881752724232610";
  late String baseUrl =
      "http://api.weatherapi.com/v1/current.json?key=$APIKEY&q=";

  Future<WeatherModel?> getWeatherDetails(latitude, longitude) async {
    try {
      Response response =
          await http.get(Uri.parse('$baseUrl$latitude,$longitude&aqi=no'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return WeatherModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      log("error ${e.toString()}");
      return null;
    }
  }
}
