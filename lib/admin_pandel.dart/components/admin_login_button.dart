import 'package:flutter/material.dart';

class AdminLoginButton extends StatelessWidget {
 final Function()? onTap;
 final String text;
  const AdminLoginButton({
    super.key,required this.onTap,required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black),
        child:  Center(
            child: Text(
          text,
          style:const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "p", fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
