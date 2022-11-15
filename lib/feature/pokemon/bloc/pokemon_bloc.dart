import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonLoading>((event, emit) async {
      var client = http.Client();
      try {
        var response = await client.get(Uri.parse(
            'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json'));
        emit(PokemonLoaded(pokemonModelFromJson(response.body)));
      } finally {
        FlutterNativeSplash.remove();
        client.close();
      }
    });
  }
}
