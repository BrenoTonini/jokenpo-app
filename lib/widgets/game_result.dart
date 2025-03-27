import 'package:flutter/material.dart';
import '../models/game_logic.dart';

class GameResult extends StatelessWidget {
  final GameLogic gameLogic;

  const GameResult({super.key, required this.gameLogic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Disputa',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Você'),
                const SizedBox(height: 8),
                Image.asset(
                  gameLogic.playerChoice.isEmpty ? 'assets/images/indefinido.png' :
                  'assets/images/${gameLogic.playerChoice}.png',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.question_mark, size: 80),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Máquina'),
                const SizedBox(height: 8),
                Image.asset(
                  gameLogic.machineChoice.isEmpty ? 'assets/images/indefinido.png' :
                  'assets/images/${gameLogic.machineChoice}.png',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.question_mark, size: 80),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
