// ignore_for_file: avoid_unnecessary_containers, unused_field, sort_child_properties_last

import 'package:e_book/const/color.dart';
import 'package:e_book/widget_E_Book_page/TapBar.dart';
import 'package:e_book/widget_E_Book_page/bar_home_page.dart';
import 'package:e_book/widget_E_Book_page/card_home_page.dart';
import 'package:flutter/material.dart';

class EBookHomePage extends StatelessWidget {
  const EBookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BarHomePage(),
              const SizedBox(height: 7),
              Container(
                padding: const EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Popular Book',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 8),
              const CardHomePage(),
              TapBar(),
            ],
          ),
        ),
      ),
    );
  }
}

//! this is the using SingleChildScrollView



/*// import 'package:e_book/const/color.dart';
// import 'package:e_book/widget/TapBar.dart';
// import 'package:e_book/widget/bar_home_page.dart';
// import 'package:e_book/widget/card_home_page.dart';
// import 'package:flutter/material.dart';

// class EBookHomePage extends StatelessWidget {
//   const EBookHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: background,
//       child: SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const BarHomePage(),
//                 const SizedBox(height: 7),
//                 Container(
//                   padding: const EdgeInsets.only(left: 12),
//                   alignment: Alignment.centerLeft,
//                   child: const Text(
//                     'Popular Book',
//                     style: TextStyle(
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 const CardHomePage(),
//                 SizedBox(height: 8),
//                 TapBar(), // TapBar is included here and scrollable
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }*/
