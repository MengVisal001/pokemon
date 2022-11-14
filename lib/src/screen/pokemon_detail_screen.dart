import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.blocContext,
    required this.pokemonModel,
  }) : super(key: key);

  final BuildContext blocContext;
  final PokemonModel pokemonModel;

  static MaterialPageRoute<void> route(
          BuildContext context, PokemonModel pokemonModel) =>
      MaterialPageRoute(
        builder: (_) => PokemonDetailScreen(
          blocContext: context,
          pokemonModel: pokemonModel,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(pokemonModel.name!),
        foregroundColor: Colors.black54,
      ),
    );
  }
}
