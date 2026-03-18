import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../MyTheme.dart';
import '../../provider/app_provider.dart';

class SebhaCounter extends StatelessWidget {
  final int count;

  const SebhaCounter({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .18,
      height: MediaQuery.of(context).size.height * .09,
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.dark
            ? MyTheme.primaryDarkColor
            : MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          "$count",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.whiteColor
                : MyTheme.darkColor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
