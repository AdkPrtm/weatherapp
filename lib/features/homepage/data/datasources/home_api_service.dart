import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_praktek/features/homepage/data/models/data_weather_response.dart';
import 'package:test_praktek/features/homepage/data/models/region_response.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: 'https://ibnux.github.io/BMKG-importer/cuaca')
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET('/wilayah.json')
  Future<HttpResponse<List<RegionResponse>>> getRegion();

  @GET("/{id}.json")
  Future<HttpResponse<List<DataWeatherResponse>>> getDataWeather({
    @Path("id") String? id,
  });
}
