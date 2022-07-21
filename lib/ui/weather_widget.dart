// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/service/bloc/weather_bloc.dart';
import 'package:weather_bloc/service/model/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key, required this.weather}) : super(key: key);
  final Weather weather;

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _cityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textFieldWidget(),
        locationWidget(),
        const Spacer(),
        tempWidget(),
        const Spacer(),
      ],
    );
  }

  Padding textFieldWidget() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        controller: _cityNameController,
        decoration: InputDecoration(
          labelText: 'Enter city name',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => BlocProvider.of<WeatherBloc>(context).add(
              GetWeatherByName(cityName: _cityNameController.text),
            ),
          ),
        ),
      ),
    );
  }

  Row locationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.weather.name.toString(),
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
        IconButton(
          onPressed: () => BlocProvider.of<WeatherBloc>(context)
              .add(const GetWeatherByLocation()),
          icon: const Icon(
            Icons.location_on,
            size: 50,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Text tempWidget() {
    return Text(
      '${widget.weather.main.temp.toStringAsFixed(1)}°C',
      style: const TextStyle(
        fontSize: 80,
      ),
    );
  }
}
