import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/quran/sura_name_item.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/app_provider.dart';

class QuranScreen extends StatelessWidget {
  static const String routeName = '/quran';
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس",
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Center(child: Image.asset("assets/images/quran_logo.png")),
        Divider(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.goldColor
              : MyTheme.primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.suraname,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.whiteColor
                : MyTheme.darkColor,
          ),
        ),
        Divider(
          color: provider.appTheme == ThemeMode.dark
              ? MyTheme.goldColor
              : MyTheme.primaryColor,
          thickness: 3,
        ),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) =>
                SuraNameItem(title: suraName[index], index: index),
            separatorBuilder: (context, index) => Divider(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.goldColor
                  : MyTheme.primaryColor,
              thickness: 3,
            ),
            itemCount: suraName.length,
          ),
        ),
      ],
    );
  }
}
