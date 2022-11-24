import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/widget/global_constant.dart';

part 'favorite_pokemon_state.dart';

class FavoritePokemonCubit extends Cubit<AddFavoritePokemon> {
  FavoritePokemonCubit() : super(AddFavoritePokemon(pokemonList: []));

  void addToFavorite(PokemonModel pokemonModel) async {
    if (tempPokemon.isNotEmpty) {
      for (var element in tempPokemon) {
        if (pokemonModel.id == element.id) return;
      }
    }
    tempPokemon.add(pokemonModel);
    emit(AddFavoritePokemon(isFavorite: true, pokemonList: tempPokemon));
  }
}
