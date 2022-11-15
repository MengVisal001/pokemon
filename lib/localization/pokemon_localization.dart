import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonLocalization {
  PokemonLocalization._internal();
  static final PokemonLocalization _singleton = PokemonLocalization._internal();

  static PokemonLocalization get instance => _singleton;

  Map<String, String>? _localizedValues;

  Future<PokemonLocalization> load(Locale locale) async {
    String jsonStringValues = await rootBundle
        .loadString('assets/locale/localization_${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));

    return this;
  }

  // static member to have simple access to the delegate from Material App
  static const LocalizationsDelegate<PokemonLocalization> delegate =
      _PokemonLocalizationsDelegate();

  String text(String key) {
    return _localizedValues![key] ?? "$key not found";
  }
}

class _PokemonLocalizationsDelegate extends LocalizationsDelegate<PokemonLocalization> {
  const _PokemonLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'kh'].contains(locale.languageCode);
  }

  @override
  Future<PokemonLocalization> load(Locale locale) async {
    return PokemonLocalization.instance.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<PokemonLocalization> old) => true;
}
