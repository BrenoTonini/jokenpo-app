import 'package:flutter/material.dart';
import '../models/game_logic.dart';
import '../widgets/score_board.dart';
import '../widgets/game_options.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameLogic _gameLogic = GameLogic();

  void _play(String choice) {
    setState(() {
      _gameLogic.play(choice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel e Tesoura'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _gameLogic.resetGame()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ScoreBoard(gameLogic: _gameLogic),
            GameOptions(onPlay: _play),
          ],
        ),
      ),
    );
  }
}
