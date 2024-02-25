import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=751ab0c1cd8c4524b5071533232212&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Error, please try later';
      throw Exception(errorMessage);
    }
  }
}
