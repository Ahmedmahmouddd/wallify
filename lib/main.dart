import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:wallify/admin_pandel.dart/add_wallpaper.dart';
import 'package:wallify/navigation_bar/bottom_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Wallify());
}

class Wallify extends StatelessWidget {
  const Wallify({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNav(),
    );
  }
}
