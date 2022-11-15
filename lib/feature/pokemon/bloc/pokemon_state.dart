part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> listPokemon;

  const PokemonLoaded(this.listPokemon);

  @override
  List<Object?> get props => [listPokemon];
}
