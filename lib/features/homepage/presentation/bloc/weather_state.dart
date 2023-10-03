part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

class DataWeatherLoading extends WeatherState {}

class DataWeatherLoaded extends WeatherState {
  final List<DataWeatherEntity>? dataWeatherEntity;

  const DataWeatherLoaded({required this.dataWeatherEntity});
  @override
  List<Object> get props => [dataWeatherEntity!];
}

class DataWeatherFailed extends WeatherState {
  final String message;

  const DataWeatherFailed({required this.message});
  @override
  List<Object> get props => [message];
}
