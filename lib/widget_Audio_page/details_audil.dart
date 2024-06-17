import 'package:audioplayers/audioplayers.dart';
import 'package:e_book/widget_Audio_page/audio_file.dart';
import 'package:flutter/material.dart';

class details_audil extends StatefulWidget {
  const details_audil({
    super.key,
    required this.screanHeight,
    this.booksData,
    required this.index,
  });

  final booksData;
  final int index;

  final double screanHeight;

  @override
  State<details_audil> createState() => _details_audilState();
}

class _details_audilState extends State<details_audil> {
  late AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.screanHeight * 0.2,
      left: 0,
      right: 0,
      height: widget.screanHeight * 0.43,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: widget.screanHeight * 0.1,
            ),
            Text(
              widget.booksData[widget.index]['title'],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Avenir',
              ),
            ),
            Text(
              widget.booksData[widget.index]['text'],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            AudioFile(
              advancedPlayer: advancedPlayer,
              audioPath: this.widget.booksData[widget.index]['audio'],
            )
          ],
        ),
      ),
    );
  }
}
