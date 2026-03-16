import 'package:flutter/material.dart';

import '../../MyTheme.dart';

class TasbehText extends StatelessWidget {
  final String tasbeh;

  const TasbehText({super.key, required this.tasbeh});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        color: MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          tasbeh,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: MyTheme.whiteColor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
