// ignore_for_file: unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:e_book/const/color.dart';
import 'package:e_book/widget_Audio_page/BarAudioPage.dart';
import 'package:e_book/widget_Audio_page/details_audil.dart';
import 'package:e_book/widget_Audio_page/image_Audio.dart';
import 'package:e_book/widget_E_Book_page/New_List.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key, this.booksData, required this.index});

  final booksData;
  final int index;

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screanHeight = MediaQuery.of(context).size.height;
    final double screanWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screanHeight / 3,
            child: Container(
              color: audioBlueBackground,
            ),
          ),
          BarAudioPage(),
          details_audil(
            screanHeight: screanHeight,
            index: this.widget.index,
            booksData: this.widget.booksData,
          ),
          image_Audio(
            screanWidth: screanWidth,
            screanHeight: screanHeight,
            index: widget.index,
            booksData: widget.booksData,
          ),
          Positioned(
            top: screanHeight * 0.65,
            left: screanWidth * 0.03,
            right: 0,
            bottom: 0,
            child: Text(
              'All item',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: screanHeight * 0.7,
            left: 0,
            right: 0,
            bottom: 0,
            child: New_List(
              x: true,
            ),
          ),
        ],
      ),
    );
  }
}
