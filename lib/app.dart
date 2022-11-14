import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/bloc/pokemon_bloc.dart';
import 'package:pokemon/pokemon.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonBloc()..add(PokemonLoading()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon',
        home: const Pokemon(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: .0,
            titleTextStyle: TextStyle(
              color: Colors.black54,
              fontSize: 24,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
