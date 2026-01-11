import 'package:flutter/material.dart';
import '../models/game_item.dart';
import 'level_base.dart';
import 'medium_level.dart';

class EasyLevel extends StatelessWidget {
  const EasyLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return LevelBase(
      title: 'EASY',
      color: Colors.green,
      progress: '1/3',
      items: [
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
      ],
      onFinish: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MediumLevel()),
      ),
    );
  }
}
