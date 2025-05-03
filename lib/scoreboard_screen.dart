import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para input formatters
import 'widgets_custom.dart';
import 'package:four_cards/l10n/app_localizations.dart';
import 'player.dart';

enum GameEndCondition { lastPlayerStanding, lowesrScoreOnFirstElimination }

class ScoreboardScreen extends StatefulWidget {
  const ScoreboardScreen({super.key});

  @override
  State<ScoreboardScreen> createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  final List<Player> _players = [];
  final TextEditingController _playerNameController = TextEditingController();
  final TextEditingController _scoreLimitController = TextEditingController(
    text: '100',
  );
  GameEndCondition _gameEndCondition = GameEndCondition.lastPlayerStanding;
  int _scoreLimit = 100;
  bool _gameStarted = false;

  void _addPlayer() {
    final name = _playerNameController.text.trim();
    if (name.isNotEmpty &&
        !_players.any((p) => p.name.toLowerCase() == name.toLowerCase())) {
      setState(() {
        _players.add(Player(name: name));
        _playerNameController.clear();
      });
      FocusScope.of(context).unfocus();
    } else if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).playerNameCannotBeEmpty),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).playerAlredyExists),
        ),
      );
    }
  }

  void _startGame() {
    if (_players.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).notEnoughPlayers)),
      );
      return;
    }

    final limit = int.tryParse(_scoreLimitController.text);
    if (limit == null || limit <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context).invalidScoreLimit)),
      );
      return;
    }

    setState(() {
      _scoreLimit = limit;
      _gameStarted = true;
      // _winner = null;
      for (var player in _players) {
        player.score = 0;
        player.isEliminated = false;
      }
    });
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: RetroAppBar(
        title: AppLocalizations.of(context).scoreboard,
        titleFontSize: 18,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child:
            _gameStarted
                ? _buildGameView(localizations)
                : _buildSetUpView(localizations),
      ),
    );
  }

  Widget _buildSetUpView(AppLocalizations localizations) {
    return ListView(
      children: [
        TextField(
          controller: _playerNameController,
          decoration: InputDecoration(
            labelText: localizations.playerName,
            labelStyle: TextStyle(
              color: Colors.yellow.shade300,
              fontFamily: 'ARCADE',
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade700, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade300, width: 2),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ARCADE',
            fontSize: 18,
          ),
          onSubmitted: (_) => _addPlayer(),
        ),
        SizedBox(height: 10),
        RetroButton(
          label: localizations.addPlayer,
          onPressed: _addPlayer,
          fontSize: 18,
        ),
        SizedBox(height: 20),

        if (_players.isNotEmpty) ...[
          Text(
            localizations.players,
            style: TextStyle(
              color: Colors.yellow.shade300,
              fontSize: 20,
              fontFamily: 'ARCADE',
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children:
                _players
                    .map(
                      (player) => Chip(
                        label: Text(
                          player.name,
                          style: TextStyle(
                            fontFamily: 'ARCADE',
                            color: Colors.black87,
                          ),
                        ),
                        onDeleted: () {
                          setState(() {
                            _players.remove(player);
                          });
                        },
                        deleteIconColor: Colors.redAccent.shade700,
                        backgroundColor: Colors.yellow.shade200,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                      ),
                    )
                    .toList(),
          ),
          Divider(color: Colors.yellow.shade700, height: 30),
        ],
        Text(
          localizations.gameSettings,
          style: TextStyle(
            color: Colors.yellow.shade300,
            fontSize: 20,
            fontFamily: 'ARCADE',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _scoreLimitController,
          decoration: InputDecoration(
            labelText: localizations.scoreLimit,
            labelStyle: TextStyle(
              color: Colors.yellow.shade300,
              fontFamily: 'ARCADE',
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade700, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.yellow.shade300, width: 2),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'ARCADE',
            fontSize: 16,
          ),
          inputFormatters: [
            FilteringTextInputFormatter
                .digitsOnly, // Permitir solo números (Punto 2)
          ],

          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 15),
        Text(
          localizations.gameEndCondition,
          style: TextStyle(
            color: Colors.yellow.shade300,
            fontFamily: 'ARCADE',
            fontSize: 16,
          ),
        ),
        // Envolver los RadioListTile en un Theme para cambiar el color inactivo (Punto 1)
        Column(
          children: [
            RadioListTile<GameEndCondition>(
              title: Text(
                localizations.lastPlayerStanding,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ARCADE',
                  fontSize: 16,
                ),
              ),
              value: GameEndCondition.lastPlayerStanding,
              groupValue: _gameEndCondition,
              onChanged: (value) => setState(() => _gameEndCondition = value!),
              activeColor: Colors.yellow.shade700,
              contentPadding: EdgeInsets.zero,
            ),
            RadioListTile<GameEndCondition>(
              title: Text(
                localizations.lowestScoreOnFirstElimination,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'ARCADE',
                  fontSize: 16,
                ),
              ),
              value: GameEndCondition.lowesrScoreOnFirstElimination,
              groupValue: _gameEndCondition,
              onChanged: (value) => setState(() => _gameEndCondition = value!),
              activeColor: Colors.yellow.shade700,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
        Divider(color: Colors.yellow.shade700, height: 30),
        RetroButton(
          label: localizations.startGame,
          onPressed: _startGame,
          fontSize: 22,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildGameView(AppLocalizations localizations) {
    String gameEndConditionText() {
      switch (_gameEndCondition) {
        case GameEndCondition.lastPlayerStanding:
          return localizations.lastPlayerStanding;
        case GameEndCondition.lowesrScoreOnFirstElimination:
          return localizations.lowestScoreOnFirstElimination;
      }
    }

    return Column(
      children: [
        Text(
          "${localizations.scoreLimit}: $_scoreLimit | \n ${localizations.gameEndCondition}: \n ${gameEndConditionText()}",
          style: TextStyle(
            color: Colors.yellow.shade300,
            fontFamily: 'ARCADE',
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        Divider(color: Colors.yellow.shade700, height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: _players.length,
            itemBuilder: (context, index) {
              final player = _players[index];
              return ListTile(
                dense: true,
                title: Text(
                  player.name,
                  style: TextStyle(
                    color: player.isEliminated ? Colors.grey : Colors.white,
                    fontFamily: 'ARCADE',
                    fontSize: 20,
                    decoration:
                        player.isEliminated ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Text(
                  player.score.toString(),
                  style: TextStyle(
                    color:
                        player.isEliminated
                            ? Colors.grey
                            : Colors.yellow.shade300,
                    fontFamily: 'ARCADE',
                    fontSize: 20,
                  ),
                ),
                //LOGICA PARA AÑADIR LOS PUNTOS
              );
            },
          ),
        ),
        Divider(color: Colors.yellow.shade700, height: 20),
        RetroButton(
          label: localizations.configureNewGame,
          onPressed:
              () => setState(() {
                _gameStarted = false;
              }),
          fontSize: 16,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  void dispose() {
    _playerNameController.dispose();
    _scoreLimitController.dispose();
    super.dispose();
  }
}
