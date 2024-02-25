import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherState,
                ),
              ),
              home: HomePage(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.red;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber; // You can adjust the shade of yellow as needed
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Rainy':
      return Colors.indigo;
    case 'Stormy':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}
