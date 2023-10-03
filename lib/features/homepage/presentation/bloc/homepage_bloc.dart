import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';
import 'package:test_praktek/features/homepage/domain/usecases/get_region_usecase.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final GetRegionUseCase _getRegionUseCase;

  HomepageBloc(
    this._getRegionUseCase,
  ) : super(HomepageInitial()) {
    on<GetRegionEvent>(onProccessGetRegion);
  }

  Future<void> onProccessGetRegion(
      GetRegionEvent event, Emitter<HomepageState> emit) async {
    emit(RegionLoading());
    final result = await _getRegionUseCase.call();
    result.fold(
      (error) => emit(RegionFailed(message: error.message)),
      (data) => emit(RegionLoaded(listRegion: data)),
    );
  }


}
