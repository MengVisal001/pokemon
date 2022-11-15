part of 'search_pokemon_bloc.dart';

abstract class SearchPokemonState extends Equatable {
  const SearchPokemonState();
  
  @override
  List<Object> get props => [];
}

class SearchPokemonInitial extends SearchPokemonState {}
