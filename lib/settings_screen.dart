import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final String? language = prefs.getString('language');
    if (language != null) {
      setState(() {
        selectedLanguage = language;
      });

      if (language == 'Spanish') {
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
              ['Spanish', 'Inglish'].map((lang) {
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

      if (chosen == 'Spanish') {
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
      appBar: RetroAppBar(title: 'AJUSTES'),

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
              title: Text('Musica', style: _textStyle()),
              value: musicEnable,
              onChanged: (bool value) {
                setState(() {
                  musicEnable = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('SFX', style: _textStyle()),
              value: sfxEnable,
              onChanged: (bool value) {
                setState(() {
                  sfxEnable = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vibracion', style: _textStyle()),
              value: vibrationEnabled,
              onChanged: (bool value) {
                setState(() {
                  vibrationEnabled = value;
                });
              },
            ),
            Divider(color: Colors.yellow.shade200),
            ListTile(
              title: Text('Idioma:', style: _textStyle()),
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
                  Text('Restablecer', style: _textStyle()),
                  RetroIconButton(
                    onPressed: () {
                      print('RESTAURAR');
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
