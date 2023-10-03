import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/usecases/get_data_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherDataCity _getWeatherDataCity;
  WeatherBloc(
    this._getWeatherDataCity,
  ) : super(WeatherInitial()) {
    on<GetDataWeatherEvent>(onProccessGetWeather);
  }

  Future<void> onProccessGetWeather(
      GetDataWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(DataWeatherLoading());

    final result = await _getWeatherDataCity.call(params: event.id);
    result.fold(
      (error) => emit(DataWeatherFailed(message: error.message)),
      (data) => emit(DataWeatherLoaded(dataWeatherEntity: data)),
    );
  }
}
