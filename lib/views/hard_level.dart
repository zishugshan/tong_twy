import 'package:flutter/material.dart';
import 'package:tong_twy/views/easy_level.dart';
import 'package:tong_twy/views/start_page.dart';
import '../models/game_item.dart';
import 'level_base.dart';

class HardLevel extends StatelessWidget {
  const HardLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return LevelBase(
      title: 'HARD',
      color: Colors.green,
      progress: '3/3',
      items: [
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/cent.png', type: 'cent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
        GameItem(image: 'assets/cent.png', type: 'cent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/trent.png', type: 'trent'),
        GameItem(image: 'assets/tent.png', type: 'tent'),
      ],
      onFinish: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const StartPage()),
      ),
    );
  }
}
