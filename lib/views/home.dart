import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
// Modals
import 'package:weather/models/weather_modal.dart';
// Services
import 'package:weather/services/weather_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Setup
  Weather? weather;

  // Fetch Weather
  getWeather() async {
    // Get city
    String city = 'Dordrecht';
    // Get weather from city
    try {
      var _weather = await WeatherService().getWeather(city);
      // Set the weather
      setState(() {
        // When calling setState, we want to change something visually
        weather = _weather;
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  String currentWeatherCondition(String? condition) {
    if (condition == null) return 'assets/sunny.json';

    switch (condition.toLowerCase()) {
      case 'clouds':
        return 'assets/cloud.json';
      case 'mist':
        return 'assets/mist.json';
      case 'smoke':
        return 'assets/mist.json';
      case 'haze':
        return 'assets/mist.json';
      case 'dust':
        return 'assets/mist.json';
      case 'fog':
        return 'assets/mist.json';
      case 'rain':
        return 'assets/rain.json';
      case 'drizzle':
        return 'assets/rain.json';
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();

    // OnMount get weather
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // City name
            Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.grey[700],
                ),
                Text(
                  weather?.city.toUpperCase() ?? 'Loading..', 
                  style: TextStyle(
                    fontFamily: 'BebasNeue',
                    color: Colors.grey[700],
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Icon
            Lottie.asset(currentWeatherCondition(weather?.condition)),
            // Temp
            Text('${weather?.temperature.round()}°',
              style: TextStyle(
                fontFamily: 'BebasNeue',
                color: Colors.grey[700],
                fontSize: 36, 
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
