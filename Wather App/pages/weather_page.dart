import 'package:flutter/material.dart';
import 'package:nimbus/services/weather_service.dart';
import 'package:nimbus/models/weather_model.dart';
import 'package:lottie/lottie.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  //api key
  final _weatherService = WeatherService(
    apiKey: '0161273019cc2a09707209599c004daa',
  );

  Weather? _weather;

  // fetch weather
  _fetchWeather(String cityName) async {
    String currentCity = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(currentCity);
      setState(() {
        _weather = weather;
      });
    }
    // Handle any errors that occur during the fetch
    catch (e) {
      debugPrint(
        'Error fetching weather: $e',
      ); // Better for debug logging in Flutter

      if (mounted) {
        setState(() {
          _weather = null; // Clear the weather data if an error occurs
        });
      }
    }
  }

  //weather animation
  String _getWeatherAnimation(String condition) {
    final normalizedCondition = condition.toLowerCase();

    // Clear/Sunny conditions
    if (['clear', 'sunny', 'sun', 'fair'].any(normalizedCondition.contains)) {
      return 'lib/assets/sunny.json';
    }

    // Cloudy conditions
    if ([
      'clouds',
      'cloudy',
      'overcast',
      'scattered clouds',
      'broken clouds',
      'partly cloudy',
      'mostly cloudy',
    ].any(normalizedCondition.contains)) {
      return 'lib/assets/cloud.json';
    }

    // Rain conditions
    if ([
      'rain',
      'shower rain',
      'light rain',
      'moderate rain',
      'heavy rain',
      'freezing rain',
    ].any(normalizedCondition.contains)) {
      return 'lib/assets/rainy.json';
    }

    // Thunderstorm conditions
    if ([
      'thunderstorm',
      'storm',
      'lightning',
      'thundershower',
      'electrical storm',
    ].any(normalizedCondition.contains)) {
      return 'lib/assets/thunder_storm.json';
    }

    // Drizzle/mist conditions
    if ([
      'drizzle',
      'light intensity drizzle',
      'mist',
      'haze',
      'fog',
      'smoke',
      'partly raining',
    ].any(normalizedCondition.contains)) {
      return 'lib/assets/partly_raining.json';
    }

    // Default fallback
    return 'lib/assets/sunny.json';
  }

  @override
  void initState() {
    super.initState();
    // Fetch weather data when the widget is initialized
    _fetchWeather('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //City name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.white), // Location icon
                SizedBox(width: 8), // Spacing between icon and text
                Text(
                  _weather?.cityName ?? 'Loading city...',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 50), // Add some space between city and weather
            //animation
            Lottie.asset(
              _getWeatherAnimation(_weather?.maincondition ?? ''),
              width: 250, // Add constraints
              height: 250,
              fit: BoxFit.contain,
            ),

            SizedBox(
              height: 50,
            ), // Add some space between animation and temperature
            //temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Thermometer icon
                Icon(Icons.thermostat, color: Colors.white, size: 30),
                const SizedBox(width: 8),
                // Temperature text
                Text(
                  _weather != null
                      ? '${_weather!.temperature.toStringAsFixed(1)}°C'
                      : '--.-°C', // Better placeholder for loading
                  style: TextStyle(
                    fontFamily: 'FjallaOne',
                    fontSize: 32, // Slightly larger than city name
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black26,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
