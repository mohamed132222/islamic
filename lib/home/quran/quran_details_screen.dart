import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';

import '../../provider/app_provider.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  const QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> suraList = [];
  bool isLoading = true;
  late SuraArg args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // get args only once
    args = ModalRoute.of(context)?.settings.arguments as SuraArg;
    if (suraList.isEmpty && isLoading) {
      loadSura(args.index);
    }
  }

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
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .69,
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: provider.appTheme == ThemeMode.dark
                            ? MyTheme.goldColor
                            : MyTheme.primaryColor,
                      ),
                    )
                  : ListView.builder(
                      itemCount: suraList.length,
                      itemBuilder: (context, index) => Center(
                        child: Text(
                          textDirection: TextDirection.rtl,
                          "${suraList[index]}  {${index + 1}}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: provider.appTheme == ThemeMode.dark
                                    ? MyTheme.goldColor
                                    : MyTheme.darkColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void loadSura(int index) async {
    final content = await rootBundle.loadString(
      "assets/files/${index + 1}.txt",
    );
    // parse in background isolate
    suraList = await compute(parseSura, content);
    setState(() {
      isLoading = false;
    });
  }
}

// runs in a separate isolate
List<String> parseSura(String content) => content.split("\n");

class SuraArg {
  final String title;
  final int index;

  SuraArg({required this.title, required this.index});
}
