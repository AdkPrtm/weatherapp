import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({
    super.key,
    required this.dropDownValue,
    required this.regionEntity,
    required this.dataWeatherEntity,
    required this.city,
    this.onChanged,
  });

  final String dropDownValue;
  final String city;
  final String? Function(String?)? onChanged;
  final List<RegionEntity> regionEntity;
  final DataWeatherEntity dataWeatherEntity;

  DateTime dateFormatter(String date) {
    DateTime dt = DateTime.parse(date);
    return dt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 53.h),
          DropdownButton(
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            ),
            underline: const SizedBox(),
            menuMaxHeight: 300.h,
            dropdownColor: Colors.blue,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.sp,
              fontWeight: FontWeight.bold,
            ),
            value: dropDownValue,
            items: regionEntity.map((entity) {
              return DropdownMenuItem(
                value: entity.id,
                child: SizedBox(
                  width: 160.w,
                  child: Text(
                    entity.kota!,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
          Text(
            city,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${dataWeatherEntity.tempC}\u00B0',
            style: TextStyle(
              fontSize: 109.sp,
              color: Colors.white,
            ),
          ),
          Text(
            DateFormat('EEEE, dd MMMM HH:mm', 'id_ID').format(dateFormatter(dataWeatherEntity.jamCuaca!)),
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.white,
            ),
          ),
          Text(
            '${dataWeatherEntity.cuaca}',
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          CachedNetworkImage(
            imageUrl:
                'https://ibnux.github.io/BMKG-importer/icon/${dataWeatherEntity.kodeCuaca}.png',
            width: 128.h,
            height: 128.h,
          ),
        ],
      ),
    );
  }
}
