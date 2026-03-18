import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:quran_app/MyTheme.dart';
import 'package:quran_app/home/radio/radio_item.dart';
import 'package:quran_app/home/radio/radio_response.dart';

import '../../provider/app_provider.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = '/radio';

  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(flex: 2, child: Image.asset("assets/images/radio_image.png")),

        FutureBuilder(
          future: loadRadio(),
          builder: (context, snapshot) {
            var radio = snapshot.data?.radios ?? [];
            if (snapshot.hasData) {
              return Expanded(
                flex: 2,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      RadioItem(radio: radio[index], audioPlayer: audioPlayer),
                  itemCount: radio.length,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("Error loading radio");
            } else {
              return CircularProgressIndicator(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.goldColor
                    : MyTheme.primaryColor,
                padding: EdgeInsets.all(50),
              );
            }
          },
        ),
      ],
    );
  }

  Future<RadioResponse> loadRadio() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } else {
      throw Exception("Failed to load radio");
    }
  }
}
