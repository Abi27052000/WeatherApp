import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/additional_information_item.dart';
import 'package:weatherapp/hourly_forcast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              onPressed: () {},
              icon: const Icon(
                Icons.refresh,
              ),
            )
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "300 K",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Icon(
                          Icons.cloud,
                          size: 64,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Rain",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Weather Forecast",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourlyForcastItem(
                      time: '00:00',
                      icon: Icons.cloud,
                      temperature: '301.22',
                    ),
                    HourlyForcastItem(
                      time: '00:00',
                      icon: Icons.cloud,
                      temperature: '301.22',
                    ),
                    HourlyForcastItem(
                      time: '14:00',
                      icon: Icons.cloud,
                      temperature: '301.22',
                    ),
                    HourlyForcastItem(
                      time: '00:00',
                      icon: Icons.sunny,
                      temperature: '301.22',
                    ),
                    HourlyForcastItem(
                      time: '00:00',
                      icon: Icons.thunderstorm,
                      temperature: '301.22',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Additional Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                AdditionalInfoItem(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "94",
                ),
                AdditionalInfoItem(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "7.5",
                ),
                AdditionalInfoItem(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1000",
                ),
              ])
            ],
          ),
        ));
  }
}
