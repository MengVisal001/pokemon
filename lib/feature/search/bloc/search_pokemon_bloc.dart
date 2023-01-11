import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/model/error_model.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:http/http.dart' as http;

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

const Duration _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  SearchPokemonBloc() : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  void _onTextChanged(
    TextChanged event,
    Emitter<SearchPokemonState> emit,
  ) async {
    var client = http.Client();
    List<PokemonModel> matchQuery = [];
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      var response = await client.get(Uri.parse(
          'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json'));

      for (var pokemon in pokemonModelFromJson(response.body)) {
        if (pokemon.name!.toLowerCase().contains(searchTerm.toLowerCase())) {
          matchQuery.add(pokemon);
        }
      }
      emit(SearchStateSuccess(matchQuery));
    } catch (error) {
      emit(error is SearchResultError
          ? SearchStateError(error.message)
          : const SearchStateError('something went wrong'));
    } finally {
      client.close();
    }
  }
}
