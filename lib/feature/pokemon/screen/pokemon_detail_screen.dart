import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/resources/strings.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.blocContext,
    required this.pokemonModel,
  }) : super(key: key);

  final BuildContext blocContext;
  final PokemonModel pokemonModel;

  static MaterialPageRoute<void> route(
          BuildContext context, PokemonModel pokemonModel) =>
      MaterialPageRoute(
        builder: (_) => PokemonDetailScreen(
          blocContext: context,
          pokemonModel: pokemonModel,
        ),
      );

  Row _data(String label, var value) => Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 15),
          Text(value is String ? value : value.toString())
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(pokemonModel.name!),
        foregroundColor: Colors.black54,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            children: [
              Image.network(pokemonModel.imageurl!),
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings().description,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Text(pokemonModel.xdescription!),
                  const SizedBox(height: 10),
                  Text(pokemonModel.ydescription!),
                  const SizedBox(height: 10),
                  _data('Height', pokemonModel.height!),
                  _data('Weight', pokemonModel.weight!),
                  _data('Type of pokemon',
                      pokemonModel.typeofpokemon!.map((e) => e).toString()),
                  _data('Speed', pokemonModel.speed!.toString()),
                  _data('Hp', pokemonModel.hp!.toString()),
                  _data('Attack', pokemonModel.attack!.toString()),
                  _data('Defense', pokemonModel.defense!.toString()),
                  _data('Category', pokemonModel.category!),
                  _data('Weaknesses', pokemonModel.weaknesses!.map((e) => e)),
                  _data('Evolutions', pokemonModel.evolutions!.map((e) => e)),
                  _data('Abilities', pokemonModel.abilities!.map((e) => e)),
                  _data('Special attach', pokemonModel.specialAttack!),
                  _data('Special defense', pokemonModel.specialDefense!),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
