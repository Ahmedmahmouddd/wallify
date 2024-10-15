import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimatedIndicator extends StatelessWidget {
  const AnimatedIndicator({
    super.key,
    required this.activeindex,
    required this.wallpaperImages,
  });

  final int activeindex;
  final List wallpaperImages;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeindex,
      count: wallpaperImages.length,
      effect: WormEffect(activeDotColor: Colors.blue[700]!),
    );
  }
}
