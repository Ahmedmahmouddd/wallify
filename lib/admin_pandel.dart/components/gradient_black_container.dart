import 'package:flutter/material.dart';

class GradientBlackContainer extends StatelessWidget {
  const GradientBlackContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
      padding: const EdgeInsets.only(top: 45, right: 20, left: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 61, 61, 61), Color.fromARGB(255, 0, 0, 0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.vertical(top: Radius.elliptical(250, 50))),
    );
  }
}
