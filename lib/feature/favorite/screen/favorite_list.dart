import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/feature/home/screen/widget/pokemon_widget.dart';

import '../cubit/favorite_pokemon_cubit.dart';

class ListFavoritePokemon extends StatelessWidget {
  const ListFavoritePokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Pokemon'),
      ),
      body: BlocBuilder<FavoritePokemonCubit, AddFavoritePokemon>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              for (int i = 0; i < state.pokemonList.length; i++)
                PokemonWidget().listPokemon(
                    context: context, pokemonModel: state.pokemonList[i]),
            ],
          );
        },
      ),
    );
  }
}
