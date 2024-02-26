import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_api/pages/city_screen.dart';
import 'package:weather_api/services/weather.dart';
import 'package:weather_api/util/mytext.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;
  const HomePage({super.key, this.locationWeather});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String weatherMessage;
  late String city;
  late String time;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        /* weatherMessage = 'Unable to get weather data'; */
        city = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      /* weatherMessage = weather.getMessage(temperature); */
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      city = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.near_me),
              ),
              onTap: () async {
                var weatherData = await weather.getLocationWeather();
                updateUI(weatherData);
              },
            ),
            actions: [
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.location_city),
                ),
                onTap: () async {
                  var typedName = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const CityScreen();
                    }),
                  );
                  if (typedName != null) {
                    var weatherData = await weather.getCityWeather(typedName);
                    updateUI(weatherData);
                  }
                },
              )
            ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: MyText(textData: 'Weather App', size: 20)),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyText(textData: city, size: 50),
                const SizedBox(
                  height: 20,
                ),
                Lottie.asset(weatherIcon),
                const SizedBox(
                  height: 20,
                ),
                MyText(textData: '$temperature°C', size: 50),
              ],
            ),
          ),
        )

        //MyText(textData: weatherMessage, size: 25),
        /*   Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: WeatherCard(
                              icon: weatherIcon, timedata: 'timedata'),
                        );
                      }),
                ),
              ), */
        );
  }
}
