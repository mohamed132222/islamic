import 'package:flutter/material.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/quran/quran_screen.dart';
import 'package:quran_app/home/radio/radio_screen.dart';
import 'package:quran_app/home/sebha/sebha_screen.dart';

import 'hadeth/hadeth_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/default_bg.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islamic",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(canvasColor: MyTheme.primaryColor),
            child: BottomNavigationBar(
              selectedItemColor: MyTheme.darkColor,
              unselectedItemColor: MyTheme.whiteColor,
              selectedIconTheme: IconThemeData(color: MyTheme.darkColor),
              unselectedIconTheme: IconThemeData(color: MyTheme.whiteColor),
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
                  label: "quran",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/hadeth_icon.png")),
                  label: "quran",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
                  label: "quran",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
                  label: "quran",
                ),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranScreen(),
    HadethScreen(),
    RadioScreen(),
    SebhaScreen(),
  ];
}
