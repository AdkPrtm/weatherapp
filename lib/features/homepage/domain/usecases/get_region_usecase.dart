import 'package:dartz/dartz.dart';
import 'package:test_praktek/core/error/failure.dart';
import 'package:test_praktek/core/usecases/usecases.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';
import 'package:test_praktek/features/homepage/domain/repositories/home_repository.dart';

class GetRegionUseCase
    implements UseCase<Either<Failure, List<RegionEntity>>, void> {
  final HomeRepository _homeRepository;

  GetRegionUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<RegionEntity>>> call({void params}) =>
      _homeRepository.getRegion();
}
