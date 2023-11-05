import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AudioFullScreen extends StatefulWidget {
  const AudioFullScreen({super.key});

  @override
  State<AudioFullScreen> createState() => _AudioFullScreenState();
}

class _AudioFullScreenState extends State<AudioFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
            tag: "HeroOne",
            child: Container(
                width: double.maxFinite, height: 100, color: Colors.amber)));
  }
}
