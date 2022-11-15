import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc() : super(SearchPokemonInitial()) {
    on<SearchPokemonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
