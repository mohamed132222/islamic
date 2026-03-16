import 'package:flutter/material.dart';
import 'package:quran_app/home/sebha/sebha_body.dart';
import 'package:quran_app/home/sebha/sebha_counter.dart';
import 'package:quran_app/home/sebha/tasbeh_text.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double turns = 0;
  int count = 0;
  String tasbeh_name = "";

  void rotate() {
    setState(() {
      turns += 1; // 1 = 360 degrees
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          GestureDetector(
            onTap: onSebhaTap,
            child: SebhaBody(turns: turns),
          ),

          SizedBox(height: 30),

          Text("عدد التسبيحات", style: Theme.of(context).textTheme.titleMedium),

          SizedBox(height: 30),

          SebhaCounter(count: count),

          SizedBox(height: 30),

          TasbehText(tasbeh: tasbeh_name),
        ],
      ),
    );
  }

  void onSebhaTap() {
    turns += 1;
    count++;

    if (count <= 33) {
      tasbeh_name = "سبحان الله";
    } else if (count <= 66) {
      tasbeh_name = "الحمد لله";
    } else if (count <= 99) {
      tasbeh_name = "الله أكبر";
    } else {
      count = 1;
      tasbeh_name = "سبحان الله";
    }

    setState(() {});
  }
}
