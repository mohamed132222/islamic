import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class SebhaBody extends StatelessWidget {
  final double turns;

  const SebhaBody({super.key, required this.turns});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
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
            child: Image.asset(
              provider.appTheme == ThemeMode.dark
                  ? "assets/images/body_sebha_dark.png"
                  : "assets/images/body_sebha_logo.png",
            ),
          ),
        ),
        Image.asset(
          provider.appTheme == ThemeMode.dark
              ? "assets/images/head_sebha_dark.png"
              : "assets/images/head_sebha_logo.png",
        ),
      ],
    );
  }
}
