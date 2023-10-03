import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/homepage_bloc.dart';
import 'package:test_praktek/features/homepage/presentation/bloc/weather_bloc.dart';
import 'package:test_praktek/features/homepage/presentation/pages/home_page.dart';
import 'package:test_praktek/injection_container.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<HomepageBloc>()),
              BlocProvider(create: (_) => sl<WeatherBloc>()),

            ],
            child: MaterialApp(
              title: 'Weather App',
              theme: ThemeData(
                useMaterial3: true,
              ),
              home: const HomePage(),
            ),
          );
        });
  }
}
