import 'package:flutter/material.dart';

class HomePictureContainer extends StatelessWidget {
  const HomePictureContainer({
    super.key,
    required this.wallpaper,
  });

  final String wallpaper;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20), child: Image.asset(wallpaper, fit: BoxFit.cover)),
      ),
    );
  }
}
