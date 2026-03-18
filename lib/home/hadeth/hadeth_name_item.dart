import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/hadeth/hadeth_details_screen.dart';
import 'package:quran_app/home/hadeth/hadeth_screen.dart';

import '../../MyTheme.dart';
import '../../provider/app_provider.dart';

class HadethNameItem extends StatelessWidget {
  Hadeth hadeth;

  HadethNameItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        HadethDetailsScreen.routeName,
        arguments: hadeth,
      ),
      child: Center(
        child: Text(
          hadeth.title,
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
