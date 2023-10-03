import 'package:equatable/equatable.dart';

class RegionEntity extends Equatable {
  final String? id;
  final String? propinsi;
  final String? kota;
  final String? kecamatan;
  final String? lat;
  final String? lon;

  const RegionEntity({
    this.id,
    this.propinsi,
    this.kota,
    this.kecamatan,
    this.lat,
    this.lon,
  });

  @override
  List<Object?> get props => [
        id,
        propinsi,
        kota,
        kecamatan,
        lat,
        lon,
      ];
}
