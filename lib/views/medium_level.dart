import 'package:flutter/material.dart';
import '../models/game_item.dart';
import 'level_base.dart';
import 'hard_level.dart';

class MediumLevel extends StatelessWidget {
  const MediumLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return LevelBase(
      title: 'MEDIUM',
      color: Colors.green,
      progress: '2/3',
      items: [
        GameItem(image: 'assets/cent.png', type: 'cent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/cent.png', type: 'cent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
      ],
      onFinish: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HardLevel()),
      ),
    );
  }
}
