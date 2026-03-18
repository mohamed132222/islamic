import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../MyTheme.dart';
import '../../provider/app_provider.dart';

class TasbehText extends StatelessWidget {
  final String tasbeh;

  const TasbehText({super.key, required this.tasbeh});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * .3,
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.dark
            ? MyTheme.goldColor
            : MyTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          tasbeh,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.darkColor
                : MyTheme.whiteColor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
