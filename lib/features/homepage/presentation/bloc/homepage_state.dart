part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {
  const HomepageState();

  @override
  List<Object> get props => [];
}

class HomepageInitial extends HomepageState {}

class RegionInitial extends HomepageState {}

class RegionLoading extends HomepageState {}

class RegionLoaded extends HomepageState {
  final List<RegionEntity> listRegion;

  const RegionLoaded({required this.listRegion});
  @override
  List<Object> get props => [listRegion];
}

class RegionFailed extends HomepageState {
  final String message;

  const RegionFailed({required this.message});

  @override
  List<Object> get props => [message];
}

