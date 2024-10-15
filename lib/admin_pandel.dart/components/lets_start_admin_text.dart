import 'package:flutter/material.dart';

class LetsStartAsAdmin extends StatelessWidget {
  const LetsStartAsAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Let's start as an\nadmin!",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: "p"),
      ),
    );
  }
}
