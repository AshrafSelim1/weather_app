import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

WeatherModel? weatherModel;

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(239, 0, 89, 255),
        title: Text(
          'Search City',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            var getWeather = BlocProvider.of<GetWeatherCubit>(context);
            getWeather.getWeather(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            label: Text('Search City'),
            hintText: 'Enter Your City',
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color.fromARGB(239, 0, 89, 255),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
