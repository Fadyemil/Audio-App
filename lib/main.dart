import 'package:e_book/screan/e_book_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EBook());
}

class EBook extends StatelessWidget {
  const EBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EBook',
      home: EBookHomePage(),
    );
  }
}
