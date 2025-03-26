
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
  
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tirando aquela marca do debug lá
      title: 'Pedra, Papel e Tesoura',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 0, 255)),
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int playerWins = 0;
  int machineWins = 0;
  int draws = 0;

  String playerChoice = '';
  String machineChoice = '';

  final List<String> options = ['pedra', 'papel', 'tesoura'];

  void play(String playerChoice) {
    setState(() {
      this.playerChoice = playerChoice;
      machineChoice = options[DateTime.now().millisecond % 3];

      if (playerChoice == machineChoice) {
        draws++;
      } else if ((playerChoice == 'pedra' && machineChoice == 'tesoura') ||
          (playerChoice == 'papel' && machineChoice == 'pedra') ||
          (playerChoice == 'tesoura' && machineChoice == 'papel')) {
        playerWins++;
      } else {
        machineWins++;
      }
    });
  }



  void resetGame() {
    setState(() {
      playerWins = 0;
      machineWins = 0;
      draws = 0;
      playerChoice = '';
      machineChoice = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedra, Papel e Tesoura'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              resetGame();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[



            // Disputa
            Container(
              child: Column(
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
                            playerChoice.isEmpty ? 'assets/images/indefinido.png' :
                            'assets/images/$playerChoice.png',
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
                            machineChoice.isEmpty ? 'assets/images/indefinido.png' :
                            'assets/images/$machineChoice.png',
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
              ), 
            ),
            


            // Placar
            Container(
              child: Column(
                children: [
                  const Text(
                    'Placar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Você'),
                          Container(
                            width: 100,
                            height: 120,
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '$playerWins',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Empate'),
                          Container(
                            width: 100,
                            height: 120,
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '$draws',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Máquina'),
                          Container(
                            width: 100,
                            height: 120,
                            padding: const EdgeInsets.all(28),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                '$machineWins',
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),



            
            // Opções
            Container(
              child: Column(
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
                        onTap: () => play(option),
                        child: Image.asset(
                          'assets/images/$option.png',
                          width: 100,
                          height: 100,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.question_mark, size: 80),
                        ),
                      );
                    }).toList(),
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
