import 'package:flutter/material.dart';
import 'package:four_cards/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool musicEnable = true;
  bool sfxEnable = true;
  bool vibrationEnabled = true;
  String selectedLanguage = 'Espanol';

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
              title: Text('Idioma', style: _textStyle()),
              subtitle: Text(selectedLanguage),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
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
