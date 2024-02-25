import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Weather Data 😎',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'Search Now 🔍',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
