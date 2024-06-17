import 'package:e_book/const/color.dart';
import 'package:flutter/material.dart';

class image_Audio extends StatelessWidget {
  const image_Audio({
    super.key,
    required this.screanWidth,
    required this.screanHeight,
    this.booksData,
    required this.index,
  });

  final double screanWidth;
  final double screanHeight;
  final booksData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screanWidth * 0.2,
      left: (screanWidth - 150) / 2,
      right: (screanWidth - 150) / 2,
      height: screanHeight * 0.18,
      child: Container(
        decoration: BoxDecoration(
          color: audioGreyBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, style: BorderStyle.solid),
              image: DecorationImage(
                image: AssetImage(
                  booksData[index]['img'],
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
