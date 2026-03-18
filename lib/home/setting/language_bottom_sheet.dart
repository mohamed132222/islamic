import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/app_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: provider.appTheme == ThemeMode.dark
            ? MyTheme.primaryDarkColor
            : MyTheme.whiteColor,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: provider.appLanguage == "ar"
                ? selectedLanguage(
                    AppLocalizations.of(context)!.arabic,
                    provider,
                  )
                : unSelectedLanguage(
                    AppLocalizations.of(context)!.arabic,
                    provider,
                  ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: provider.appLanguage == "en"
                ? selectedLanguage(
                    AppLocalizations.of(context)!.english,
                    provider,
                  )
                : unSelectedLanguage(
                    AppLocalizations.of(context)!.english,
                    provider,
                  ),
          ),
        ],
      ),
    );
  }

  Widget selectedLanguage(String language, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.goldColor
                  : MyTheme.primaryColor,
            ),
          ),
          Icon(
            Icons.check,
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.goldColor
                : MyTheme.primaryColor,
          ),
        ],
      ),
    );
  }

  Widget unSelectedLanguage(String language, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        language,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.whiteColor
              : MyTheme.darkColor,
        ),
      ),
    );
  }
}
