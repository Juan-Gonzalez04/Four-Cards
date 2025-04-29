import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = {
    'es': {
      'play': 'JUGAR',
      'career': 'CARRERA',
      'profile': 'PERFIL',
      'settings': 'AJUSTES',
      'language': 'Idioma',
    },
    'en': {
      'play': 'PLAY',
      'career': 'CAREER',
      'profile': 'PROFILE',
      'settings': 'SETTINGS',
      'language': 'Language',
    },
  };

  String get play => _localizedValues[locale.languageCode]!['play']!;
  String get career => _localizedValues[locale.languageCode]!['career']!;
  String get profile => _localizedValues[locale.languageCode]!['profile']!;
  String get settings => _localizedValues[locale.languageCode]!['settings']!;
  String get language => _localizedValues[locale.languageCode]!['language']!;
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
