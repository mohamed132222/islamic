import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/home/setting/language_bottom_sheet.dart';
import 'package:quran_app/home/setting/theme_bottom_sheet.dart';

import '../../MyTheme.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.darkColor,
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () => bottomSheetLanguage(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.primaryDarkColor
                    : MyTheme.primaryColor,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "ar"
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: provider.appTheme == ThemeMode.dark
                          ? MyTheme.whiteColor
                          : MyTheme.darkColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.appTheme == ThemeMode.dark
                        ? MyTheme.whiteColor
                        : MyTheme.darkColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.darkColor,
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () => bottomSheetTheme(),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.primaryDarkColor
                    : MyTheme.primaryColor,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appTheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: provider.appTheme == ThemeMode.dark
                          ? MyTheme.whiteColor
                          : MyTheme.darkColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: provider.appTheme == ThemeMode.dark
                        ? MyTheme.whiteColor
                        : MyTheme.darkColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void bottomSheetLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }

  void bottomSheetTheme() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottomSheet(),
    );
  }
}
