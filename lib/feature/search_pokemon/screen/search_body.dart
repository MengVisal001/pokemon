import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/widget/pokemon_widget.dart';

import '../bloc/search_pokemon_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
      builder: (context, state) {
        if (state is SearchStateLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.pokemon.isEmpty
              ? const Text('No Results')
              : ListView.separated(
                itemBuilder: (context, index) {
                  return PokemonWidget().listPokemon(
                    context: context,
                    pokemonModel: state.pokemon[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const Padding(padding: EdgeInsets.only(top: 8)),
                itemCount: state.pokemon.length,
              );
        }
        return const Text('Please enter a term to begin');
      },
    );
  }
}
