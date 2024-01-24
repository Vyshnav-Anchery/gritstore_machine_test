import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';

class WeatherController extends ChangeNotifier {
  WeatherServices weatherServices = WeatherServices();
  double? latitude;
  double? longitude;
  Future<WeatherModel?> getWeather() async {
    try {
      if (latitude == null && longitude == null) {
        getCurrentLocation();
      }
      final currentWeather =
          weatherServices.getWeatherDetails(latitude, longitude);
      return currentWeather;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  void getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    notifyListeners();
  }

  refresh() => notifyListeners();
}
