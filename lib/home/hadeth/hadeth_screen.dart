import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/hadeth/hadeth_name_item.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/app_provider.dart';

class HadethScreen extends StatefulWidget {
  static const String routeName = '/hadeth';
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  late Future<List<Hadeth>> _hadethFuture;

  @override
  void initState() {
    super.initState();
    _hadethFuture = loadHadeth();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(child: Image.asset("assets/images/hadeth_logo.png")),
          ),
          Divider(
            thickness: 3,
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.goldColor
                : MyTheme.primaryColor,
          ),
          Text(
            AppLocalizations.of(context)!.hadethname,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.darkColor,
            ),
          ),
          Divider(
            thickness: 3,
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.goldColor
                : MyTheme.primaryColor,
          ),
          Expanded(
            child: FutureBuilder<List<Hadeth>>(
              future: _hadethFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: provider.appTheme == ThemeMode.dark
                          ? MyTheme.goldColor
                          : MyTheme.primaryColor,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error loading Hadeth"));
                } else {
                  final hadethList = snapshot.data!;
                  return ListView.builder(
                    itemCount: hadethList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          HadethNameItem(hadeth: hadethList[index]),
                          Divider(
                            thickness: 2,
                            color: provider.appTheme == ThemeMode.dark
                                ? MyTheme.goldColor
                                : MyTheme.primaryColor,
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Hadeth>> loadHadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    // parsing in background isolate
    return compute(parseAhadeth, content);
  }
}

List<Hadeth> parseAhadeth(String content) {
  final ahadethList = content.split("#\r\n");
  List<Hadeth> list = [];
  for (var hadeth in ahadethList) {
    var lines = hadeth.split("\n");
    if (lines.isEmpty) continue;
    final title = lines.removeAt(0);
    list.add(Hadeth(title: title, content: lines));
  }
  return list;
}

class Hadeth {
  final String title;
  final List<String> content;

  Hadeth({required this.title, required this.content});
}
