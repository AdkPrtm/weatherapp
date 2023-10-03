part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetDataWeatherEvent extends WeatherEvent {
  final String? id;

  const GetDataWeatherEvent({this.id = '501353'});
  @override
  List<Object> get props => [id!];
}
