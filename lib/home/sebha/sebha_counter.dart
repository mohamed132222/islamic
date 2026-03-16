import 'package:flutter/material.dart';

import '../../MyTheme.dart';

class SebhaCounter extends StatelessWidget {
  final int count;

  const SebhaCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .18,
      height: MediaQuery.of(context).size.height * .09,
      decoration: BoxDecoration(
        color: MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          "$count",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: MyTheme.darkColor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
