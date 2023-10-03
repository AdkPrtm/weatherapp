import 'package:dartz/dartz.dart';
import 'package:test_praktek/core/error/failure.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RegionEntity>>> getRegion();
  Future<Either<Failure, List<DataWeatherEntity>>> getDataWeather(String id);
}
