import 'package:weather/models/weather_modal.dart';
import 'dart:convert';
// Plugins
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherService {
  // ignore: non_constant_identifier_names
  static final BASE_URL = dotenv.env['WEATHER_URL'];
  static final apiKey = dotenv.env['WEATHER_API_KEY'];

  // Get Weather Data
  getWeather(String city) async {
    // Must return a Weather Object
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var weather = Weather(
          city: data['name'],
          temperature: data['main']['temp'] as double,
          condition: data['weather'][0]['main']);

      return weather;
    } else {
      throw Exception('Unable to load weather data');
    }
  }
}
