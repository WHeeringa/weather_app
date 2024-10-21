class Weather {
  final String city;
  final double temperature;
  final String condition;

  Weather({
    required this.city,
    required this.temperature,
    required this.condition
  });

  // factory Weather.fromJson(json){
  //   return Weather(
  //     city: json['name'],
  //     temperature: json['main']['temp'] as double,
  //     condition: json['weather'][0]['main'],
  //   );
  // }
}
