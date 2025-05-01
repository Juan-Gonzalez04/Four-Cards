import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:four_cards/l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;

  const SettingsScreen({super.key, required this.onLanguageChanged});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool musicEnable = true;
  bool sfxEnable = true;
  bool vibrationEnabled = true;
  String selectedLanguage = 'Spanish';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
    _loadPreferences();
  }

  Future<void> resetPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('music_enabled', true);
    await prefs.setBool('sfx_enabled', true);
    await prefs.setBool('vibration_enabled', true);
    await _saveLanguage('EN');
    await _loadLanguage();

    setState(() {
      musicEnable = true;
      sfxEnable = true;
      vibrationEnabled = true;
      selectedLanguage = 'EN';
    });
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      musicEnable = prefs.getBool('music_enabled') ?? true;
      sfxEnable = prefs.getBool('sfx_enabled') ?? true;
      vibrationEnabled = prefs.getBool('vibration_enabled') ?? true;
    });
  }

  Future<void> _savePreferences(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? language = prefs.getString('language');
    if (language != null) {
      setState(() {
        selectedLanguage = language;
      });

      if (language == 'ES') {
        widget.onLanguageChanged(Locale('es'));
      } else {
        widget.onLanguageChanged(Locale('en'));
      }
    }
  }

  // Guardar el idioma cuando se cambia
  Future<void> _saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }

  void _selectLanguage() async {
    final chosen = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.black.withAlpha(230),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children:
              ['ES', 'EN'].map((lang) {
                return ListTile(
                  title: Text(
                    lang,
                    style: TextStyle(
                      fontFamily: 'Arcade',
                      color: Colors.yellow,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context, lang);
                  },
                );
              }).toList(),
        );
      },
    );
    if (chosen != null && chosen != selectedLanguage) {
      setState(() {
        selectedLanguage = chosen;
      });

      await _saveLanguage(chosen);

      if (chosen == 'ES') {
        widget.onLanguageChanged(Locale('es'));
      } else {
        widget.onLanguageChanged(Locale('en'));
      }
    }
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontFamily: 'ARCADE',
      fontSize: 20,
      color: Colors.yellow.shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RetroAppBar(title: AppLocalizations.of(context).settings),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            SwitchListTile(
              title: Text(
                AppLocalizations.of(context).music,
                style: _textStyle(),
              ),
              value: musicEnable,
              onChanged: (bool value) {
                setState(() {
                  musicEnable = value;
                });
                _savePreferences('music_enabled', value);
              },
            ),
            SwitchListTile(
              title: Text(
                AppLocalizations.of(context).sfx,
                style: _textStyle(),
              ),
              value: sfxEnable,
              onChanged: (bool value) {
                setState(() {
                  sfxEnable = value;
                });
                _savePreferences('sfx_enabled', value);
              },
            ),
            SwitchListTile(
              title: Text(
                AppLocalizations.of(context).vibration,
                style: _textStyle(),
              ),
              value: vibrationEnabled,
              onChanged: (bool value) {
                setState(() {
                  vibrationEnabled = value;
                });
                _savePreferences('vibration_enabled', value);
              },
            ),
            Divider(color: Colors.yellow.shade200),
            ListTile(
              title: Text(
                AppLocalizations.of(context).language,
                style: _textStyle(),
              ),
              subtitle: Text(
                selectedLanguage,
                style: TextStyle(
                  color: Colors.yellow.shade500,
                  fontSize: 18,
                  fontFamily: 'ARCADE',
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.yellow.shade200,
              ),
              onTap: _selectLanguage,
            ),
            Divider(color: Colors.yellow.shade200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context).reset, style: _textStyle()),
                  RetroIconButton(
                    onPressed: () {
                      resetPreferences();
                    },
                    icon: Icons.restore,
                    iconSize: 35,
                    padding: EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
