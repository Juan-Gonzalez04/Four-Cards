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
      'language': 'IDIOMA',
      'music': 'MUSICA',
      'sfx': 'SFX',
      'vibration': 'VIBRACION',
      'reset': 'RESTABLECER',
      'private': 'PRIVADA',
      'public': 'PUBLICA',
      'scoreboard': 'MARCADOR',
    },
    'en': {
      'play': 'PLAY',
      'career': 'CAREER',
      'profile': 'PROFILE',
      'settings': 'SETTINGS',
      'language': 'Language',
      'music': 'MUSIC',
      'sfx': 'SFX',
      'vibration': 'VIBRATION',
      'reset': 'RESTART',
      'private': 'PRIVATE',
      'public': 'PUBLIC',
      'scoreboard': 'SCOREBOARD',
    },
  };

  String _translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']![key] ??
        key;
  }

  String get play => _translate('play');
  String get career => _translate('career');
  String get profile => _translate('profile');
  String get settings => _translate('settings');
  String get language => _translate('language');
  String get music => _translate('music');
  String get sfx => _translate('sfx');
  String get vibration => _translate('vibration');
  String get reset => _translate('reset');
  String get private => _translate('private');
  String get public => _translate('public');
  String get scoreboard => _translate('scoreboard');
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
