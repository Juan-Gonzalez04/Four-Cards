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
      'playerNameCannotBeEmpty': 'ERROR: Nombre vacio!',
      'playerAlredyExists': 'ERROR: Jugador ya existente!',
      'playerName': 'Nombre del Jugador',
      'addPlayer': 'Agregar Jugador',
      'players': 'Jugadores',
      'gameSettings': 'Ajustes de juego',
      'scoreLimit': 'Puntaje límite',
      'gameEndCondition': 'Finaliza cuando',
      'lastPlayerStanding': 'Queda un solo jugador',
      'lowestScoreOnFirstElimination': 'el primer jugador es eliminado',
      'notEnougthPlayers': 'ERROR: Cantidad insuficiente de jugadores!',
      'invalidScoreLimit': 'ERROR: Puntaje límite inválido',
      'startGame': 'Empezar',
      'configureNewGame': 'NUEVO JUEGO',
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
      'playerNameCannotBeEmpty': 'ERROR: Empty name!',
      'playerAlredyExists': 'ERROR: Player alredy exists!',
      'playerName': "Player's name",
      'addPlayer': 'Add Player',
      'players': 'Players',
      'gameSettings': 'Game settings',
      'scoreLimit': 'score Limit',
      'gameEndCondition': 'End condition',
      'lastPlayerStanding': 'Last Player Standing',
      'lowestScoreOnFirstElimination': 'Best Score on First Elimination',
      'notEnoughPlayers': 'ERROR: insufficient number of players!',
      'invalidScoreLimit': 'ERROR: Invalid limit score',
      'startGame': 'START',
      'configureNewGame': 'NEW GAME',
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
  String get playerNameCannotBeEmpty => _translate('playerNameCannotBeEmpty');
  String get playerAlredyExists => _translate('playerAlredyExists');
  String get playerName => _translate('playerName');
  String get addPlayer => _translate('addPlayer');
  String get players => _translate('players');
  String get gameSettings => _translate('gameSettings');
  String get scoreLimit => _translate('scoreLimit');
  String get gameEndCondition => _translate('gameEndCondition');
  String get lastPlayerStanding => _translate('lastPlayerStanding');
  String get lowestScoreOnFirstElimination =>
      _translate('lowestScoreOnFirstElimination');
  String get notEnoughPlayers => _translate('notEnoughPlayers');
  String get invalidScoreLimit => _translate('invalidScoreLimit');
  String get startGame => _translate('startGame');
  String get configureNewGame => _translate('configureNewGame');
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
