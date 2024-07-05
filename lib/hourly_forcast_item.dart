import 'package:flutter/material.dart';

class HourlyForcastItem extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;
  const HourlyForcastItem({
    super.key,
    required this.time,
    required this.temperature,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 140,
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                icon,
                size: 32,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                temperature,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
