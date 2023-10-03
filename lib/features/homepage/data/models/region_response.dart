import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';

class RegionResponse extends RegionEntity {
  const RegionResponse({
    String? id,
    String? propinsi,
    String? kota,
    String? kecamatan,
    String? lat,
    String? lon,
  }) : super(
          id: id,
          propinsi: propinsi,
          kota: kota,
          kecamatan: kecamatan,
          lat: lat,
          lon: lon,
        );

  factory RegionResponse.fromJson(Map<String, dynamic> map) {
    return RegionResponse(
      id: map['id'] ?? '',
      propinsi: map['propinsi'] ?? '',
      kota: map['kota'] ?? '',
      kecamatan: map['kecamatan'] ?? '',
      lat: map['lat'] ?? '',
      lon: map['lon'] ?? '',
    );
  }
}
