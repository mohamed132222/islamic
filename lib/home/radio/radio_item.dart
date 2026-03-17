import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:quran_app/home/radio/radio_response.dart';

import '../../MyTheme.dart';

class RadioItem extends StatelessWidget {
  Radio radio;
  AudioPlayer audioPlayer;

  RadioItem({required this.radio, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            radio.name ?? "",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  audioPlayer.play(UrlSource(radio.url!));
                },
                child: Icon(
                  Icons.play_arrow,
                  color: MyTheme.primaryColor,
                  size: 50,
                ),
              ),
              SizedBox(width: 30),
              InkWell(
                onTap: () {
                  audioPlayer.stop();
                },
                child: Icon(Icons.stop, color: MyTheme.primaryColor, size: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
