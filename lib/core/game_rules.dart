class GameRules {
  // Tongue‑twister logic:
  // Select the item that appears ODD number of times
  static bool isCorrect(String type, List<String> allTypes) {
    int count = allTypes.where((e) => e == type).length;
    return count.isOdd;
  }
}
