import 'package:flutter/material.dart';
import 'package:quran_app/home/hadeth/hadeth_details_screen.dart';
import 'package:quran_app/home/hadeth/hadeth_screen.dart';

class HadethNameItem extends StatelessWidget {
  Hadeth hadeth;

  HadethNameItem({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        HadethDetailsScreen.routeName,
        arguments: hadeth,
      ),
      child: Center(
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
