import 'dart:convert';

import 'package:flutter/material.dart';

class CardHomePage extends StatefulWidget {
  const CardHomePage({
    super.key,
  });

  @override
  State<CardHomePage> createState() => _CardHomePageState();
}

class _CardHomePageState extends State<CardHomePage> {
   late  List popularBook=[];

  ReadDate() async {
    //^ Reading data from JSON file for popular books
    await DefaultAssetBundle.of(context)
        .loadString('json/popularBooks.json')
        .then((s) {
          //^ Updating the page state with data read from the file
      setState(() {
        popularBook = json.decode(s);
      });
    });
  }
  @override
  void initState() {
    super.initState();
      // ^Calling the function to read data when the page is initialized
    ReadDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: -25,
            right: 0,
            child: Container(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.8),
                itemCount:  popularBook.length,
                itemBuilder: (_, index) {
                  return Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image:  DecorationImage(
                        image: AssetImage(popularBook[index]['img']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
