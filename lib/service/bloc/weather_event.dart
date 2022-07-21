part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherByName extends WeatherEvent {
  final String cityName;
  const GetWeatherByName({required this.cityName});
  @override
  List<Object> get props => [cityName];
}

class GetWeatherByLocation extends WeatherEvent {
  const GetWeatherByLocation();
}
