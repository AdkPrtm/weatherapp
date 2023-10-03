import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';

class DataWeatherPerHours extends StatelessWidget {
  const DataWeatherPerHours({
    super.key,
    required this.dataWeatherEntity,
  });

  final DataWeatherEntity dataWeatherEntity;

  String dateFormatter(String date) {
    DateTime dt = DateTime.parse(date);
    String dates = DateFormat('HH:mm').format(dt);
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dateFormatter(dataWeatherEntity.jamCuaca!),
          style: TextStyle(
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 20.h),
        CachedNetworkImage(
          imageUrl:
              'https://ibnux.github.io/BMKG-importer/icon/${dataWeatherEntity.kodeCuaca}.png',
          width: 70.h,
          height: 70.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20.h),
        Text(
          '${dataWeatherEntity.tempC}\u00B0',
          style: TextStyle(
            fontSize: 30.sp,
          ),
        ),
      ],
    );
  }
}
