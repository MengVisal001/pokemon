import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/feature/home/bloc/pokemon_bloc.dart';
import 'package:pokemon/resources/strings.dart';

import '../../../widget/pokemon_widget.dart';
import '../../search_pokemon/screen/search_pokemon_screen.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use this model to get the List of all supported words
    return Scaffold(
      drawer: PokemonWidget().homeDrawer(),
      appBar: AppBar(
        title: Text(Strings().pokemon),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchForm())),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child:
            BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
          if (state is PokemonLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return PokemonWidget().listPokemon(
                  context: context,
                  pokemonModel: state.listPokemon[index],
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(top: 8)),
              itemCount: state.listPokemon.length,
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
