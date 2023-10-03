import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_praktek/core/error/failure.dart';
import 'package:test_praktek/features/homepage/data/datasources/home_api_service.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';
import 'package:test_praktek/features/homepage/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApiService _homeApiService;

  HomeRepositoryImpl(this._homeApiService);

  @override
  Future<Either<Failure, List<RegionEntity>>> getRegion() async {
    try {
      final httpResponse = await _homeApiService.getRegion();

      if ((httpResponse.response.statusCode ?? 0) < 200 ||
          (httpResponse.response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
        );
      }
      return Right(httpResponse.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return Left(ServerFailure(e.response?.data['message'] ?? e.message));
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return const Left(
            ConnectionFailure('Connection timeout, please try again later'));
      } else {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      }
    }
  }

  @override
  Future<Either<Failure, List<DataWeatherEntity>>> getDataWeather(
      String id) async {
    try {
      final httpResponse = await _homeApiService.getDataWeather(
        id: id,
      );

      if ((httpResponse.response.statusCode ?? 0) < 200 ||
          (httpResponse.response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
        );
      }
      return Right(httpResponse.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return Left(ServerFailure(e.response?.data['message'] ?? e.message));
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return const Left(
            ConnectionFailure('Connection timeout, please try again later'));
      } else {
        return const Left(
            ConnectionFailure('Failed to connect to the network'));
      }
    }
  }
}
