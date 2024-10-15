import 'package:flutter/material.dart';

class AdminLoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const AdminLoginTextField({super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please, $hint ';
        }
        return null;
      },
      cursorColor: Colors.black,
      cursorWidth: 2,
      style: const TextStyle(color: Colors.black, fontFamily: "p", fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.black)),
        hintStyle: TextStyle(color: Colors.grey[500], fontFamily: "p", fontWeight: FontWeight.w600),
        hintText: hint,
      ),
    );
  }
}
