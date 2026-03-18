import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/hadeth/hadeth_details_screen.dart';
import 'package:quran_app/home/home_screen.dart';
import 'package:quran_app/home/quran/quran_details_screen.dart';
import 'package:quran_app/provider/app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(child: MyApp(), create: (context) => AppProvider()),
  );
}

class MyApp extends StatelessWidget {
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    initSharedPreferences();
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Locale(provider.appLanguage),
      initialRoute: HomeScreen.routeName,
      darkTheme: MyTheme.darkTheme,
      theme: MyTheme.lightTheme,
      themeMode: provider.appTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetailsScreen.routeName: (context) => QuranDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }

  Future<void> initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var language = prefs.getString("language");
    var isDark = prefs.getBool("isdark");
    if (language != null) {
      provider.changeLanguage(language);
    }
    if (isDark == true) {
      provider.changeTheme(ThemeMode.dark);
    } else if (provider.appTheme == ThemeMode.light) {
      provider.changeTheme(ThemeMode.light);
    }
  }
}
