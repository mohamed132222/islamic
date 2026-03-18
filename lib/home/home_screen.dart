import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/quran/quran_screen.dart';
import 'package:quran_app/home/radio/radio_screen.dart';
import 'package:quran_app/home/sebha/sebha_screen.dart';
import 'package:quran_app/home/setting/setting_screen.dart';

import '../l10n/app_localizations.dart';
import '../provider/app_provider.dart';
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
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.appTheme == ThemeMode.dark
              ? "assets/images/dark_bg.png"
              : "assets/images/default_bg.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islamic,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.whiteColor
                    : MyTheme.darkColor,
              ),
            ),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: provider.appTheme == ThemeMode.dark
                  ? MyTheme.primaryDarkColor
                  : MyTheme.primaryColor,
            ),
            child: BottomNavigationBar(
              selectedItemColor: provider.appTheme == ThemeMode.dark
                  ? MyTheme.goldColor
                  : MyTheme.darkColor,
              unselectedItemColor: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.whiteColor,
              selectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),

              selectedIconTheme: IconThemeData(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.goldColor
                    : MyTheme.darkColor,
              ),
              unselectedIconTheme: IconThemeData(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.whiteColor
                    : MyTheme.whiteColor,
              ),
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/quran_icon.png"),
                    size: 30,
                  ),
                  label: AppLocalizations.of(context)!.quran,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/hadeth_icon.png"),
                    size: 30,
                  ),
                  label: AppLocalizations.of(context)!.hadeth,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/radio_icon.png"),
                    size: 30,
                  ),
                  label: AppLocalizations.of(context)!.radio,
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/sebha_icon.png"),
                    size: 30,
                  ),
                  label: AppLocalizations.of(context)!.sebha,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, size: 30),
                  label: AppLocalizations.of(context)!.settings,
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
    SettingScreen(),
  ];
}
