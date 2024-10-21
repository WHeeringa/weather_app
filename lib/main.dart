import 'package:flutter/material.dart';
// Views
import 'package:weather/views/home.dart';
// Plugins
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  // Load env file
  await dotenv.load(fileName: '.env');
  // Run app
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
