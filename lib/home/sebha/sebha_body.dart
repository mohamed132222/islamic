import 'package:flutter/material.dart';

class SebhaBody extends StatelessWidget {
  final double turns;

  const SebhaBody({super.key, required this.turns});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .081,
          ),
          child: AnimatedRotation(
            turns: turns,
            duration: const Duration(milliseconds: 500),
            child: Image.asset("assets/images/body_sebha_logo.png"),
          ),
        ),
        Image.asset("assets/images/head_sebha_logo.png"),
      ],
    );
  }
}
