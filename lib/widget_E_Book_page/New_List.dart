import 'dart:convert';

import 'package:e_book/const/color.dart';
import 'package:e_book/screan/Audio_page.dart';
import 'package:flutter/material.dart';

class New_List extends StatefulWidget {
  const New_List({super.key, required this.x});
  final bool x;

  @override
  State<New_List> createState() => _New_ListState();
}

class _New_ListState extends State<New_List> {
  late List Book = [];

  ReadDate() async {
    //^ Reading data from JSON file for popular books
    await DefaultAssetBundle.of(context)
        .loadString('json/books.json')
        .then((s) {
      //^ Updating the page state with data read from the file
      setState(() {
        Book = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadDate();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: widget.x == false ? Axis.vertical : Axis.horizontal,
      itemCount: Book.length,
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AudioPage(
                    booksData: Book,
                    index: index,
                  );
                },
              ),
            );
          },
          child: Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: tabVarViewColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(Book[index]['img']),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_outlined,
                              size: 24,
                              color: starColor,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              Book[index]['rating'],
                              style: TextStyle(
                                color: menu2Color,
                              ),
                            )
                          ],
                        ),
                        Text(
                          Book[index]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Avenir",
                          ),
                        ),
                        Text(
                          Book[index]['text'],
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Avenir",
                            color: subTitleText,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.5),
                            color: loveColor,
                          ),
                          child: Text(
                            'Love',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Avenir",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
