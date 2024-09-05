import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double widths = 50;
  double heights = 50;
  double borderRadius = 10.0;
  Color colors = Colors.indigo;

  void changeShape() {
    final random = Random();

    widths = random.nextInt(300) + 120;
    heights = random.nextInt(400) + 120;
    borderRadius = random.nextInt(100) + 20;
    
    colors = Color.fromRGBO(
      random.nextInt(255), // red 
      random.nextInt(255), // green
      random.nextInt(255), // blue
      1 //opacity
    );
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400 ),
          curve: Curves.elasticOut,
          width: widths <= 0 ? 0 : widths,
          height: heights <= 0 ? 0 : heights,
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon( Icons.play_arrow_rounded),
      ),
    );
  }
}