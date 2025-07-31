import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String cityName) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception(
        'Failed to load weather data. Status code: ${response.statusCode}',
      );
    }
  }

  Future<String> getCurrentCity() async {
    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // Use new location settings API
    final locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, // Best for navigation
    );

    // Get current position using settings
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    // Reverse geocode to get placemarks
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    // Extract city name from the first placemark
    String? city = placemarks.isNotEmpty ? placemarks[0].locality : null;

    return city ?? "";
  }
}
