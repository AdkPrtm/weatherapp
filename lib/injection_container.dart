import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_praktek/features/homepage/data/datasources/home_api_service.dart';
import 'package:test_praktek/features/homepage/data/repositories/home_repository_impl.dart';
import 'package:test_praktek/features/homepage/domain/repositories/home_repository.dart';
import 'package:test_praktek/features/homepage/domain/usecases/get_data_weather_usecase.dart';
import 'package:test_praktek/features/homepage/domain/usecases/get_region_usecase.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/weather_bloc.dart';

final sl = GetIt.instance;

void setUpLocator() {
  //BLOC
  sl.registerFactory(() => HomepageBloc(sl()));
  sl.registerFactory(() => WeatherBloc(sl()));

  //USECASE
  sl.registerLazySingleton(() => GetRegionUseCase(sl()));
  sl.registerLazySingleton(() => GetWeatherDataCity(sl()));

  //REPOSITORY
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));

  //DATA SOURCE
  sl.registerLazySingleton(() => HomeApiService(sl()));

  //EXTERNAL
  sl.registerLazySingleton(() => Dio());
}
