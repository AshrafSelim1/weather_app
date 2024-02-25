import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/pages/searchPage.dart';
import 'package:weather_app/widgets/no_weather_data.dart';
import 'package:weather_app/widgets/weather_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 24,
              weight: 32,
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(239, 0, 89, 255),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeatherData();
          } else if (state is WeatherLoadedState) {
            return WeatherData(weatherModel: state.weatherModel,);
          } else {
            return Text('Failure has occurred');
          }
        },
      ),
    );
  }
}
