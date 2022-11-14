import 'package:flutter/material.dart';

import 'src/screen/pokemon_screen.dart';


class Pokemon extends StatelessWidget {
  const Pokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: const PokemonScreen(),
    );
  }
}
