import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tong_twy/views/easy_level.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  final player = AudioPlayer();

  bool showCountdown = false;
  int countdown = 3;

  @override
  void initState() {
    super.initState();

    // Button pulse animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(_controller);

    // Show instructions once
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInstructions();
    });
  }

  void _showInstructions() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("How to Play 🧠"),
        content: const Text(
          "• Watch carefully\n"
          "• Speak the item aloud\n"
          "• Green border moves every second\n"
          "• Think fast — no tapping!",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Got it"),
          ),
        ],
      ),
    );
  }

  void _startGame() async {
    await player.play(AssetSource('lets_go.mp3'));

    setState(() => showCountdown = true);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => countdown--);

      if (countdown == 0) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const EasyLevel()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1CB5E0), Color(0xFF000851)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: showCountdown ? _buildCountdown() : _buildStartUI(),
          ),
        ),
      ),
    );
  }

  Widget _buildCountdown() {
    return Text(
      countdown.toString(),
      style: const TextStyle(
        fontSize: 120,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStartUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Tongue Twister',
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'See • Speak • Think Fast',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 70),
        ScaleTransition(
          scale: _scaleAnimation,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onPressed: _startGame,
            child: const Text(
              "LET'S GO",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
