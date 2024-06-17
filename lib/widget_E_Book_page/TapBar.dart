import 'package:e_book/const/color.dart';
import 'package:e_book/widget_E_Book_page/AppTabs.dart';
import 'package:e_book/widget_E_Book_page/New_List.dart';
import 'package:e_book/widget_E_Book_page/Popular_List.dart';
import 'package:e_book/widget_E_Book_page/Trending_list.dart';
import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
  // * Define a ScrollController for controlling the scroll behavior
  late ScrollController _scrollController;

  // * Define a TabController for controlling the tabs
  late TabController _tabController;

  // Initialization method called when the object is first created
  @override
  void initState() {
    super.initState();

    // ~ Initialize the TabController with three tabs and set vsync for smooth animations
    _tabController = TabController(length: 3, vsync: this);

    // Initialize the ScrollController
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: sliverBackground,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TabBar(
                    indicatorPadding: EdgeInsets.all(10),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.only(right: 10),
                    controller: _tabController,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 7,
                          offset: const Offset(0, 0),
                        )
                      ],
                    ),
                    tabs: [
                      AppTabs(color: menu1Color, text: 'New'),
                      AppTabs(color: menu2Color, text: 'Popular'),
                      AppTabs(color: menu3Color, text: 'Trending'),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            New_List(
              x: false,
            ),
            Popular_List(),
            Trending_list(),
          ],
        ),
      ),
    );
  }
}


//! this is the using SingleChildScrollView in e_Book_home_page


/*// import 'package:e_book/const/color.dart';
// import 'package:e_book/widget/AppTabs.dart';
// import 'package:e_book/widget/New_List.dart';
// import 'package:e_book/widget/Popular_List.dart';
// import 'package:e_book/widget/Trending_list.dart';
// import 'package:flutter/material.dart';

// class TapBar extends StatefulWidget {
//   const TapBar({super.key});

//   @override
//   State<TapBar> createState() => _TapBarState();
// }

// class _TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {
//   // * Define a ScrollController for controlling the scroll behavior
//   late ScrollController _scrollController;

//   // * Define a TabController for controlling the tabs
//   late TabController _tabController;

//   // Initialization method called when the object is first created
//   @override
//   void initState() {
//     super.initState();

//     // ~ Initialize the TabController with three tabs and set vsync for smooth animations
//     _tabController = TabController(length: 3, vsync: this);

//     // Initialize the ScrollController
//     _scrollController = ScrollController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: sliverBackground, // Set the background color of the app bar
//           child: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 20),
//               child: TabBar(
//                 indicatorPadding: const EdgeInsets.all(10),
//                 indicatorSize: TabBarIndicatorSize.label,
//                 labelPadding: const EdgeInsets.only(right: 10),
//                 controller: _tabController,
//                 isScrollable: true,
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       blurRadius: 7,
//                       offset: const Offset(0, 0),
//                     )
//                   ],
//                 ),
//                 tabs: [
//                   AppTabs(color: menu1Color, text: 'New'),
//                   AppTabs(color: menu2Color, text: 'Popular'),
//                   AppTabs(color: menu3Color, text: 'Trending'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height - 200, // Adjust the height as needed
//           child: TabBarView(
//             controller: _tabController,
//             children: const [
//               New_List(),
//               Popular_List(),
//               Trending_list(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }*/
