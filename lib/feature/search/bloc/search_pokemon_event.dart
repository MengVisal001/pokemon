part of 'search_pokemon_bloc.dart';

abstract class SearchPokemonEvent extends Equatable {
  const SearchPokemonEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends SearchPokemonEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
