import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_new/models/weather_models.dart';
import 'package:weather_app_new/provider/weather_provider.dart';
import 'package:weather_app_new/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              print(data);
              WeatherServices services = WeatherServices();
              WeatherModel weather =
                  await services.getWeather(cityName: cityName!);
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              print(weather);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(30),
                hintText: 'Enter a city',
                label: Text('search'),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
