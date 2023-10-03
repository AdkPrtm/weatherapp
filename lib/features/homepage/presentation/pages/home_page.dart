import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:test_praktek/features/homepage/domain/entities/data_weather_entity.dart';
import 'package:test_praktek/features/homepage/domain/entities/region_entity.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/weather_bloc.dart';
import 'package:test_praktek/features/homepage/presentation/component/top_screen_component.dart';
import 'package:test_praktek/features/homepage/presentation/widgets/data_weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late List<RegionEntity> regionEntity;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<HomepageBloc>().add(GetRegionEvent());
    context.read<WeatherBloc>().add(const GetDataWeatherEvent());
    initializeDateFormatting();
  }

  late String city = 'Kab. Penajam Paser Utara';
  late String idCity = '501353';
  late DataWeatherEntity dataFinal;

  String dayFormatter(String date) {
    DateTime dt = DateTime.parse(date);
    String dates = DateFormat('dd').format(dt);
    return dates;
  }

  String hourFormatter(String date) {
    DateTime dt = DateTime.parse(date);
    String dates = DateFormat('HH').format(dt);
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6B56FD),
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          if (state is RegionLoaded) {
            regionEntity = state.listRegion;
            return BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is DataWeatherLoaded) {
                  if (state.dataWeatherEntity!.isNotEmpty) {
                    List<DataWeatherEntity> dataToday = state.dataWeatherEntity!
                        .where((data) =>
                            int.parse(dayFormatter(data.jamCuaca!)) ==
                            DateTime.now().day)
                        .toList();
                    List<DataWeatherEntity> dataTomorrow = state
                        .dataWeatherEntity!
                        .where((data) =>
                            int.parse(dayFormatter(data.jamCuaca!)) ==
                            DateTime.now().day + 1)
                        .toList();
                    List<RegionEntity> dataCity = regionEntity
                        .where((element) => element.id == idCity)
                        .toList();

                    List<DataWeatherEntity> dataHour = state.dataWeatherEntity!
                        .where(
                          (element) =>
                              int.parse(hourFormatter(element.jamCuaca!)) >=
                              DateTime.now().hour,
                        )
                        .toList();
                    if (dataHour.isEmpty) {
                      List<DataWeatherEntity> dataHourTomorrow = dataTomorrow
                          .where(
                            (element) =>
                                int.parse(hourFormatter(element.jamCuaca!)) <=
                                DateTime.now().hour,
                          )
                          .toList();
                      dataFinal = dataHourTomorrow[0];
                    } else {
                      dataFinal = dataHour[0];
                    }

                    return Stack(
                      children: [
                        TopScreen(
                          dropDownValue: idCity,
                          city: dataCity[0].kecamatan.toString(),
                          regionEntity: regionEntity,
                          dataWeatherEntity: dataFinal,
                          onChanged: (String? value) {
                            setState(() {
                              idCity = value!;
                              context
                                  .read<WeatherBloc>()
                                  .add(GetDataWeatherEvent(id: value));
                            });
                            return;
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 450.h),
                          height: 150.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/shape.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 530.h),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TabBar(
                                isScrollable: true,
                                unselectedLabelColor: Colors.grey,
                                labelColor: Colors.black,
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorColor: Colors.black,
                                tabs: const [
                                  Tab(
                                    text: 'Hari ini',
                                  ),
                                  Tab(
                                    text: 'Besok',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: dataToday
                                            .map((e) => DataWeatherPerHours(
                                                dataWeatherEntity: e))
                                            .toList(),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 18.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: dataTomorrow
                                            .map((e) => DataWeatherPerHours(
                                                dataWeatherEntity: e))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return AlertDialog(
                      title: const Text('Data is empty'),
                      content: const Text('Can we back to previous city?'),
                      actions: [
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            setState(() {
                              city = 'Kab. Penajam Paser Utara';
                              idCity = '501353';
                              context
                                  .read<WeatherBloc>()
                                  .add(const GetDataWeatherEvent());
                            });
                          },
                        ),
                      ],
                    );
                  }
                }
                if (state is DataWeatherFailed) {
                  return Text(state.message);
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              },
            );
          }
          if (state is RegionFailed) {
            return Text(state.message);
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
