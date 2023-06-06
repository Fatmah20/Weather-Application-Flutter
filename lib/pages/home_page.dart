import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_new/models/weather_models.dart';
import 'package:weather_app_new/pages/search_page.dart';

import '../provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<WeatherProvider>(context).weatherData!.getThemeColor(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'There is no weather 😥 Start',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text('Searching now 🔍', style: TextStyle(fontSize: 24)),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                 weatherData!.getThemeColor(),
                 weatherData!.getThemeColor()[100]!,
                 weatherData!.getThemeColor()[50]!,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'update : ${weatherData!.date}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxTemp ${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp ${weatherData!.minTemp.toInt()}')
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
