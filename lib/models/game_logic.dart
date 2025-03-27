class GameLogic {
  int playerWins = 0;
  int machineWins = 0;
  int draws = 0;
  
  final List<String> options = ['pedra', 'papel', 'tesoura'];
  String playerChoice = '';
  String machineChoice = '';

  void play(String playerChoice) {
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
  }

  void resetGame() {
    playerWins = 0;
    machineWins = 0;
    draws = 0;
    playerChoice = '';
    machineChoice = '';
  }
}
