import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/quran/quran_details_screen.dart';

import '../../provider/app_provider.dart';

class SuraNameItem extends StatelessWidget {
  String title;
  int index;

  SuraNameItem({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        QuranDetailsScreen.routeName,
        arguments: SuraArg(title: title, index: index),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.whiteColor
                : MyTheme.darkColor,
          ),
        ),
      ),
    );
  }
}
