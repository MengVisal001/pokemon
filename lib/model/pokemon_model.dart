// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<PokemonModel> pokemonModelFromJson(String str) => List<PokemonModel>.from(
    json.decode(str).map((x) => PokemonModel.fromJson(x)));

class PokemonModel extends Equatable {
  final String? name;
  final String? id;
  final String? imageurl;
  final String? xdescription;
  final String? ydescription;
  final String? height;
  final String? category;
  final String? weight;
  final List<String>? typeofpokemon;
  final List<String>? weaknesses;
  final List<String>? evolutions;
  final List<String>? abilities;
  final int? hp;
  final int? attack;
  final int? defense;
  final int? specialAttack;
  final int? specialDefense;
  final int? speed;
  final int? total;
  final String? malePercentage;
  final String? femalePercentage;
  final int? genderless;
  final String? cycles;
  final String? eggGroups;
  final String? evolvedfrom;
  final String? reason;
  final String? baseExp;
  final bool? isFavorite;
  
  const PokemonModel({
    this.name,
    this.id,
    this.imageurl,
    this.xdescription,
    this.ydescription,
    this.height,
    this.category,
    this.weight,
    this.typeofpokemon,
    this.weaknesses,
    this.evolutions,
    this.abilities,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.evolvedfrom,
    this.reason,
    this.baseExp,
    this.isFavorite,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        id: json["id"],
        imageurl: json["imageurl"],
        xdescription: json["xdescription"],
        ydescription: json["ydescription"],
        height: json["height"],
        category: json["category"],
        weight: json["weight"],
        typeofpokemon: List<String>.from(json["typeofpokemon"].map((x) => x)),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        evolutions: List<String>.from(json["evolutions"].map((x) => x)),
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        hp: json["hp"],
        attack: json["attack"],
        defense: json["defense"],
        specialAttack: json["special_attack"],
        specialDefense: json["special_defense"],
        speed: json["speed"],
        total: json["total"],
        malePercentage: json["male_percentage"],
        femalePercentage: json["female_percentage"],
        genderless: json["genderless"],
        cycles: json["cycles"],
        eggGroups: json["egg_groups"],
        evolvedfrom: json["evolvedfrom"],
        reason: json["reason"],
        baseExp: json["base_exp"],
      );

  @override
  List<Object> get props {
    return [
      name!,
      id!,
      xdescription!,
      imageurl!,
      ydescription!,
      height!,
      category!,
      weight!,
      typeofpokemon!,
      weaknesses!,
      evolutions!,
      abilities!,
      hp!,
      attack!,
      defense!,
      specialAttack!,
      specialDefense!,
      speed!,
      total!,
      malePercentage ?? '',
      femalePercentage ?? '',
      genderless!,
      cycles!,
      eggGroups!,
      evolvedfrom!,
      reason!,
      baseExp!,
    ];
  }
}
