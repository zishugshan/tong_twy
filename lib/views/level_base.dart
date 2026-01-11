import 'package:flutter/material.dart';
import 'package:tong_twy/views/widgets/game_tile.dart';
import '../controllers/game_controller.dart';
import '../models/game_item.dart';

class LevelBase extends StatefulWidget {
  final String title;
  final Color color;
  final String progress;
  final List<GameItem> items;
  final VoidCallback onFinish;

  const LevelBase({
    super.key,
    required this.title,
    required this.color,
    required this.progress,
    required this.items,
    required this.onFinish,
  });

  @override
  State<LevelBase> createState() => _LevelBaseState();
}

class _LevelBaseState extends State<LevelBase> {
  final controller = GameController();
  int activeIndex = -1;

  @override
  void initState() {
    super.initState();

    controller.startAutoScan(
      gridLength: widget.items.length,
      onTick: (index) {
        setState(() => activeIndex = index);
      },
      onComplete: () {
        Future.delayed(const Duration(milliseconds: 500), widget.onFinish);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              widget.progress,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: widget.items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (_, i) => GameTile(
                  image: widget.items[i].image,
                  active: i == activeIndex,
                ),
              ),
            ),

            Text(
              'Level : ${widget.title}',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: widget.color,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
