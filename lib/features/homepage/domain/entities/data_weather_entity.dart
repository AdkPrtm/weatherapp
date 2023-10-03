import 'package:equatable/equatable.dart';

class DataWeatherEntity extends Equatable {
  final String? jamCuaca;
  final String? kodeCuaca;
  final String? cuaca;
  final String? humidity;
  final String? tempC;
  final String? tempF;

  const DataWeatherEntity({
    this.jamCuaca,
    this.kodeCuaca,
    this.cuaca,
    this.humidity,
    this.tempC,
    this.tempF,
  });

  @override
  List<Object?> get props => [
        jamCuaca,
        kodeCuaca,
        cuaca,
        humidity,
        tempC,
        tempF,
      ];
}
