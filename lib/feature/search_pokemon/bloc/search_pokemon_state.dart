part of 'search_pokemon_bloc.dart';

abstract class SearchPokemonState extends Equatable {
  const SearchPokemonState();
  
  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchPokemonState {}

class SearchStateLoading extends SearchPokemonState {}

class SearchStateSuccess extends SearchPokemonState {
  const SearchStateSuccess(this.pokemon);

  final List<PokemonModel> pokemon;

  @override
  List<Object> get props => [pokemon];

  @override
  String toString() => 'SearchStateSuccess { pokemon: ${pokemon.length} }';
}

class SearchStateError extends SearchPokemonState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}



