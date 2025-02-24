import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'translations/translations.i69n.dart';

abstract class AppLocalizations {
  static Translations of(BuildContext context) =>
      Localizations.of<Translations>(context, Translations)!;

  static const LocalizationsDelegate<Translations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[Locale('en')];
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<Translations> {
  const _AppLocalizationsDelegate();

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Translations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return const Translations();
  }

  throw Exception('Language is not supported');
}
