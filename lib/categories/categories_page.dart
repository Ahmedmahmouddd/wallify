import 'package:flutter/material.dart';
import 'package:wallify/categories/components/category_item.dart';
import 'package:wallify/home/components/custom_appbar.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryItem> categories = const [
    CategoryItem(image: "assets/wildlife.png", title: "Wild life"),
    CategoryItem(image: "assets/cars.jpg", title: "Cars"),
    CategoryItem(image: "assets/city.jpg", title: "City"),
    CategoryItem(image: "assets/anime.png", title: "Anime"),
    CategoryItem(image: "assets/nature.jpg", title: "Nature"),
    CategoryItem(image: "assets/food.jpg", title: "Food")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey[200],
          appBar: const CustomAppbar(title: "Categories"),
          body: ListView.separated(
            padding: const EdgeInsets.only(bottom: 16),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return categories[index];
            },
          )),
    );
  }
}
