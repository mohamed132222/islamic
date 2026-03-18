import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../MyTheme.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/app_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
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
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? selectedTheme(AppLocalizations.of(context)!.light, provider)
                : unSelectedTheme(
                    AppLocalizations.of(context)!.light,
                    provider,
                  ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? selectedTheme(AppLocalizations.of(context)!.dark, provider)
                : unSelectedTheme(AppLocalizations.of(context)!.dark, provider),
          ),
        ],
      ),
    );
  }

  Widget selectedTheme(String theme, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            theme,
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

  Widget unSelectedTheme(String theme, AppProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        theme,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.whiteColor
              : MyTheme.darkColor,
        ),
      ),
    );
  }
}
