import 'package:dartz/dartz.dart';
import 'package:test_praktek/core/error/failure.dart';
import 'package:test_praktek/core/usecases/usecases.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/repositories/home_repository.dart';

class GetWeatherDataCity
    implements UseCase<Either<Failure, List<DataWeatherEntity>>, String> {
  final HomeRepository _homeRepository;

  GetWeatherDataCity(this._homeRepository);

  @override
  Future<Either<Failure, List<DataWeatherEntity>>> call({String? params}) =>
      _homeRepository.getDataWeather(params!);
}
