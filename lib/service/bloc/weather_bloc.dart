import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/network.dart';
import '../location/location.dart';
import '../model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherByName>(_weatherByName);
    on<GetWeatherByLocation>(_weatherByLocation);
  }

  void _weatherByName(final event, final emit) async {
    emit(WeatherLoading());
    await Network.getWeatherByName(event.cityName).then((weather) {
      emit(WeatherLoaded(weather: weather));
    }).catchError((error) {
      emit(WeatherError(message: error.toString()));
    });
  }

  void _weatherByLocation(final event, final emit) async {
    emit(WeatherLoading());
    final position = await Location().getCurrentLocation();
    await Network.getWeatherByLocation(position.latitude, position.longitude)
        .then((weather) {
      emit(WeatherLoaded(weather: weather));
    }).catchError((error) {
      emit(WeatherError(message: error.toString()));
    });
  }
}
