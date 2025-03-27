import 'package:flutter/material.dart';
import '../models/game_logic.dart';

class ScoreBoard extends StatelessWidget {
  final GameLogic gameLogic;

  const ScoreBoard({super.key, required this.gameLogic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Placar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildScoreBox('Você', gameLogic.playerWins, context),
            _buildScoreBox('Empate', gameLogic.draws, context),
            _buildScoreBox('Máquina', gameLogic.machineWins, context),
          ],
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildScoreBox(String label, int score, BuildContext context) {
    return Column(
      children: [
        Text(label),
        Container(
          width: 100,
          height: 120,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('$score', style: const TextStyle(fontSize: 24)),
          ),
        ),
      ],
    );
  }
}
