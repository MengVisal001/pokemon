import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokemon/resources/colors.dart';

import 'feature/favorite/cubit/favorite_pokemon_cubit.dart';
import 'feature/home/bloc/pokemon_bloc.dart';
import 'feature/home/screen/pokemon_screen.dart';
import 'feature/search/bloc/search_pokemon_bloc.dart';
import 'localization/cubit/localization_cubit.dart';
import 'localization/localization.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const platform = MethodChannel('pokemon/battery');
  // Get battery level.

  // Get battery level.
  static String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    _batteryLevel = batteryLevel;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc()..add(PokemonLoading()),
        ),
        BlocProvider(create: (context) => LocalizationCubit()),
        BlocProvider(create: (_) => SearchPokemonBloc()),
        BlocProvider(create: (_) => FavoritePokemonCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon',
        home: const PokemonScreen(),
        locale: const Locale('en', ''),
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('kh', ''), // Khmer
        ],
        localizationsDelegates: const [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: ThemeData(
          iconTheme: const IconThemeData(color: AppColors.primary),
          drawerTheme: DrawerThemeData(
            backgroundColor: AppColors.white,
            scrimColor: Colors.black87.withOpacity(.25),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.white,
            elevation: .0,
            iconTheme: IconThemeData(
              color: AppColors.primary, //change color on your need
            ),
            titleTextStyle: TextStyle(
              color: AppColors.primary,
              fontSize: 24,
            ),
          ),
          textTheme: const TextTheme(
            subtitle1: TextStyle(color: AppColors.primary),
          ),
          scaffoldBackgroundColor: AppColors.white,
        ),
      ),
    );
  }
}
