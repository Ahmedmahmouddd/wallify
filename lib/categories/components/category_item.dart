import 'package:flutter/material.dart';
import 'package:wallify/categories/allwallpaper.dart';

class CategoryItem extends StatelessWidget {
  final String image, title;
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Allwallpaper(title: title);
        }));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image,
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                      color: Colors.black38, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                      child: Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'p'),
                  )),
                )
              ],
            )),
      ),
    );
  }
}
