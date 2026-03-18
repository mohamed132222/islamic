import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/hadeth/hadeth_screen.dart';

import '../../MyTheme.dart';
import '../../provider/app_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadeth_details';

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.dark
              ? "assets/images/dark_bg.png"
              : "assets/images/default_bg.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.darkColor,
            ),
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.whiteColor
                    : MyTheme.darkColor,
              ),
            ),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.primaryDarkColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .69,
              child: ListView.builder(
                itemBuilder: (context, index) => Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    args.content[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: provider.appTheme == ThemeMode.dark
                          ? MyTheme.goldColor
                          : MyTheme.darkColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                itemCount: args.content.length,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
