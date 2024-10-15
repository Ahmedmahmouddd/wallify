import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.onSearchTap,
        required this.onCloseTap,

    required this.onSubmitted,
    required this.searchBool,
  });

  final TextEditingController searchController;
  final VoidCallback onSearchTap;
  final VoidCallback onCloseTap;

  final Function(String)? onSubmitted;
  final bool searchBool;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          onSubmitted: onSubmitted,
          controller: searchController,
          cursorColor: Colors.blue[800],
          style:
              TextStyle(color: Colors.grey[700], fontSize: 18, fontFamily: 'p', fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(top: 10, right: 12, left: 16),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: searchBool == false
                  ? GestureDetector(
                      onTap: onSearchTap,
                      child: Icon(Icons.image_search_rounded, color: Colors.grey[700], size: 26))
                  : GestureDetector(
                      onTap: onCloseTap, child: Icon(Icons.close, color: Colors.grey[700], size: 26)),
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
                color: Colors.grey, fontSize: 18, fontFamily: 'p', fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
