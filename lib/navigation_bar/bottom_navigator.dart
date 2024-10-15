// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:wallify/categories/categories_page.dart';
// import 'package:wallify/home/home_page.dart';
// import 'package:wallify/search/search_page.dart';

// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int currentIndex = 0;
//   List<Widget> pages = const [
//     HomePage(),
//     SearchPage(),
//     CategoriesPage(),
//   ];

//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: IndexedStack(
//                 index: currentIndex,
//                 children: pages,
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: CurvedNavigationBar(
//                 height: 60,
//                 buttonBackgroundColor: Colors.blue[700],
//                 color: Colors.grey[700]!,
//                 backgroundColor: Colors.transparent,
//                 animationDuration: const Duration(milliseconds: 500),
//                 onTap: onTap,
//                 index: currentIndex,
//                 items: const [
//                   Icon(Icons.home_rounded, color: Colors.white, size: 28),
//                   Icon(Icons.image_search_rounded, color: Colors.white, size: 28),
//                   Icon(Icons.category_outlined, color: Colors.white, size: 28),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wallify/navigation_bar/components/custom_navigation_bar.dart';
import 'package:wallify/categories/categories_page.dart';
import 'package:wallify/home/home_page.dart';
import 'package:wallify/search/search_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  late List<Widget> pages = const [HomePage(), SearchPage(), CategoriesPage()];

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: pages[currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
