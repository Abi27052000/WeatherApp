import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/additional_information_item.dart';
import 'package:weatherapp/hourly_forcast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/secret.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=${cityName}&APPID=${openWeatherAPIKey}'),
      );

      final data = jsonDecode(res.body);

      if (data["cod"] != "200") {
        throw "An unexpected error occurred. ";
      }
      return data;

      // data["list"][0]["main"]["temp"];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weather APP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  weather = getCurrentWeather();
                });
              },
              icon: const Icon(
                Icons.refresh,
              ),
            )
          ],
        ),
        body: FutureBuilder(
            future: weather,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              }

              final data = snapshot.data!;

              final currentTemp = data["list"][0]["main"]["temp"];
              final currentSky = data["list"][0]["weather"][0]["main"];
              final currentHumidity = data["list"][0]["main"]["humidity"];
              final currentWindSpeed = data["list"][0]["wind"]["speed"];
              final currentPressure = data["list"][0]["main"]["pressure"];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              16,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemp K",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "$currentSky",
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Hourly Forecast",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       for (int i = 0; i < 35; i++) ...[
                    //         HourlyForcastItem(
                    //           time: data["list"][i + 1]["dt"].toString(),
                    //           icon: data["list"][i + 1]["weather"][0]["main"] ==
                    //                       "Rain" ||
                    //                   data["list"][i + 1]["weather"][0]
                    //                           ["main"] ==
                    //                       "Clouds"
                    //               ? Icons.cloud
                    //               : Icons.sunny,
                    //           temperature: data["list"][i + 1]["main"]["temp"]
                    //               .toString(),
                    //         ),
                    //       ]
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          final time =
                              DateTime.parse(data["list"][index + 1]["dt_txt"]);
                          return HourlyForcastItem(
                            time: DateFormat.j().format(time),
                            temperature: data["list"][index + 1]["main"]["temp"]
                                .toString(),
                            icon: data["list"][index + 1]["weather"][0]
                                            ["main"] ==
                                        "Rain" ||
                                    data["list"][index + 1]["weather"][0]
                                            ["main"] ==
                                        "Clouds"
                                ? Icons.cloud
                                : Icons.sunny,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdditionalInfoItem(
                            icon: Icons.water_drop,
                            label: "Humidity",
                            value: currentHumidity.toString(),
                          ),
                          AdditionalInfoItem(
                            icon: Icons.air,
                            label: "Wind Speed",
                            value: currentWindSpeed.toString(),
                          ),
                          AdditionalInfoItem(
                            icon: Icons.beach_access,
                            label: "Pressure",
                            value: currentPressure.toString(),
                          ),
                        ])
                  ],
                ),
              );
            }));
  }
}
