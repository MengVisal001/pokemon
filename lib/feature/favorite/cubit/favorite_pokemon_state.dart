part of 'favorite_pokemon_cubit.dart';

class AddFavoritePokemon {
  final bool isFavorite;
  final List<PokemonModel> pokemonList;
  AddFavoritePokemon({required this.pokemonList, this.isFavorite = false});
}
