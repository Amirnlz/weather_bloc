import 'package:http/http.dart' as http;

import '../../utilities/constants.dart';
import '../../utilities/extension.dart';
import '../model/weather.dart';

class Network {
  static Future<Weather> getWeatherByName(String cityName) async {
    final response = await http.get(
      '$baseUrl?q=$cityName&appid=$apiKey&units=metric'.parseUri,
    );
    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static Future<Weather> getWeatherByLocation(
      double latitude, double longitude) async {
    final response = await http.get(
      '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
          .parseUri,
    );
    if (response.statusCode == 200) {
      return weatherFromJson(response.body);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
