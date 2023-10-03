import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';

class DataWeatherResponse extends DataWeatherEntity {
  const DataWeatherResponse({
    String? jamCuaca,
    String? kodeCuaca,
    String? cuaca,
    String? humidity,
    String? tempC,
    String? tempF,
  }) : super(
          jamCuaca: jamCuaca,
          kodeCuaca: kodeCuaca,
          cuaca: cuaca,
          humidity: humidity,
          tempC: tempC,
          tempF: tempF,
        );

  factory DataWeatherResponse.fromJson(Map<String, dynamic> map) {
    return DataWeatherResponse(
      jamCuaca: map['jamCuaca'] ?? '',
      kodeCuaca: map['kodeCuaca'] ?? '',
      cuaca: map['cuaca'] ?? '',
      humidity: map['humidity'] ?? '',
      tempC: map['tempC'] ?? '',
      tempF: map['tempF'] ?? '',
    );
  }
}
