import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'language_ar.dart';
// import 'language_en.dart';
import 'languages.dart';

class AppLocalizations extends LocalizationsDelegate<BaseLanguage> {
  const AppLocalizations();

  @override
  Future<BaseLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      // case 'en':
      //   return LanguageEn();
      case 'ar':
        return LanguageAr();
// TODO CHANGE TO ARABIC
      default:
        return LanguageAr();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<BaseLanguage> old) => false;
}
