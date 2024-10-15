import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final void Function(int)? onTap;
  const CustomNavigationBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 60,
      buttonBackgroundColor: Colors.blue[700],
      color: const Color.fromARGB(255, 80, 81, 83),
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 500),
      onTap: onTap,
      items: const [
        Icon(Icons.home_rounded, color: Colors.white, size: 28),
        Icon(Icons.image_search_rounded, color: Colors.white, size: 28),
        Icon(Icons.category_outlined, color: Colors.white, size: 28),
      ],
    );
  }
}
