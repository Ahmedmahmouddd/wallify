import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wallify/home/components/animated_indicator.dart';
import 'package:wallify/home/components/custom_appbar.dart';
import 'package:wallify/home/components/home_picture_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeindex = 0;
  List wallpaperImages = [
    "assets/wallpaper1.jpg",
    "assets/wallpaper2.jpg",
    "assets/wallpaper3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: const CustomAppbar(title: "Wallify"),
          body: Column(
            children: [
              CarouselSlider.builder(
                itemCount: wallpaperImages.length,
                options: CarouselOptions(
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeindex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  return HomePictureContainer(wallpaper: wallpaperImages[index]);
                },
              ),
              const SizedBox(height: 16),
              AnimatedIndicator(activeindex: activeindex, wallpaperImages: wallpaperImages)
            ],
          )),
    );
  }
}
