import 'package:flutter/material.dart';

class GameTile extends StatelessWidget {
  final String image;
  final bool active;

  const GameTile({super.key, required this.image, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: active ? Colors.green : Colors.black,
          width: active ? 4 : 1.5,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(image),
    );
  }
}
