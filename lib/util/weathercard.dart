import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherCard extends StatelessWidget {
  final String? icon;
  final String? timedata;
  const WeatherCard({super.key, required this.icon, required this.timedata});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        width: 80,
        child: Column(children: [
          Lottie.asset(icon!),
          Text(
            timedata!,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ]));
  }
}
