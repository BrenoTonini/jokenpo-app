import 'package:flutter/material.dart';

class GameOptions extends StatelessWidget {
  final Function(String) onPlay;

  GameOptions({super.key, required this.onPlay}); 

  final List<String> options = ['pedra', 'papel', 'tesoura'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Opções',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: options.map((option) {
            return GestureDetector(
              onTap: () => onPlay(option),
              child: Image.asset(
                'assets/images/$option.png',
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.question_mark, size: 80),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

