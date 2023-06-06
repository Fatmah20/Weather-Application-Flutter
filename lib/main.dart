import 'package:flutter/material.dart';
import 'package:weather_app_new/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_new/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
