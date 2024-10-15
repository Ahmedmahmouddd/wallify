import 'package:flutter/material.dart';
import 'package:wallify/categories/components/category_streambuilder.dart';
import 'package:wallify/home/components/custom_appbar.dart';
import 'package:wallify/methods/database_methods.dart';

class Allwallpaper extends StatefulWidget {
  final String title;
  const Allwallpaper({super.key, required this.title});

  @override
  State<Allwallpaper> createState() => _AllwallpaperState();
}

class _AllwallpaperState extends State<Allwallpaper> {
  Stream? categoryStream;

  getOnTheLoad() async {
    categoryStream = await DataBaseMethods().getCategory(widget.title);
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: CustomAppbar(title: widget.title),
        body: CategoryStreamBuilder(categoryStream: categoryStream));
  }
}
