import 'dart:async';
import 'package:flutter/foundation.dart';

class GameController {
  int currentIndex = -1;
  Timer? timer;

  void startAutoScan({
    required int gridLength,
    required VoidCallback onComplete,
    required void Function(int) onTick,
  }) {
    timer = Timer.periodic(const Duration(milliseconds: 500), (t) {
      currentIndex++;

      if (currentIndex < gridLength) {
        onTick(currentIndex);
      } else {
        timer?.cancel();
        onComplete();
      }
    });
  }

  void dispose() {
    timer?.cancel();
  }
}
