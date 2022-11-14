import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/src/screen/pokemon_detail_screen.dart';

class PokemonWidget {
  PokemonWidget._internal();
  static final PokemonWidget instance = PokemonWidget._internal();
  factory PokemonWidget() => instance;

  ListTile listPokemon(BuildContext context, PokemonModel pokemonModel) {
    return ListTile(
      leading: Image.network(
        pokemonModel.imageurl!,
        loadingBuilder: (context, child, loadingProgress) =>
            const CircularProgressIndicator(),
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.image_not_supported,
          size: 28,
          color: Colors.black87,
        ),
      ),
      title: Text(pokemonModel.name!),
      subtitle: Text(pokemonModel.id!),
      trailing:
          Text(pokemonModel.typeofpokemon!.map((type) => type).toString()),
      onTap: () => Navigator.of(context)
          .push(PokemonDetailScreen.route(context, pokemonModel)),
    );
  }
}
