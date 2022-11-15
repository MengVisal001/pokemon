import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<SelectedLanguage> {
  LocalizationCubit() : super(SelectedLanguage(const Locale('en')));

  void toEng() {
    emit(SelectedLanguage(const Locale('en')));
    AppLocalization.instance.load(state.locale);
  }

  void toKh() {
    emit(SelectedLanguage(const Locale('kh')));
    AppLocalization.instance.load(state.locale);
  }
}
