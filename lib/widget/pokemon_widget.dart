import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/localization/cubit/localization_cubit.dart';
import 'package:pokemon/model/pokemon_model.dart';

import '../feature/home/screen/pokemon_detail_screen.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';

class PokemonWidget {
  ListTile listPokemon({
    required BuildContext context,
    required PokemonModel pokemonModel,
  }) {
    return ListTile(
      leading: Image.network(
        pokemonModel.imageurl!,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.image_not_supported,
          size: 28,
          color: AppColors.black54,
        ),
      ),
      title: Text(pokemonModel.name!),
      subtitle: Text(pokemonModel.id!),
      trailing:
          Text(pokemonModel.typeofpokemon!.map((type) => type).toString()),
      onTap: () => Navigator.of(context)
          .push(PokemonDetailScreen.route(context, pokemonModel)),
    );
  }

  /// homepad drawer
  ///
  Drawer homeDrawer() => Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<LocalizationCubit, SelectedLanguage>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings().settings,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    ExpansionTile(
                      iconColor: AppColors.black54,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      title: Text(
                        Strings().language,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text(Strings().khmer),
                          onTap: () {
                            BlocProvider.of<LocalizationCubit>(context).toKh();
                          },
                          trailing: state.locale.languageCode == 'kh'
                              ? const Icon(Icons.check)
                              : const SizedBox(),
                        ),
                        ListTile(
                          title: Text(Strings().english),
                          onTap: () {
                            BlocProvider.of<LocalizationCubit>(context).toEng();
                          },
                          trailing: state.locale.languageCode == 'en'
                              ? const Icon(Icons.check)
                              : const SizedBox(),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
}
